Clear-Host
$employees = Import-Csv -Path .\Documents\employees2.csv
$a = 0
$b = 0

foreach($item in $employees) 
{
    try
    {
        get-aduser -Identity $item.SamAccountName > $null
        $a++
    }
    catch 
    {

            $pass = ConvertTo-SecureString $item.AccountPassword -AsPlainText -Force

            if($item.Enabled -like '$True') 
            {
                [boolean]$en = $true
            } else 
            {
                [boolean]$en = $false
            }

            New-ADUser -Name $item.Name `
                    -DisplayName $item.DisplayName `
                    -GivenName $item.GivenName `
                    -Surname $item.Surname `
                    -SamAccountName $item.SamAccountName `
                    -UserPrincipalName $item.UserPrincipalName `
                    -EmployeeID $item.EmployeeID `
                    -AccountPassword $pass `
                    -Description $item.Description `
                    -EmailAddress $item.EmailAddress `
                    -Enabled $en `
                    -Company $item.Company `
                    -Office $item.Office `
                    -Department $item.Department `
                    -Organization $item.Organization `
                    -OfficePhone $item.OfficePhone `
                    -StreetAddress $item.StreetAddress `
                    -city $item.City `
                    -State $item.State `
                    -Country $item.Country `
                    -PostalCode $item.PostalCode `
                    -Path $item.Path
        $b++
    }#closes catch
}#closes the for loop
Write-Host "Accounts already exist $a"
Write-Host "We created $b accounts"