Clear-Host
#Get all the computer names from AD 
$computers = Get-ADComputer -Filter * 

#Connect to each computer and display installed hotfixes
foreach($item in $computers)
{
    #invoke-command -ComputerName $item.DNSHostName -scriptblock {Get-HotFix}
    Get-HotFix -ComputerName $item.DNSHostName | Export-Csv -Path //Server3/Public/hotfix.csv -NoTypeInformation
}


