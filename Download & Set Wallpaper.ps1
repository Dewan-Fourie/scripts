Function Set-WallPaper($Value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
}

New-Item -Path "c:\" -Name "wp" -ItemType "directory" -Force

# Enter the wallpaper URL
$url = "http://manage.leal.com.au/HappyHaven/Background/background.jpg"

if ((Invoke-WebRequest -Uri $url -Method 'POST' -OutFile C:\wp\wp.jpg).StatusCode -eq 200) {
    Invoke-WebRequest -Uri $url -OutFile C:\wp\wp.jpg
}

Set-WallPaper -value "C:\wp\wp.jpg"