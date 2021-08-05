param([String]$path,[string]$type,[string]$username)

Add-PSSnapin Quest.ActiveRoles.ADManagement


if (!(Test-path $path))
{
   $result = "$path is not a valid path!"
   $result | out-string
   return
}


function Create-FolderPermissionGroups {
    param($path,$type,$username)   

    if($type -eq "WF")
    {

   	  $servername = $path.Split("\\")[2].toUpper() 
	  $foldername = $path.TrimEnd("\").Split("\")[-1].toUpper() 
	  $foldername = $foldername.trim("`r`n")
	  $RWgroup = "WF_$servername" + "_SHARED" + "_$foldername" +"_RW"
	  $ROgroup = "WF_$servername" + "_SHARED" + "_$foldername" +"_RO"
      $description = $path
      
      $ROstatus = get-qadgroup $ROgroup
	
	  if($ROstatus) 
      {
	   $result = "$ROgroup already exists for $description `r`n"
	  }
	
      else
      {
       try
       {
		   New-QADGroup -name $ROGroup -DisplayName $ROGroup -SamAccountName $ROGroup -ParentContainer 'OU=WF Groups,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
	       $result = "Created read-only group - $ROgroup - for $description `r`n"
           $logtext = $result
       }
       catch
       {
           $result = "Cannot create $ROGRoup - $_ `n"
       }
      
      }
	
	  $RWstatus = get-qadgroup $RWgroup
       
      if($RWstatus)
      {
		$result2 = "$RWgroup already exists for $description"
	  }
	
      else 
      {
       try
       {
		New-QADGroup -name $RWGroup -DisplayName $RWGroup -SamAccountName $RWGroup -ParentContainer 'OU=WF Groups,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
		$result2 =  "Created read-write group - $RWgroup - for $description"
        $logtext = $logtext + "  `n" + $result2
       }
       catch
       {
        $result2 =  "Cannot create $RWGRoup - $_ `n"
       }
	  }
    }
   
    elseif($type -eq "WO")
    {
      $servername = $path.Split("\\")[2].toUpper() 
	  $drive = $path.Split("\")[3].trim("$").toUpper() 
	  $foldername = $path.TrimEnd("\").Split("\")[-1].toUpper()
      $foldername = $foldername.trim("`r`n")
	
      if ($foldername -match "\$")
      {
		$RWgroup = "WO_$servername" + "_$drive" +"_RW"
		$ROgroup = "WO_$servername" + "_$drive" +"_RO"

	  }

      else {
		$RWgroup = "WO_$servername" + "_$drive" +"_$foldername" + "_RW"
		$ROgroup = "WO_$servername" + "_$drive" + "_$foldername" + "_RO"
	  }
	
    $description = $path

	if ($drive.length -eq 1) 
    {
	
	    $ROstatus = get-qadgroup $ROgroup
	
	    if($ROstatus) 
        {
		$result = "$ROgroup already exists for $description `r`n"
	    }
	
        else 
        {
         try
         {
		    New-QADGroup -name $ROGroup -DisplayName $ROGroup -SamAccountName $ROGroup -ParentContainer 'OU=WO Groups,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
		    $result = "Created read-only group - $ROgroup - for $description `r`n"
            $logtext = $result
         }
         catch
         {
            $result = "Cannot create $ROGRoup - $_ n"
         }
	    }
	
	    $RWstatus = get-qadgroup $RWgroup
	
	    if($RWstatus) 
        {
		    $result2 = "$RWgroup already exists for $description"
	    }
	    else 
        {
         try
         {
      	    New-QADGroup -name $RWGroup -DisplayName $RWGroup -SamAccountName $RWGroup -ParentContainer 'OU=WO Groups,OU=Server Groups,OU=Security Groups,OU=ITS Security,DC=pc,DC=internal,DC=macquarie,DC=com' -Description $description | out-null
		    $result2 =  "Created read-write group - $RWgroup - for $description"
            $logtext = $logtext + "  `n"  + $result2
         }
         catch
         {
            $result2 = "Cannot create $ROGRoup - $_ n"
         }
        }  
	  }
	
	
	else 
    {
		$result = "Cannot Create $ROGroup (Read Only Access) and $RWGroup (Read Write Access). Please check if the path follows the format '//ServerName/Drive$/Folder/'"
	}    
  }
  $result | out-string
  $result2 | out-string

#Sets up logging for auditing
function getTimestamp ($logdate) {
	$fulldate = get-date
	$date = $fulldate.toshortdatestring()
	$time = $fulldate.toshorttimestring()
	return $logdate = $date + " " + $time
}
$logdate = getTimestamp($logdate)

add-content  "D:\\Applications\Alice\Logs\Logs.txt" -Value "`n$logdate - $username - $logtext"
  
}


Create-FolderPermissionGroups $path $type $username



