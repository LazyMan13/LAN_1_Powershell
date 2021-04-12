#we are creating a menu that will offer 5 choices 
#choice number 5 should quit the script.
#we need to learn about functions
#we need to learn about switch (what all* other coding languages case)
#* all being what goodman has limited knowledge of
Function Set-ConsoleColor ($bc, $fc) {
    $Host.UI.RawUI.BackgroundColor = $bc
    $Host.UI.RawUI.ForegroundColor = $fc
    Clear-Host
}
Set-ConsoleColor 'DarkCyan' 'Yellow'

Function Get-Hostname{
$hostname = $env:COMPUTERNAME
Write-Host "$hostname" -BackgroundColor DarkMagenta -ForegroundColor Yellow
Write-Host -NoNewLine 'Press any key to continue...' -BackgroundColor DarkMagenta -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

Function Get-LastLogin{
#$login = Get-ADComputer -Identity (hostname) -Properties LastLogonDate | foreach { $_.LastLogonDate }
$login = Get-ADUser $env:USERNAME -Properties * | foreach {$_.LastLogonDate}
Write-Host @"

Username`t`tLast Logon
$env:USERNAME`t`t$login

"@ -BackgroundColor DarkMagenta -ForegroundColor Yellow
Write-Host -NoNewLine 'Press any key to continue...' -BackgroundColor DarkMagenta -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

Function Get-Gateway{
#$gateway = Get-NetRoute -DestinationPrefix 0.0.0.0/0 | foreach { $_.NextHop }
$gateway = Get-NetIPConfiguration 
Write-Host
Write-Host $gateway.IPv4DefaultGateway.NextHop -BackgroundColor DarkMagenta -ForegroundColor Yellow
Write-Host
Write-Host -NoNewLine 'Press any key to continue...' -BackgroundColor DarkMagenta -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

Function Get-Uptime{
$uptime = (get-date) - (gcim Win32_OperatingSystem).LastBootUpTime | Select-Object Days, Hours, Minutes
#$uptime | Format-Table | Out-String | Write-Host
#$convertedUptime = [Management.ManagementDateTimeConverter]::ToDateTime($uptime)
$uptime | Format-Table | Out-String | Write-Host -BackgroundColor DarkMagenta -ForegroundColor Yellow
Write-Host -NoNewLine 'Press any key to continue...' -BackgroundColor DarkMagenta -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

Function Exit-Script{
Set-ConsoleColor 'Black' 'White'
Exit
}

while($exit -ne "True") #intended inf loop for refresh menu, 5 selection will Exit script
{
Clear-Host
Write-Host @"
                           
 1. Show host name         
 2. Show last login        
 3. Show gateway address   
 4. Show up time           
 5. Quit                   
                           
"@ -BackgroundColor DarkMagenta -ForegroundColor Yellow

Write-Host "Enter your choice: " -ForegroundColor Yellow -NoNewline
    $num = Read-Host
    Switch ($num)
    {
	    1 {Get-Hostname}
	    2 {Get-LastLogin}
	    3 {Get-Gateway}
	    4 {Get-Uptime}
	    5 {Exit-Script}
	    default {'Invalid Entry'}
    }
}

