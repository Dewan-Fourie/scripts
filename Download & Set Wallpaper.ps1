# This script is used instead of the configuration profile 
# as the script does not have the same licensing limitations 
# as the "Desktop Background" configuration profile.

Function Set-WallPaper($Value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
}

New-Item -Path "c:\" -Name "wp" -ItemType "directory" -Force

# Enter the wallpaper URL
$url = "https://www.leal.com.au/wallpapers/happyhaven/background.jpg"

if ((Invoke-WebRequest -Uri $url -Method 'POST' -OutFile C:\wp\background.jpg).StatusCode -eq 200) {
    Invoke-WebRequest -Uri $url -OutFile C:\wp\background.jpg
}

Set-WallPaper -value "C:\wp\background.jpg"