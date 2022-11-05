Import-Module "C:\Users\Work\OneDrive - Leal Technology\Documents\PowerShell\Modules\ExchangeOnlineManagement\2.0.5\ExchangeOnlineManagement.psd1"
Connect-ExchangeOnline -UserPrincipalName '<Global Admin>'
Remove-Mailbox -Identity "<Email Address to Remove>" -Permanent
Disconnect-ExchangeOnline

# List active users.
# $dbs = Get-MailboxDatabase
# $dbs | foreach {Get-MailboxStatistics -Database $_.DistinguishedName} | where {$_.DisplayName -eq "<DisplayName>"}