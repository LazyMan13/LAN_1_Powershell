Clear-Host

$users = Get-ADUser -Filter * -Properties Department | Select-Object `
SamAccountName, Department | Where-Object Department -EQ $null

if($users.SamAccountName.count -ne 0) {
    foreach($item in $users) {
        #Write-Host $item.SamAccountName $item.Department -ForegroundColor Yellow
        Set-ADUser -Identity $item.SamAccountName -Department "Marketing"
        Get-ADUser -Identity $item.SamAccountName -Properties Department | Select-Object name, Department
    }
} else {
    write-host "All Users SET"
}
    

