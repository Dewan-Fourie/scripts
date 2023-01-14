import-module "<Full path of Microsoft.Graph.Authentication module>"
import-module "<Full path of Microsoft.Graph.Users>"

Connect-MgGraph -Scopes "User.Read.All" # We don't need to write: ,"Group.ReadWrite.All"

Get-MgUser -UserId '<ID of user>' | Format-List ID, DisplayName