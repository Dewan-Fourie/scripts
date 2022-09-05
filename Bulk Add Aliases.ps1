# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- Used as reference

Import-Module "<EXO Module Location>"

Connect-ExchangeOnline -UserPrincipalName '<global admin account>'

# Enter mailbox to force MRM to run on
Import-CSV "<Full CSV File Location>" |
foreach {Set-Mailbox $_.Mailbox -EmailAddresses @{add=$_.NewEmailAddress}}


Disconnect-ExchangeOnline