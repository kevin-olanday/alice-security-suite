# Inputs from the web application. 
#'name' is the name of the account to be granted partner access
#'password' is the password to set after creating the partner account
#'type' is the type of account to be created. (User or generic)
#'userName' is the account logged in Alice.

param([String]$name,[String]$password,[String]$type,[Switch]$changepw,[String]$userName)

# Loads the Quest Active Roles Cmdlets for AD Management 
Add-PSSnapin Quest.ActiveRoles.ADManagement

#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")


function Create-PartnerAccount {

    param([String]$name,[String]$password,[String]$type,[Switch]$changepw)
    

    if($type -eq "user")
    {
        $ntadminAccount = (get-qaduser $name | ?{($_.name -eq $name) -or ($_.samaccountname -eq $name)})
        if(!$ntadminAccount) 
        {
             $result = "$name does not exists in the NTADMIN domain. Please choose an account that exists in NTADMIN."
             $result | out-string
             Write-Log -messagetype Warning -message "Tried to create a PARTNER account for $name but $name does not exists in NTADMIN." -username $username
             return
        }

        else
        {
           
            try
            { 
                $partnerAccount =  "x" + $name
                $firstname = ($ntadminAccount | select -ExpandProperty firstname | out-string).trimend("")
                $lastname = ($ntadminAccount| select -ExpandProperty lastname | out-string).trimend("")

                Connect-QADService -service partner.macquarie.com | Out-Null

                if(Get-Qaduser $partnerAccount)
                {
                    $result = "$partnerAccount already exists in the PARTNER domain."
                    $result | out-string
                    Write-Log -messagetype Warning -message "Tried to create user account - $partnerAccount - in the PARTNER domain but it already exists." -username $username
                    return

                }
            
                else
                {

                    if($changepw)
                    {
                        New-QADUser -name $partnerAccount -FirstName $firstname -lastname $lastname -DisplayName $partnerAccount -UserPrincipalName ($partnerAccount + '@partner.macquarie.com') -ParentContainer 'OU=MGL,OU=Admins,OU=Users,OU=Resources,DC=partner,DC=macquarie,DC=com' -samAccountName $partnerAccount -UserPassword $Password | Set-QADUser  -UserMustChangePassword $true | Out-Null
                        $result = "Created user - $partnerAccount - in the PARTNER domain. User must change their password upon initial logon."
                        Write-Log -messagetype Success -message "Created user - $partnerAccount - in the PARTNER domain. User must change their password upon initial logon." -username $username
                    }

                    else
                    {
                        New-QADUser -name $partnerAccount -FirstName $firstname -lastname $lastname -DisplayName $partnerAccount -UserPrincipalName ($partnerAccount + '@partner.macquarie.com') -ParentContainer 'OU=MGL,OU=Admins,OU=Users,OU=Resources,DC=partner,DC=macquarie,DC=com' -samAccountName $partnerAccount -UserPassword $Password | Set-QADUser -PasswordNeverExpires $true -UserMustChangePassword $false | Out-Null
                        $result = "Created user - $partnerAccount - in the PARTNER domain. Password has been set."
                        Write-Log -messagetype Success -message "Created user - $partnerAccount - in the PARTNER domain. Password has been set." -username $username
                    }
                }
            }
            catch
            {
                $errormessage = $_.exception.message
                $errormessage | out-string
                Write-Log -messagetype Error -message "Error encountered while creating $name : $errormessage" -username $username
                return

            }

        }
    }
    
    elseif ($type -eq "generic")
    {
          
        try
        { 
            $partnerAccount =  $name    

            Connect-QADService partner.macquarie.com | Out-Null

            if(Get-Qaduser $partnerAccount)
            {
                $result = "$partnerAccount already exists in the PARTNER domain."
                $result | out-string
                 Write-Log -messagetype Warning -message "Tried to create generic account - $partnerAccount - in the PARTNER domain but it already exists." -username $username

                return
            }
            
            else
            {
                if($changepw)
                {
                    
                    New-QADUser -name $partnerAccount  -DisplayName $partnerAccount -UserPrincipalName ($partnerAccount + '@partner.macquarie.com') -ParentContainer 'OU=MGL,OU=Generic,OU=Users,OU=Resources,DC=partner,DC=macquarie,DC=com' -samAccountName $partnerAccount -UserPassword $Password | Set-QADUser  -UserMustChangePassword $true | Out-Null
                    $result = "Created generic account - $partnerAccount - in the PARTNER domain. User must change their password upon initial logon."
                    Write-Log -messagetype Success -message "Created generic account - $partnerAccount - in the PARTNER domain. User must change their password upon initial logon." -username $username

                }

                else
                {
                    New-QADUser -name $partnerAccount  -DisplayName $partnerAccount -UserPrincipalName ($partnerAccount + '@partner.macquarie.com') -ParentContainer 'OU=MGL,OU=Generic,OU=Users,OU=Resources,DC=partner,DC=macquarie,DC=com' -samAccountName $partnerAccount -UserPassword $Password | Set-QADUser -PasswordNeverExpires $true -UserMustChangePassword $false | Out-Null
                    $result = "Created  generic account - $partnerAccount - in the PARTNER domain. Password has been set."
                    Write-Log -messagetype Success -message "Created generic account - $partnerAccount - in the PARTNER domain. Password has been set." -username $username
                }
            }
         }
         
         catch
         {
            $errormessage = $_.exception.message
            $errormessage | out-string
            Write-Log -messagetype Error -message "Error encountered while creating $name : $errormessage" -username $username
            return
         }
    }

    $result | out-string
    Disconnect-QadService
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

if($changepw -eq "TRUE")
{
    Create-PartnerAccount -name $name -password $password -type $type -changepw
}
else
{
    Create-PartnerAccount -name $name -password $password -type $type
}