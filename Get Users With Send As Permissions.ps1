# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- 

Connect-ExchangeOnline -UserPrincipalName 'dewan.nfit@happyhaven.sa.edu.au'

# Enter mailbox to check below
Get-Mailbox 'accounts@happyhaven.sa.edu.au' | Select-Object Name,Alias,UserPrincipalName,PrimarySmtpAddress,@{l='SendOnBehalfOf';e={$_.GrantSendOnBehalfTo -join ";"}} | Export-CSV "C:\SendOnBehalf.csv"

Disconnect-ExchangeOnline