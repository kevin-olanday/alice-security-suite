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

#For each row in the CSV file, create a generic account with the parameters provided.

foreach($gena in $list)
{
    if($gena.interactive -eq "TRUE")
    {
        $Command = "C:\Scripts\Powershell\ALICECreateGenericAccount.ps1 -name " + $gena.name + " -domain " + "'" + $gena.Domain + "'" + " -inc " + $gena.INC + " -password " + $gena.Password + " -interactive $true"
        Invoke-Expression $command
    }
    else
    {
        $Command = "C:\Scripts\Powershell\ALICECreateGenericAccount.ps1 -name " + $gena.name + " -domain " + "'" + $gena.Domain + "'" + " -inc " + $gena.INC + " -password " + $gena.Password 
        Invoke-Expression $command
    }
}

