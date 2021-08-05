param([string]$userName)


$name = $userName.trim("x")
$user =  ([adsisearcher]"name=$name").findone()
$empID = ($user.psobject.properties.value.employeeid | out-string).trimend("")
$url = "https://staffdirectory.pc.internal.macquarie.com/StaffPhotos/" + $empID + ".jpg"
$url | out-string