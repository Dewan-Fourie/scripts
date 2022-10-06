import-module "C:\Users\Work\OneDrive - Leal Technology\Documents\PowerShell\Modules\Microsoft.Graph.Authentication"
import-module "C:\Users\Work\OneDrive - Leal Technology\Documents\PowerShell\Modules\Microsoft.Graph.Users"

Connect-MgGraph -Scopes "User.Read.All" # We don't need to write: ,"Group.ReadWrite.All"

Get-MgUser -UserId '36634807-a2f4-4565-bd87-608879454364' | Format-List ID, DisplayName