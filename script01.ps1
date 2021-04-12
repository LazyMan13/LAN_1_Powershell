Clear-Host
$sales = Get-ADUser -Filter * -Properties * -SearchBase "OU=sales,DC=contoso,DC=com"

foreach($item in $sales) {
    Set-ADUser -Identity $item.SamAccountName -City "Little Rock"
}

$sales = Get-ADUser -Filter * -Properties * -SearchBase "OU=sales,DC=contoso,DC=com"

foreach($item in $sales) {
    $item | SELECT SamAccountName, City
}