Import-Module "<Full path of EXO V2 module>"
Connect-ExchangeOnline -UserPrincipalName '<Global Admin>'
Remove-Mailbox -Identity "<Email Address to Remove>" -Permanent
Disconnect-ExchangeOnline

# List active users.
# $dbs = Get-MailboxDatabase
# $dbs | foreach {Get-MailboxStatistics -Database $_.DistinguishedName} | where {$_.DisplayName -eq "<DisplayName>"}