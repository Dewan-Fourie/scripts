# Script to give user permission to all calendars in tenancy.
Import-Module "<Path of EXO V2>"
Connect-ExchangeOnline -UserPrincipalName "<Global/Exchange Admin>"

# Options: Owner, Publishing Editor, Editor, Publishing Author, Author, Nonediting Author, Reviewer, Contributor, None
$accRight = "Reviewer"

# Collects a list of all users, and adds these user's permissions to the list created previously ($userAccess)
Get-Mailbox -ResultSize Unlimited | ForEach-Object {
    Set-MailboxFolderPermission "$($_.SamAccountName):\calendar" -User "Default" -AccessRights $accRight
    Write-Host "Default permission changed for" $_.SamAccountName "to" $accRight -ForegroundColor Green
}

# Output to check changes
# ForEach ($mbx in Get-Mailbox -ResultSize Unlimited) {Get-MailboxFolderPermission ($mbx.Name + “:\Calendar”) | Select-Object Identity,User,AccessRights | Format-Table -Wrap -AutoSize}