# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- Used as reference

Import-Module "<location of EXO V2 (ExchangeOnlineManagement) modules>"

Connect-ExchangeOnline -UserPrincipalName '<global admin email>'

# Enter mailbox to force MRM to run on
Start-ManagedFolderAssistant -Identity '<enter mailbox>'

Disconnect-ExchangeOnline