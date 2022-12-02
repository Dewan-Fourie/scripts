# Import dependancies
Import-Module "<EXO V2 Module>"

Connect-ExchangeOnline -UserPrincipalName '<Tenant Global/Exchange Administrator>'

$UsersCSV = Import-Csv "<Path of CSV>"
# CSV must have Email and Username column titles

foreach ($line in $UsersCSV){
    # New-MailContact -Name $line.Username -ExternalEmailAddress $line.Email
    if ($null -ne (Get-Contact -Identity $line.Email -Erroraction Silentlycontinue)){
        Write-Host $line.Username was added successfully -ForegroundColor Green
    } else {
        Write-Host Something went wrong for $line.Username -ForegroundColor Red
    }
}

Disconnect-ExchangeOnline