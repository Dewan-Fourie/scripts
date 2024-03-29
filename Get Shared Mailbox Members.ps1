# Use (Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.5) in powershell to install nessesary EXO V2 modules
# https://www.michev.info/Blog/Post/2997/connecting-to-exchange-online-powershell-via-client-secret-flow <- Used as reference

Import-Module "<Full path of EXO V2 module>"

Connect-ExchangeOnline -UserPrincipalName '<Global admin>'

$InputFilePath = "<Full path of csv>" #Set this to the CSV file of the accounts you want to provision.
# The csv file needs 'Mailbox' as the header, with all the accounts listed under it.

$CsvFile = Import-Csv $InputFilePath

# Enter mailbox to check below
ForEach ($line in $CsvFile)
{ 
    $filepath = 'C:\temp\Mailboxes\' + $line.Mailbox + '.csv'
    Get-MailboxPermission -Identity $line.Mailbox | Select-Object User | Export-CSV $filepath
}

Disconnect-ExchangeOnline