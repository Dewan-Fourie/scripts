# This script is used instead of the configuration profile 
# as the script does not have the same licensing limitations 
# as the "Desktop Background" configuration profile.

$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
$DesktopPath = "DesktopImagePath"
$DesktopStatus = "DesktopImageStatus"
$DesktopUrl = "DesktopImageUrl"
$StatusValue = "1"
$url = "https://<our url>/wallpapers/<client>/background.jpg"
$DesktopImageValue = "C:\MEM\wallpaper.jpg"
$directory = "C:\MEM\"

If ((Test-Path -Path $directory) -eq $false)
{
    New-Item -Path $directory -ItemType directory -Force
}

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $DesktopImageValue)

if (!(Test-Path $RegKeyPath))
{
    Write-Host "Creating registry path $($RegKeyPath)."
    New-Item -Path $RegKeyPath -Force | Out-Null
}

New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null