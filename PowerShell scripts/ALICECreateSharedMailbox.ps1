# Inputs from the web application
param([String]$mailboxName,[String]$alias,[String]$INC,[String]$owner,[String]$pbo,[String]$group,[String]$approvers,[String]$fullaccessMembers)
    
# Loads the Quest Cmdlets
Add-PSSnapin Quest.ActiveRoles.ADManagement -EA SilentlyContinue 


function Create-SharedMailbox
{
    param([String]$mailboxName,[String]$alias,[String]$INC,[String]$owner,[String]$pbo,[String]$group,[String]$approvers,[String]$fullaccessMembers)

    if(get-qaduser -name $mailboxname)
	{
		$result = "$mailboxname already exists." 
        $result | out-string
		return
	}

    $sendasGroup = "MB_" + $mailboxName + "_S"
    $fullaccessGroup = "MB_" + $mailboxName + "_F"

    if($fullaccessmembers){
        $fullaccessmemberlist = $fullaccessmembers.split("`n").Trimend("")
    }  
    
    # Create Send As permission group
    New-QADGroup -name $sendAsGroup -DisplayName $sendAsGroup -SamAccountName $sendasGroup -GroupScope Universal -ParentContainer 'OU=Exchange,OU=Data Management Groups,OU = Exceptions,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Notes ("Approver: " + $approvers + "`r`n" + "Send As Access to: " + $mailboxName ) -ManagedBy $approvers | out-null
    $SendAsresult = "Created Send As Group - $sendAsGroup."
    while(!(Get-Qadgroup $sendasGroup)){}

    # Add Send As permission group members
    foreach($fullaccessmember in $fullaccessmemberlist)
    {
       Add-QADGroupMember $sendasGroup $fullaccessmember | out-null
    }

    $sendasgroupmembers = Get-QADGroupMember $sendasgGroup | select name -expandproperty name
    
    if($sendasgroupmembers)
    {
        $result = $result + " The following users were added: $sendgroupmembers."
    }
  
    # Create Full Access permission group
    New-QADGroup -name $fullAccessGroup -DisplayName $fullAccessGroup -SamAccountName $fullAccessGroup -GroupScope Universal -ParentContainer 'OU=Exchange,OU=Data Management Groups,OU = Exceptions,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Notes ("Approver: " + $approvers + "`r`n" + "Full Access to: " + $mailboxName ) -ManagedBy $approvers | out-null
    $result = $result + " Created Full Access Group - $fullAccessGroup."
    while(!(Get-Qadgroup $fullAccessgroup)){}

    # Add Full Access permission group members  
    foreach($fullaccessmember in $fullaccessmemberlist)
    {
       Add-QADGroupMember $fullAccessgroup $fullaccessmember | out-null
    }

    $fullaccessgroupmembers = Get-QADGroupMember $fullaccessGroup | select name -expandproperty name
    
    if($fullaccessgroupmembers)
    {
        $result = $result + " The following users were added: $fullaccessgroupmembers."
    }
  
  
    # Creates a new ps session on the an exchange 2010 server
      $exserver = "whkgasp2164"
     $global:exSession = New-PSSession -ConfigurationName Microsoft.Exchange.Provisioning -ConnectionUri "http://$($exserver)/PowerShell/?SerializationLevel=Full" -Authentication default
   if(-not($?))
    {
      $result = $result + " " + $error[0].Exception | out-string
      $result | out-string
      return
    }

    else
    {
        try
        {	
            # Imports all modules and commandlets from an exchange 2010 server to allow ALICE to use exchange commandlets remotely.
            Import-PSSession $exsession -CommandName "Get-Mailbox","New-Mailbox","Set-Mailbox","Enable-DistributionGroup","Add-MailboxPermission","Add-ADPermission" | out-null 
            #Get-mailbox "kolanday" | select name | out-string
            #Remove-PsSession *
            #return


            # Create Shared Mailbox
            New-Mailbox -Name $mailboxName -Alias $alias -OrganizationalUnit 'pc.internal.macquarie.com/ITS Security/Accounts/Mailboxes' -UserPrincipalName ($alias + "@pc.internal.macquarie.com") -SamAccountName $alias -FirstName '' -Initials '' -LastName '' -Shared | out-null
            $result = $result + " Created $mailboxname. "

            # Setting custom attributes
            Set-Mailbox -CustomAttribute1 'S' -CustomAttribute3 "Owner: $owner" -CustomAttribute4 "Cost Center: $PBO" -Identity $mailboxName | out-null
            $result = $result + " Set custom attributes."

            # Enable distribution groups
            Enable-DistributionGroup -Identity $sendasgroup -Alias ("MB_"+ $alias + "_S") | Out-Null
            Enable-DistributionGroup -Identity $fullaccessgroup -Alias ("MB_"+ $alias + "_F") | Out-Null
       
            # Add Mailbox Permissions
            Add-MailboxPermission -Identity $mailboxname -User $fullaccessgroup -accessrights fullaccess | Out-Null 
            Add-ADPermission -Identity $mailboxname -User $sendasgroup -ExtendedRights 'Send-As'| Out-Null
            $result = $result + " Added permissions to permission groups."

        }
        catch
        {
            $errormessage = $_.exception.message
            $errormessage | out-string
            Remove-PSSession $session
            return
        }

  
    While(!(Get-Qaduser $mailboxName)){}

    # Set Mailbox AD details
    Set-QADuser $mailboxName -title $group -Description $Inc | out-null
           
    # Remove created session
    Remove-PsSession *
    $SendAsresult | out-string
    $result | out-string
   }
}  

Create-SharedMailbox $mailboxName $alias $inc $owner $pbo $group $approvers $fullaccessMembers