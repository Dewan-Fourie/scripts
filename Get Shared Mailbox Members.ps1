# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- Used as reference

Import-Module "<Path of EXO V2 Modules>"

Connect-ExchangeOnline -UserPrincipalName '<Tenant Admin>'

# Enter mailbox to check below
Get-MailboxPermission -Identity '<Shared Mailbox>' | Format-List # Select-Object Name,Alias,UserPrincipalName,PrimarySmtpAddress,@{l='SendOnBehalfOf';e={$_. -join " ;"}} | Export-CSV "C:\temp\SendOnBehalf.csv"

Disconnect-ExchangeOnline