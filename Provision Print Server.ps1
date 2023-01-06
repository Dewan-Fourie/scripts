$wifi = Get-NetConnectionProfile | Select-Object Name
$username = "<Username of print server>"
$passw = "<Password of print server>"

New-SmbMapping -RemotePath \\<print server> -UserName $username -Password $passw
if ($wifi.Name -eq "<WiFi/Network Name>") {
    Add-Printer -ConnectionName "\\<Print server>\<Printer name>" 
} else {
    exit 1
}