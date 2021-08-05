param([String]$path,[switch]$indirect)

Add-PSSnapin Quest.ActiveRoles.ADManagement



if (!$path)
{
   $result = "Please enter a path!"
   $result | out-string
   return
}

if (!(Test-path $path))
{
   $result = "$path is not a valid path!"

    $result | out-string
   return
}


function Check-FolderPermissions {
    param($path)   

    $ACLs = (get-acl $path | select access).access
  
    $ACLs | select identityreference,filesystemrights | ft  -wrap | out-string
    return

}

function Check-IndirectPermissions {
    param($path)  

    $ACLs = (get-acl $path | select access).access

    foreach($ACL in $ACLs) {
    $object = $ACL.identityreference | out-string
    
    if($object -match "ntadmin")
    {
        $adobject = Get-qadobject $object.split("\")[1].trimend()
        if($adobject.Type -eq 'Group')
        {
            if((Get-QADGroup $adobject | select members).members)
            {
             $message = "Indirectly Permissioned through $adobject :"
             $message
            (Get-QADGroup $adobject | select members).members  | % {$_.split(",")[0].replace("CN=","")} 
            }
        }


    }
  }
}


if($indirect)
{
Check-IndirectPermissions $path
}

else
{
Check-FolderPermissions $path
}


