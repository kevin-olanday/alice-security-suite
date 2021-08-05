#Inputs from the web application. 'csv' is the bulk AD group template. 'userName' is the account logged in Alice.

param([string]$csv,[string]$userName)

#Import the csv for processing
$list = Import-csv $csv

#If there are no entries in the csv file...
if($list.count -lt 1 )
{
 #Display the results on the web application and terminate the script.
 $result = "CSV is empty or corrupt. Please upload another file."
 $result | out-string
 return
}

#For each row in the CSV file, create an AD group with the parameters provided.
foreach($adgroup in $list)
{
  $Command = "C:\Scripts\Powershell\ALICECreateADGroup.ps1 -groupname " + "'" + $adgroup.name + "'" + " -type " + $adgroup.type + " -description " + "'" + $adgroup.description + "'" + " -notes " + "'" + $adgroup.notes + "'" + " -managedby " + "'" + $adgroup.managedby + "'" + " -members " + "'" + $adgroup.members + "'" + " -username " + $username 
  Invoke-Expression $command
}

