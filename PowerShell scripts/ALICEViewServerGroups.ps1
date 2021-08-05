#Input from the web application. 'server' is the name of the server being queried.
param([String]$server)


#Loads the Quest Active Roles Cmdlets for AD Management.
Add-PSSnapin Quest.ActiveRoles.ADManagement

#If there are no objects in AD that match the name provided...
if (!(Get-QADObject $server -ErrorAction silentlycontinue | ?{$_.Name -eq $server} ))
{
   #Display the results on the web application and terminate the script.
   $result = "Please enter a computer name!"
   $result | out-string
   return
}

#Check if there is a group that match the format SGG-LocalAdmins-<servername>
function Check-LocalAdminsGroup {
    param($server)    
	$groupname = "SGG-LocalAdmins-$server"
    if(Get-QADGroup $groupname)
    {
     $result = $groupname
     $result  | out-string
     return
    }
}


#Check if there is a group that match the format SGG-LocalRDP-<servername>
function Check-LocalRDPGroup_server {
    param($server)    
	$groupname = "SGG-LocalRDP-$server"
    if(Get-QADGroup $groupname)
    {
     $result = $groupname
     $result | out-string
     return
    }
}

#Check if there is a group that match the format SGG-LogonLocally-<servername>
function Check-LogonLocallyGroup_server {
    param($server)
	$groupname = "SGG-LogonLocally-$server"
    if(Get-QADGroup $groupname)
    {
     $result = $groupname
     $result | out-string
     return
    }
}

#Check if there is a group that match the format SGG-LocalPowerUsers-<servername>
function Check-LocalPowerUsersGroup_server {
    param($server)    
	$groupname = "SGG-LocalPowerUsers-$server"
    if(Get-QADGroup $groupname)
    {
     $result = $groupname 
      $result | out-string
     return
    }
}

#Check if there is a group that match the format SGG-LocalPrintOperators-<servername>
function Check-LocalPrintOperatorsGroup_server {
    param($server)    
	$groupname = "SGG-LocalPrintOperators-$server"
    if(Get-QADGroup $groupname)
    {
     $result = $groupname
     $result | out-string
     return
    }
}

#Check for existing server groups
Check-LocalAdminsGroup $server
Check-LocalRDPGroup_server $server
Check-LogonLocallyGroup_server $server
Check-LocalPowerUsersGroup_server $server
Check-LocalPrintOperatorsGroup_server $server

