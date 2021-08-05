<#
Inputs from the web application.
'groupname' of tis the name of the AD group to be created
'description' is the description to be added to the ad object
'notes' will contain any info provided by the user about the ad object
'managedby' will be the managers of the group
'members' are the users to be granted membership to the group
'type' is the type of group to be created (e.g. ACG, APP, DG, etc)
'userName' is the account logged in Alice
#>

param([String]$groupname,[String]$description,[String]$notes,[String]$managedby,[string]$members,[String]$type,[String]$username)

#Loads the Quest Active Roles Cmdlets for AD Management.
Add-PSSnapin Quest.ActiveRoles.ADManagement

#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")


#Creates a function for creating AD groups
function Create-AD_group {
	param($groupname,$description,$notes,$managedby,$members,$type,$username)
	

	
        #Check if the account already exists.
	if(get-qadgroup -name $groupname)
	{
          	#If it doesn't, display the results on the web application and terminate the script.
		$result = "$groupname already exists." 
      		$result | out-string

		#Write entry to the logs
		write-Log -messagetype Warning -message "Tried to create $groupName but the object already exists." -username $userName
		return
	}	
	
	#Check if the delegated group manager exists.
	if(!(get-qadgroup -name $managedby))
	{
	        #If it doesn't, display the results on the web application and terminate the script.
		$result = "$managedBy is not a valid group!"
        	$result | out-string

		#Write entry to the logs
		write-Log -messagetype Warning -message "Tried to create $groupName but the managedby entry - $managedby - is not a valid group." -username $userName
		return
	}


	try
    {

	#Create a group based on the type requested. The group will be created in its corresponding OU.
	      switch($type)
        {
	    #For account groups
            acg  {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -ParentContainer 'OU=Account Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created account group - $groupname - and set up as requested."
                 }
       	    #For application access groups
	    agg  {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -ParentContainer 'OU=Application Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created application access group - $groupname - and set up as requested."
                 }
            #For application deployment groups
            app  {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -ParentContainer 'OU=Application Secure,OU=Application Deployment,OU=Application Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created application deployment group - $groupname - and set up as requested."
                 }
	    #For distribution groups
            dg   {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Distribution' -groupscope 'Universal' -ParentContainer 'OU=Distribution Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $groupname | out-null
                $result = "Created distribution group - $groupname - and set up as requested."
                
		#Enables the DL in Exchange 2010
		$exserver = "whkgasp2163"
     	        $global:exSession = New-PSSession -ConfigurationName Microsoft.Exchange.Provisioning -ConnectionUri "http://$($exserver)/PowerShell/?SerializationLevel=Full" -Authentication default
 	        while(!(Get-Qadgroup $groupname)){}
                if(-not($?))
    		{
   		$result = $result + " " + $error[0].Exception | out-string
                $result | out-string
                return
                }
                else
                {
                    try #loading an exchange session to enable the group
                    {
                        Import-PSSession $exSession -CommandName  "Enable-DistributionGroup" | out-null
			start-sleep -s 12
                        Enable-DistributionGroup -identity $groupname -alias $groupname
                       
                    }
                    catch #if there are any errors
                    {
                        $errormessage = "The $groupname was not enabled in Exchange. Please perform this manually. ERROR: " + $_.exception.message
                        #result | out-string
			$errormessage | out-string
                        $global:exSession | out-string
                        Remove-PSSession $global:exSession

			#Write entry to the logs
			Write-Log -messagetype Error -message "Failed creating $groupName - $errormessage" -username $username
                        return
                    }
                }

		#Remove the exchange session
                Remove-PSSession $global:exSession

                 }
            #For data management groups
            dmdl {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -groupscope 'DomainLocal' -ParentContainer 'OU=Data Management,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created data management group - $groupname - and set up as requested."
                 }
            #For resource access groups
            radl {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -groupscope 'DomainLocal' -ParentContainer 'OU=Resource Access,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created resource access group - $groupname - and set up as requested."
                 }
	    #For service management groups
            smdl {
                New-QADGroup -name $groupName -DisplayName $groupName -SamAccountName $groupName -grouptype 'Security' -groupscope 'DomainLocal' -ParentContainer 'OU=Service Management,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description  -Notes $notes | out-null
	            Set-QADGroup -identity $groupName -ManagedBy $managedBy | out-null   
                $result = "Created service management group - $groupname - and set up as requested."
                 }
         }

	#If there were members listed, add them to the created AD group
        if($members){
	$memberlist = $members.split(";").Trimend("")
        $memberlist = $memberlist.split("`n").Trimend("")
	$memberlist = $memberlist | ?{$_ -ne ""}
        }
        foreach($member in $memberlist)
        {
          $adaccount = Get-qadobject $member | ?{($_.name -match $member) -or ($_.samaccountname -match $member) -or (($_.displayname -eq $member))}
           Add-QADGroupMember $groupname $adaccount | out-null        
        }
        
	#Check if the members were added
	$groupmembers = Get-QADGroupMember $groupname | select name -expandproperty name
        if($groupmembers)
        {
        $membersresult = "The following users were added: $groupmembers ."
        }

	#Display the results on the web application
        $result | out-string
        $membersresult | out-string
	$logtext = $result + $membersresult
	
	#Write entry to the logs
	Write-Log -messagetype Success -message $logtext -username $username
    }
    catch #if there are any errors
    {
	$result | out-string
        $errormessage = $_.exception.message
        $errormessage | out-string

	#Write entry to the logs
	Write-Log -messagetype Error -message "Failed creating $groupName - $errormessage" -username $username
        return
    }

  
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


# Create the AD Group
Create-AD_group $groupName $description $notes $managedby $members $type $username