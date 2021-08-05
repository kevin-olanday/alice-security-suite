#Inputs from the web application. 'Path' is the directory path. 'userName' is the account logged in Alice.
param([String]$path,[String]$username)

#Loads the Quest Active Roles Cmdlets for AD Management.
Add-PSSnapin Quest.ActiveRoles.ADManagement

#Creates a function that queries a directory's ACL details and identifies the most probable permission groups and their corresponding approvers.
function Check-FolderApprovers
{
param($path,$username)
    
    $array = @()
    $suggestedgroups = @()
    $suggestedgroup = ""
    
    #Stores possible keywords based on the directory
    $keywords = $path.split("\")
    
    #Removes unsupported characters in AD group creation
    $keywords = $keywords | ?{$_}
    $keywords = $keywords.replace(" ","_")
    $keywords = $keywords.replace("-","")
    $keywords = $keywords.replace(".","")
    $keywords = $keywords.replace("&","")
    $keywords = $keywords.replace("@","")
    $server = $keywords[0]

    #Filters out the servername and the 'shared' keyword
    $keywords = $keywords | ?{$_ -notmatch $server -and $_ -notlike "shared"}




    try #obtain the ACL details of the directory
    {
        $acl = get-acl $Path

    }

    catch #if there are errors
    {
	#Display the error in the web application and terminate the script
        $errormessage = $_.exception.message
        $errormessage | out-string
        return
    }

    #Identify possible permission groups
    $permissiongroups = $acl.Access | where {$_.identityreference -like "NTADMIN*" -and $_.identityreference -notmatch "_LIST"} 
 
    #Queries the list for groups that match the saved keywords
    Foreach ($group in $permissiongroups)
    {
    [string]$adgroup = ($group.identityreference)
         $adgroup = $adgroup.Trimstart("NTADMIN\")

    foreach ($keyword in $keywords)
    {
        if($adgroup -match $keyword)
        {
           $suggestedgroups += $adgroup
        }
    }

    
    
    $object = New-Object –TypeName PSObject
    $object | Add-Member –MemberType NoteProperty –Name "Name" –Value $group.identityreference
    $object | Add-Member –MemberType NoteProperty –Name "Current Permisison" –Value $group.filesystemrights
    $object | Add-Member –MemberType NoteProperty –Name "Access Control Type" –Value $group.AccessControltype
    $array += $object

    } 


    #Optional : this will display all possible permission groups
    #$array

    
    #Get the most probable Read Only and Read Write groups
    foreach($keyword in $keywords)
    {
        foreach($group in $suggestedgroups)
        {
            if($group -match ("$keyword" + '\d+' + "_RW") -or $group -match("$keyword" + "_RW"))
            {
                $suggestedgroupRW = $group
            }
            elseif($group -match ("$keyword" + '\d+' + "_RO") -or $group -match("$keyword" + "_RO"))
            {
                $suggestedgroupRO = $group
            }
        }

    }

    $suggestedgroupRW = $suggestedgroupRW.replace("NTADMIN\","")
    $suggestedgroupRO = $suggestedgroupRO.replace("NTADMIN\","")
  
    #Get the approvers based on the 'managedby' field in Active Directory
    $RWapprovers =  (Get-Qadgroup $suggestedgroupRW | select -ExpandProperty managedby | out-string).split(",")[0].replace("CN=","")
    $ROapprovers =  (Get-Qadgroup $suggestedgroupRO | select -ExpandProperty managedby | out-string).split(",")[0].replace("CN=","")

    
    #If valid approvers were found...
    if($RWApprovers -or $ROapprovers)
    {
        if($RWApprovers)
        {
            $approvers = ($rwapprovers | out-string).Trimend()
        }
        else
        {
            $approvers = ($roapprovers | out-string).Trimend()
        }
    }

    #If there are no approvers...
    if(!($approvers))
    {
    $approvers = "Could not find approvers!"
    }

    #If there are no Read/Write groups that satisfies the criteria
    if($suggestedgrouprw)
    {
    $suggestedgrouprw = ($suggestedgrouprw | out-string).Trimend()
    }
    else 
    {
    $suggestedgroupw = "Could not find group!"
    }

    #If there are no Read Only groups that satisfies the criteria
    if($suggestedgroupro)
    {
    $suggestedgroupro = ($suggestedgroupro | out-string).Trimend()
    }
    else
    {
    $suggestedgroupo = "Could not find group!"
    }

    #Display the results on the web application
    $output = $suggestedgroupRO + "," + $suggestedgroupRW + "," + $approvers
    $output
}

#Check the directory 
Check-FolderApprovers $path $Username
