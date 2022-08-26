Function Set-WallPaper($Value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
}

New-Item -Path "c:\" -Name "wp" -ItemType "directory" -Force

# Enter the wallpaper URL
$url = "https://prd-sc101-cdn.rtx.com/-/media/rmd/news/2019/12/20/arming-the-f-35/images/f-35a-fighters.jpg?rev=56ddf7086b49435b900fb4d7b227cc19"

if ((Invoke-WebRequest -Uri $url -Method 'POST' -OutFile C:\wp\wp.jpg).StatusCode -eq 200) {
    Invoke-WebRequest -Uri $url -OutFile C:\wp\wp.jpg
}

Set-WallPaper -value "C:\wp\wp.jpg"