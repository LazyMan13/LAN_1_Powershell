#other types of loops
#while loops (checks before doing)
Clear-Host
$a = 5

while ($a -gt 0) 
{
    $a--
    Write-Host "$a crap"    
}

$b = 0

while ($b -lt 5)
{
    $b++
    Write-Host "$b crap again"
}

#do while loops (does before checking)
write-host "$a I got to this point line 21"
do{
    $a--
    write-host "$a winning"
}WHILE ($a -gt 0)


do
{
$ans = Read-Host -Prompt "Are you ignorant?(y/n)"
}
while ($ans -ne 'y')
Write-Host "You figured out everyone is ignorant of something. We did not say you are stupid"
