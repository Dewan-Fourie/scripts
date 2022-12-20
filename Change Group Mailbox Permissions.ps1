# Script to give user permission to all calendars in tenancy.
Import-Module "<Path of EXO V2>"
Connect-ExchangeOnline -UserPrincipalName "<Global/Exchange Admin>"

Set-UnifiedGroup "<Group Mailbox>" -CalendarMemberReadOnly:$true
Get-MailboxFolderPermission -Identity "<Group Mailbox>:\Calendar" -GroupMailbox

Disconnect-ExchangeOnline

# Output to check changes
# ForEach ($mbx in Get-Mailbox -ResultSize Unlimited) {Get-MailboxFolderPermission ($mbx.Name + “:\Calendar”) | Select-Object Identity,User,AccessRights | Format-Table -Wrap -AutoSize}