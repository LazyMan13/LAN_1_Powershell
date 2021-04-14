$hostname = $env:COMPUTERNAME
$user = $env:USERNAME.Split(".")
$fName = ( Get-Culture ).TextInfo.ToTitleCase( $user[0].ToLower() )
$lName = ( Get-Culture ).TextInfo.ToTitleCase( $user[1].ToLower() )

Function Set-ConsoleColor ($bc, $fc) {
    $Host.UI.RawUI.BackgroundColor = $bc
    $Host.UI.RawUI.ForegroundColor = $fc
    Clear-Host
}


Set-ConsoleColor 'DarkCyan' 'Yellow'

$bgcolor = Read-Host "What color would you like your background?"
$textcolor = Read-Host "What color would you like your text?"

Set-ConsoleColor $bgcolor $textcolor

Clear-Host

Write-Host "Hello $hostname`nBut that's not your real name is it $fName $($lName)?`n"
$nameChoice = Read-Host "May I call you $($fName)?"

if ($nameChoice.Substring(0,1).ToLower().Equals("y")) {
    Write-Host "Great, Hello $fName"
}
else {
    $fName = Read-Host "Oh? What may I call you then? "
    Write-Host "Okay, you want to be called $fName"
}
