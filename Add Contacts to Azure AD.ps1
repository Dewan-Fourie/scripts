# Import dependancies
Import-Module "C:\Program Files\WindowsPowerShell\Modules\ExchangeOnlineManagement"

Connect-ExchangeOnline -UserPrincipalName 'nfit@amsant.onmicrosoft.com'

$UsersCSV = Import-Csv "C:\Users\Work\OneDrive - Leal Technology\Documents\AMSANT\External Users\test.csv"
# CSV must have Email and Username column titles

foreach ($line in $UsersCSV){
    New-MailContact -Name $line.Username -ExternalEmailAddress $line.Email | Out-Null
    if ($null -ne (Get-Contact -Identity $line.Email -Erroraction Silentlycontinue)){
        Write-Host $line.Username was added successfully -ForegroundColor Green
    } else {
        Write-Host Something went wrong for $line.Username -ForegroundColor Red
    }
}

Disconnect-ExchangeOnline