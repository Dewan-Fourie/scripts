Import-Module "C:\Users\Work\OneDrive - Leal Technology\Documents\PowerShell\Modules\ExchangeOnlineManagement\2.0.5\ExchangeOnlineManagement.psd1"
Connect-ExchangeOnline -UserPrincipalName 'admin@tecautomation.onmicrosoft.com'
Remove-Mailbox -Identity "ryan.smith@tecautomation.com.au" -Permanent
Disconnect-ExchangeOnline