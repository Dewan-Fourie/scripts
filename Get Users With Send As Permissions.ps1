# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- Used as reference

Import-Module "<location of EXO V2 (ExchangeOnlineManagement) modules>"

Connect-ExchangeOnline -UserPrincipalName '<global admin email>'

# Enter mailbox to check below
Get-Mailbox '<enter mailbox>' | Select-Object Name,Alias,UserPrincipalName,PrimarySmtpAddress,@{l='SendOnBehalfOf';e={$_.GrantSendOnBehalfTo -join " ;"}} | Export-CSV "C:\temp\SendOnBehalf.csv"

Disconnect-ExchangeOnline