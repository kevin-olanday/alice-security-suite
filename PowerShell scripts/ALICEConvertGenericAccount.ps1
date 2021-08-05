#Inputs from the web application. 'Name' is the name of the generic account. 'userName' is the account logged in Alice.
param([String]$name,[string]$userName)

#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")

#Creates a function to be used for converting generic account.
function Convert-GenericAccount {
    param($name,$username)   

	#Searches AD for the account
    $account = ([adsisearcher]"(|(name=$name)(displayname=$name)(samaccountname=$name))").findone()

    #If the account exists...
    if($account)
    {
        #Display confirmation and details on the account
		$accountdecription = $account.properties.description 
        $accountdetails = "Found $name - $accountdecription "
        
		#To confirm that this is a user account and not a group
		if($account.properties.objectclass -contains "user")
        {      
		
		#Members of this group are considered Non interactive and have restricting group policies assigned to them.
	    $adgroup = "SGG-ITG-ITS-WSG_NonInteractiveServiceAcc"
		
		#Retrieves the ADSI properties of the account and the group
	    $accountDN = $account.Properties.distinguishedname
	    $groupDN = ([adsisearcher]"name=$adgroup").findone().Properties.distinguishedname
	
	    $group = [ADSI]"LDAP://$($groupDN)"           
	    $account = [ADSI]"LDAP://$($accountDN)"
        
	    #Creates a directory entry to allow us to move the object to another OU
        $Object = New-Object -TypeName System.DirectoryServices.DirectoryEntry("LDAP://$accountDN")
		
		#Check if the account is a member of the group.
 	    $ismember = $group.IsMember($account.ADsPath)

            try{
				
				#If the account is non-interactive...
                if ($ismember)
                {
					#Remove the SGG group
					$group.Remove($account.ADsPath) | out-null
					
					#Specify the target OU
					$TargetOU = "OU=Generics,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com"
					$TargetOU = New-Object -TypeName System.DirectoryServices.DirectoryEntry("LDAP://$TargetOU")	
					
					#Move the account to the 'interactive' OU
					$Object.psbase.MoveTo($TargetOU)
						   
					#Display results to the web application
					$result = "$name has been converted and is now an interactive account!"
					
					#Write entry to the logs
					Write-Log -messagetype Success -message "Converted $name from non-interactive to interactive" -username $username
	            }
	        else #If the account is interactive...
                { 
					#Add the SGG group
        	        $group.add($account.ADsPath)  | out-null

					#Specify the target OU
					$TargetOU = "OU=Non Interactive Admins,OU=Accounts,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com"
					$TargetOU = New-Object -TypeName System.DirectoryServices.DirectoryEntry("LDAP://$TargetOU")	
		            
					#Move the account to the 'non-interactive' OU
					$Object.psbase.MoveTo($TargetOU)			
		            
					#Display results to the web application
                    $result = "$name has been converted and is now a non-interactive account!"

					#Write entry to the logs
               	    Write-Log -messagetype Success -message "Converted $name from interactive to non-interactive" -username $username

	            }
            }
            catch
            {
				#Display results to the web application
                $errormessage = $_.exception.message
                $errormessage | out-string
                return
            }
        }
        else #if the account is not a user (as all generic accounts are)
        {
            $result = "$name is not a generic account!"
        }
    }
    else #if the account is not found in AD
    {
        $result = "$name does not exist!"
    }
$accountdetails | out-string
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


#Convert the generic account
Convert-GenericAccount $name $username






