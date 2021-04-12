clear

$users = Get-ADUser -Filter * -Properties Department | SELECT SamAccountName, Department | Where-Object Department -EQ $null

if($users.SamAccountName.count -eq 0) {
    write-host "All Users SET"
} else {
    foreach($item in $users) {
        if($item.Department -eq $null){
            Write-Host $item.SamAccountName -ForegroundColor Yellow
            Set-ADUser -Identity $item.SamAccountName -Department "Marketing"
        } else {
            Write-Host $item.SamAccountName -ForegroundColor Green
        }
    }
}