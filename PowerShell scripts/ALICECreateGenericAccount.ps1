<#
Inputs from the web application. 
'name' is the name of the generic account
'domain' is the application domain listed in the macsec record.
'inc' is ticket logged for the creation of the account.
'interactive' is a switch parameter that dictates if the account is interactive or otherwise.
'userName' is the account logged in Alice.
#>


param([String]$name,[String]$domain,[String]$inc,[String]$password,[string]$interactive,[String]$username)

#Loads the Quest Active Roles Cmdlets for AD Management.
Add-PSSnapin Quest.ActiveRoles.ADManagement


#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")


#If the domain was not specified...
if (!$domain)
{
   $result = "Please enter a domain!"
   $result | out-string
   return
}

#If no password was specified...
if (!$password)
{
   $result = "Please enter a password!"
   $result | out-string
   return
}




###########################

#Creates a function for creating generic accounts
function Create-GenericAccount {
    param([string]$name,[string]$domain,[string]$inc,[string]$password,[switch]$interactive)   


    #Check if the account already exists.
    if(Get-qaduser $name | ?{$_.name -eq $name -or $_.samaccountname -eq $name})
    {

     #If so, display the results on the web application and terminate the script.
     $result = "$name already exists!"
     $result  | out-string
     Write-Log -messagetype Warning -message "Tried to create generic account $name but it already exists." -username $username
     return
    }


    #If the requested name is longer than 20 characters, the samaccountname will be the first 20 characters to comply with the character limit.
    if($name.length -gt 20) {
	$samAccountName = $name.substring(0,20)

	if(Get-qaduser $samAccountName | ?{$_.name -eq $samaccountname -or $_.samaccountname -eq $samaccountname})
	{
		$samAccountName = $name.substring(0,19)
	}


	}
    
   else{
            $samAccountName = $name
    }
	


    try{
        #If the account is interactive...
        if($interactive)
        {
             #Create the account in the Generics OU
             New-QADUser -name $name -DisplayName $name -UserPrincipalName ($samAccountname + '@pc.internal.macquarie.com') -Description $domain -ParentContainer 'OU=Generics,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -samAccountName $samAccountName -UserPassword $Password | Set-QADUser -PasswordNeverExpires $true | Out-Null
            
             #Display the results on the web application
             $result = "Created generic account $name and set up as interactive."
             $result | out-string
             Write-Log -messagetype Success -message "Created generic account $name and set up as interactive." -username $username
             return
        }
        else #if the account is non-interactive
        {
             #Create the account in the Non Interactive Admins OU
             New-QADUser -name $name -DisplayName $name -UserPrincipalName ($samAccountName  + '@pc.internal.macquarie.com') -Description $domain -ParentContainer 'OU=Non Interactive Admins,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -samAccountName $samaccountname -UserPassword $Password | Set-QADUser -PasswordNeverExpires $true | Out-Null

             #Adds the account to the Non-Interactive SGG group to control permissions based on the policies
             Add-QADGroupMember SGG-ITG-ITS-WSG_NonInteractiveServiceAcc $name | out-null
    	     
             #Display the results on the web application
             $result = "Created generic account $name and set up as non-interactive."
             $result | out-string
             Write-Log -messagetype Success -message "Created generic account $name and set up as non-interactive." -username $username
             return

        }
    }
    catch #if there are any errors
    {
        
        #Display the results on the web application
        $errormessage = $_.exception.message
        $errormessage | out-string
        Write-Log -messagetype Error -message "Error encountered while creating $name : $errormessage" -username $username
        return

    }

}


###########################

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

###########################

#If the interative checkbox is checked...
if($interactive -eq "TRUE")
{
    #Create an interative generic account
    Create-GenericAccount $name $domain $inc $password -interactive
}
else
{
    #Create a non0interative generic account
    Create-GenericAccount $name $domain $inc $password 
}


