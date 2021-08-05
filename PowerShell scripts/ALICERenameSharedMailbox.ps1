# Inputs from the web application. 
#'mailboxName' is the name of the mailbox to be renamed
#'newName' is the desired new name of the mailbox
#'userName' is the account logged in Alice.

param([String]$mailboxName,[String]$newName,[String]$userName)
    

# Loads the Quest Active Roles Cmdlets for AD Management
Add-PSSnapin Quest.ActiveRoles.ADManagement -EA SilentlyContinue 


#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")

function Rename-Mailbox{
    param([String]$mailboxName,[String]$newName)
   
    #Check if mailbox exists
    $mailbox = get-qaduser $mailboxName
    
    #Check if the new Name is taken
    $newNameCheck = (get-qaduser $newName | ?{($_.name -eq $newName) -or ($_.samaccountname -eq $newName)})

    #If the new Name is taken
    if($newNameCheck)
    {
        #Display the results to the web application.
        $result = "$newName is taken. Please use another name."
        $result | out-string

        Write-Log -messagetype Warning -message "Tried to rename $mailbox to $newName but $newName exists as a separate entity." -username $username
        return        
    }

    #Create a new alias by removing spaces from the new name provided.
    $alias =  $newName.replace(" ","")

   
    #If the alias exceeds the 20 character  limit, use the first 20 characters.
    if($newname.length -gt 20) {
        $alias = $alias.substring(0,19)

    }
    else
    {
        $alias = $newName.replace(" ","")
    }

    #If the requested alias is already taken, replace the last letter by a number to create a unique identifier.
    if(get-qaduser $alias)
    {
        for($i=2;$i -le 9; $i++)
        {
           $alias = replace($alias.substring(($alias.length -1)),$i)
              
           if(!(get-qaduser $alias))
           {
               break
           }
         }
    }

    #The permission groups associated with the requested mailbox
    $fullaccess = "MB_" + $mailboxName + "_F"
    $sendas = "MB_" + $mailboxName + "_S"

    #The expected new names for the permission groups
    $newfullaccess =  "MB_" + $newName + "_F"
    $newsendas = "MB_" + $newName + "_S"
   
   
    $fullaccessgroup =  get-qadgroup $fullaccess
    $sendasgroup = get-qadgroup $sendas
   
    #If the mailbox exists....
    if($mailbox)
    {

      #Rename the object to the new Name specified.
      Rename-QADObject $mailbox -NewName $NewName | Out-Null
      do{}until(get-qaduser $NewName)
      Set-QADuser $NewName -DisplayName $NewName -SamAccountName $alias | out-null

      #If the rename is successful...
      if((Get-qaduser $NewName))
      {
        $result = "$mailboxName has been renamed to $NewName."
        Write-Log -messagetype Success -message "$mailboxName has been renamed to $NewName." -username $username
      }

      #If the expected full access group was not found....
      if(!$fullaccessgroup)
      {
        $result = $result + " Did not find Full Access Group. Please rename it manually."
        Write-Log -messagetype Warning -message "Tried to rename $fullaccess but it was not found in Active Directory" -username $username
      }
      else
      {

        #Rename the send as group and Update the 'notes' to reflect the change.
        $approvers = (get-qadgroup $fullaccessgroup).managedby.split(",")[0].replace("CN=","")
        Rename-QADObject $fullaccessgroup -newname $newfullaccess | Set-Qadgroup -DisplayName $newfullaccess -SamAccountName $newfullaccess -notes ("Approver: " + $approvers + "`r`n" + "Full Access to: " + $NewName) -ManagedBy $approvers | out-null
        
        #If the rename is successful...
        if(Get-qadgroup $newfullaccess)
        {
           $result = $result + "Renamed Full access group - $fullaccessgroup - to $newfullaccess."
           Write-Log -messagetype Success -message "Renamed Full access group - $fullaccess - to $newfullaccess." -username $username
        }
      }

      #If the expected send as group was not found....
      if(!$sendasgroup)
      {
        $result = $result + " Did not find Send As Group. Please rename it manually."
        Write-Log -messagetype Warning -message "Tried to rename $sendas but it was not found in Active Directory" -username $username
      }

      else
      {

        #Rename the send as group and Update the 'notes' to reflect the change.
        $approvers = (get-qadgroup $sendasgroup).managedby.split(",")[0].replace("CN=","")
        Rename-QADObject $sendasgroup -newname $newsendas | Set-Qadgroup -DisplayName $newsendas -SamAccountName $newsendas -notes ("Approver: " + $approvers + "`r`n" + "Send As Access to: " + $NewName) -ManagedBy $approvers | out-null
     
        #If the rename is successful...
         if(Get-qadgroup $newsendas)
          {
             $result = $result + "Renamed Send As group - $sendasgroup - to $newsendas."
             Write-Log -messagetype Success -message "Renamed Send As group - $sendas - to $newsendas." -username $username
          }
      }


     
    }
    else #if mailbox does not exists...
    {
    $result = "$mailboxName does not exist!" 
    }

    #Display the results to the web application
    $result | out-string
 }


# A function for updating the log file generated
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

 Rename-Mailbox -mailboxname $mailboxname -newname $newName 