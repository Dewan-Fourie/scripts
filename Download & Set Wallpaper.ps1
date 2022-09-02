# This script is used instead of the configuration profile 
# as the script does not have the same licensing limitations 
# as the "Desktop Background" configuration profile.

New-Item -Path "c:\" -Name "wp" -ItemType "directory" -Force
Invoke-WebRequest -Uri "https://www.leal.com.au/wallpapers/happyhaven/background.jpg" -OutFile C:\wp\background.jpg
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "C:\wp\background.jpg"
rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True