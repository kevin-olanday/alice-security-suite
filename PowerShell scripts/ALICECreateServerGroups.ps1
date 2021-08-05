<#
Inputs from the web application. 
'Server' is the server associated with the groups to be created.
'Type' is the type of group to be created.
'userName' is the account logged in Alice.
NOTE: This only creates the group. This does not automatically provide the group permission on the server.
#>
param([String]$server,[String]$type,[String]$username)

#Sets the directory for the log file
$global:script = $SCRIPT:MyInvocation.MyCommand
$global:strLogFile = $global:script.Definition.Replace("C:\Scripts\Powershell","D:\Applications\Alice\Logs").Replace("ps1","log")

#Loads the Quest Active Roles Cmdlets for AD Management.
Add-PSSnapin Quest.ActiveRoles.ADManagement

#Check if server exists as a 'computer' object in Active Directory 
$servercheck = ([adsisearcher]"(&(name=$server)(objectcategory=computer))").findone()

#If the server does not exists...
if (!$servercheck)
{
   #Display results to the web application	
   $result = "$server is not a valid server. Please enter a server name!"
   $result | out-string
   return
}

#If no type is specified
if (!$type)
{
   #Display results to the web application
   $result = "Please specify the type of group to create!"
   $result | out-string
   return
}


#Creates a function for creating Local Admin Groups
function Create-LocalAdminsGroup {
    param($server)    
	$groupname = "SGG-LocalAdmins-$server"
	
	#If the group already exists...
    if(([adsisearcher]("name=$groupname")).findone())
    {
     #Display results to the web application	
     $result = "$groupname already exists!"
     $result  | out-string

     #Write entry to the logs
     Write-Log -messagetype Warning -message "Tried to create Local Admin Group - $groupname - but it already exists." -username $username
     return
    }
	
	$description = "Provides administrator access to $server"
	
	#Creates the group in the standard OU 
	New-QADGroup -name $groupname -DisplayName $groupname -SamAccountName $groupname -ParentContainer 'OU=Elevated Access,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null

    #Display results to the web application	
    $result = "Created $groupname !"
    $result | out-string

    #Write entry to the logs
    Write-Log -messagetype Success -message "Created Local Admin Group - $groupname" -username $username

}

#Creates a function for creating Local RDP Groups
function Create-LocalRDPGroup_server {
    param($server)    
	$groupname = "SGG-LocalRDP-$server"
	
	#If the group already exists...
    if(([adsisearcher]("name=$groupname")).findone())
    {
     #Display results to the web application
     $result = "$groupname already exists!"
     $result | out-string

     #Write entry to the logs
     Write-Log -messagetype Warning -message "Tried to create Local RDP Group - $groupname - but it already exists." -username $username
     return
    }
	$description = "Provides RDP access to $server - members in this group are granted the right to logon remotely."
	
	#Creates the group in the standard elevated server group OU 
	New-QADGroup -name $groupname -DisplayName $groupname -SamAccountName $groupname -ParentContainer 'OU=Elevated Access,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
    
    #Display results to the web application	
    $result = "Created $groupname !`n"
    $result | out-string
    
    #Write entry to the logs
    Write-Log -messagetype Success -message "Created Local RDP Group - $groupname" -username $username

}

#Creates a function for creating Logon Locally Groups
function Create-LogonLocallyGroup_server {
    param($server)
	$groupname = "SGG-LogonLocally-$server"
	
	#If the group already exists...
    if(([adsisearcher]("name=$groupname")).findone())
    {
     #Display results to the web application
     $result = "$groupname already exists!"
     $result | out-string

     #Write entry to the logs
     Write-Log -messagetype Warning -message "Tried to create Logon Locally Group - $groupname - but it already exists." -username $username
     return
    }
	$description = "Provides local logon access to $server - members in this group are granted the right to logon locally."
	
	#Creates the group in the standard elevated server group OU 
	New-QADGroup -name $groupname -DisplayName $groupname -SamAccountName $groupname -ParentContainer 'OU=Elevated Access,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
    
    #Display results to the web application	
    $result = "Created $groupname !"
    $result | out-string

    #Write entry to the logs
    Write-Log -messagetype Success -message "Created Logon Locally Group - $groupname" -username $username

}

#Creates a function for creating Local Power Users Group
function Create-LocalPowerUsersGroup_server {
    param($server)    
	$groupname = "SGG-LocalPowerUsers-$server"
	
	#If the group already exists...
    if(([adsisearcher]("name=$groupname")).findone())
    {
     #Display results to the web application
     $result = "$groupname already exists!"
     $result | out-string

     #Write entry to the logs
     Write-Log -messagetype Warning -message "Tried to create Local Power Users Group - $groupname - but it already exists." -username $username
     return
    }
	$description = "Local Power Users on $server"
	
	#Creates the group in the standard elevated server group OU 
	New-QADGroup -name $groupname -DisplayName $groupname -SamAccountName $groupname -ParentContainer 'OU=Elevated Access,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
    
    #Display results to the web application	
    $result = "Created $groupname !"
    $result | out-string

    #Write entry to the logs
    Write-Log -messagetype Success -message "Created Local Power Users Group - $groupname" -username $username

}

#Creates a function for creating Local Print Operators Group
function Create-LocalPrintOperatorsGroup_server {
    param($server)    
	$groupname = "SGG-LocalPrintOperators-$server"
	
	#If the group already exists...
    if(([adsisearcher]("name=$groupname")).findone())
    {
     #Display results to the web application
     $result = "$groupname already exists!"
     $result | out-string

     #Write entry to the logs
     Write-Log -messagetype Warning -message "Tried to create Local Print Operators Group - $groupname - but it already exists." -username $username
     return
    }
	$description = "Local Print Operators on $server"
	
	#Creates the group in the standard elevated server group OU 
	New-QADGroup -name $groupname -DisplayName $groupname -SamAccountName $groupname -ParentContainer 'OU=Elevated Access,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
    
    #Display results to the web application	
    $result = "Created $groupname !"
    $result | out-string

    #Write entry to the logs
    Write-Log -messagetype Success -message "Created Local Print Operators Group - $groupname" -username $username

}

#Creates the main function which will call the previously created functions
function Create-Group_server {
param([String]$server,[String]$type)


     switch($type)
     {
         admin {Create-LocalAdminsGroup($server)}
         rdp   {Create-LocalRDPGroup_server($server)}
         local {Create-LogonLocallyGroup_server($server)}
         power {Create-LocalPowerUsersGroup_server($server)}
         print {Create-LocalPrintOperatorsGroup_server($server)}
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


#Create the groups requested
Create-Group_server $server $type


