# Inputs from the web application
param([String]$mailboxName,[String]$alias,[String]$INC,[String]$owner,[String]$pbo,[String]$approvers,[String]$authors,[String]$editors,[String]$username)
    
# Loads the Quest Cmdlets
Add-PSSnapin Quest.ActiveRoles.ADManagement -EA SilentlyContinue 


# Load Log directory
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")



function Create-ResourceCalendar
{
    param([String]$mailboxName,[String]$alias,[String]$INC,[String]$owner,[String]$pbo,[String]$approvers,[String]$authors,[String]$editors,[String]$username)


    if(!$mailboxName)
    {
        return
    }


    if(get-qaduser -name $mailboxname)
	{
		$result = "$mailboxname already exists." 
        $result | out-string
        write-Log -messagetype Warning -message "Tried to create $mailboxname but the object already exists." -username $userName
		return
	}

    $editorGroup = "RS_" + $mailboxName + "_E"
    $authorGroup = "RS_" + $mailboxName + "_A"

    if($authors){
        $authorlist = $authors.split("`n").split(";").Trimend("")
    }  

    if($editors){
        $editorlist = $editors.split("`n").split(";").Trimend("")
    }  

    
    # Create Editor group
     New-QADGroup -name $editorGroup -DisplayName $editorGroup -SamAccountName $editorGroup -ParentContainer 'OU=Mailboxes,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Notes ("Approver: " + $approvers + "`r`n" + "Editor Access to: " + $mailboxName ) -groupscope "universal" | out-null
   
    while(!(Get-Qadgroup $editorGroup)){}
    $result = $result + "Created $editorgroup. "

    foreach($editor in $editorlist)
    {
       Add-QADGroupMember $editorGroup $editor | out-null
    }

    
    $editorgroupmembers = Get-QADGroupMember $editorGroup | select name -expandproperty name
    
    if($editorgroupmembers)
    {
        $result = $result + " The following users were added: $editorgroupmembers."
    }
        
    # Create Author group
     New-QADGroup -name $authorGroup -DisplayName $authorGroup -SamAccountName $authorGroup -ParentContainer 'OU=Mailboxes,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Notes ("Approver: " + $approvers + "`r`n" + "Author Access to: " + $mailboxName ) -groupscope "universal" | out-null
    
    while(!(Get-Qadgroup $authorGroup)){}
    $result = $result + "Created $authorgroup. "

    foreach($author in $authorlist)
    {
       Add-QADGroupMember $authorGroup $author | out-null
    }

    $authorgroupmembers = Get-QADGroupMember $authorGroup | select name -expandproperty name
    
    if($authrrgroupmembers)
    {
        $result = $result + " The following users were added: $authorgroupmembers."
    }


    $exserver = "whkgasp2163"
    $session = New-PSSession -ConfigurationName Microsoft.Exchange -connectionURI http://$($exserver)/PowerShell	  
	
    if(-not($?))
    {
      $result = $result + " " + $error[0].Exception | out-string
      $errormessage = $error[0].Exception 
      $result | out-string
      Write-Log -messagetype Error -message "Failed creating $groupName - $errormessage" -username $username
      return
    }

    else
    {
        try
        {
            # Imports all modules and commandlets from an exchange 2010 server to allow ALICE to use exchange commandlets remotely.
	        Import-PSSession $session -allowclobber | out-null

        
            # Create Resource Calendar
             New-Mailbox -Name $mailboxName -Alias $alias -OrganizationalUnit 'pc.internal.macquarie.com/ITS Security/Accounts/Mailboxes' -UserPrincipalName ($alias + "@pc.internal.macquarie.com") -SamAccountName $alias -FirstName '' -Initials '' -LastName '' -Room | out-null
            $result = $result + "Created Resource Calendar - $mailboxname!" 
      
            # Setting custom attributes
            Set-Mailbox -CustomAttribute1 'R' -CustomAttribute3 "Owner: $owner" -CustomAttribute4 $PBO -Identity $mailboxName | out-null
        
            # Enable distribution groups
            Enable-DistributionGroup -Identity $authorgroup -Alias ("RS_"+ $alias + "_A") | out-null
            Enable-DistributionGroup -Identity $editorgroup -Alias ("RS_"+ $alias + "_E") | out-null
       
            # Set Calendar processing
 
       
            do{   
                Set-CalendarProcessing $mailboxName -AutomateProcessing 'AutoAccept' -AllBookInPolicy $true | out-null
              }until($?)
    
            # Add Mailbox Permissions 
            $calendar = $alias + ":\Calendar"
           Add-MailboxFolderPermission -Identity $calendar -User $authorGroup -AccessRights author | out-null
           Add-MailboxFolderPermission -Identity $calendar -User $editorGroup -AccessRights editor | out-null    
        }
        catch
        {
            $errormessage = $_.exception.message
            $errormessage | out-string
            Write-Log -messagetype Error -message "Failed creating $groupName - $errormessage" -username $username
            Remove-PSSession $session
            return
        }
    }
     Remove-PsSession *
    $result | out-string

    Write-Log -messagetype Success -message $result -username $username
}



function Write-Log
{
    Param ([string]$MessageType, [string]$Message, [string]$Username, [switch]$Overwrite)
		
   $LogFile = $global:strLogFile

   if (! [string]::IsNullOrEmpty($LogFile))
   {
        $strDate = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
	    $ToWrite = "$($strDate) | $($MessageType) | $($Message) | $($username)"
		
    	if ($Overwrite)
     	{
	    	$ToWrite | Out-File -FilePath $LogFile
		}
			
        else
		{
			$ToWrite | Out-File -FilePath $LogFile -Append
		}
	}

	if ($verbose)
	{
		switch ($MessageType)
		{
			"Error" { Write-Host $Message -ForegroundColor Red }
			"Warning" { Write-Host $Message -ForegroundColor DarkYellow }
			"Success" { Write-Host $Message -ForegroundColor Green }
			default { Write-Host $Message }
		}
	}
}

Create-ResourceCalendar $mailboxname $alias $inc $owner $pbo $approvers $authors $editors $username