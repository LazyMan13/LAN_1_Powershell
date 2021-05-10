Clear-Host

$Array = @()
$ipList = get-nettcpconnection | Where-Object {($_.AppliedSetting -eq "Internet") -and ($_.RemotePort -ne "80")}|`
            Select-Object @{name="Index";Expression={($global:index+=1)}},LocalAddress,LocalPort,RemoteAddress,RemotePort,State,`
            @{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}}

foreach($item in $ipList) {

    $Array += $item
}

$Array | Format-Table

$ip = Read-Host "Whois on which index? (currently IPv4 only)"

foreach($element in $Array) {
    if ($ip -eq $element.Index){
        $ipaddress = $element.RemoteAddress
    }
}
#following code originally by PSScriptTools 2.9.0
#https://www.powershellgallery.com/packages/PSScriptTools/2.9.0/Content/functions%5CGet-WhoIs.ps1
#modified for my use
$baseURL = 'http://whois.arin.net/rest'
$header = @{"Accept" = "application/xml"}
$url = "$baseUrl/ip/$ipaddress"
$r = Invoke-Restmethod $url -Headers $header -ErrorAction stop

if ($r.net) {
            [pscustomobject]@{
                IP                     = $ipaddress
                Name                   = $r.net.name
                RegisteredOrganization = $r.net.orgRef.name
                City                   = (Invoke-RestMethod $r.net.orgRef.'#text').org.city
                StartAddress           = $r.net.startAddress
                EndAddress             = $r.net.endAddress
                NetBlocks              = $r.net.netBlocks.netBlock | foreach-object {"$($_.startaddress)/$($_.cidrLength)"}
                Updated                = $r.net.updateDate -as [datetime]
            }
        }