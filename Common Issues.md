# Common Issues

## The remote server returned an error: (400) Bad Request. on $Ctx.ExecuteQuery()

Ensure that VS Code is using the correct PowerShell version, as SharePoint Online doesn't allow "PowerShell credential request". Switch from PowerShell to Windows Powershell:
> 1) Press ctrl+shift+p to open the Command Palette
> 2) Search for **Session**
> 3) Click on **PowerShell: Show Session Menu**
> 4) Choose Windows **Switch to: Windows PowerShell (x64)**

