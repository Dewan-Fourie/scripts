# Import dependancies
Import-Module "<Path of EXO V2 Module>"

Connect-ExchangeOnline -UserPrincipalName '<Global/Exchange Admin>'

$UsersCSV = Import-Csv "<Path of CSV>"
# CSV must have Email and Username column titles

$distributionList = "<Name of Distribution List>"

foreach ($line in $UsersCSV){
    Add-DistributionGroupMember -Identity $distributionList -Member $line.Email
    if ($null -ne (Get-DistributionGroupMember -Identity $distributionList | Format-List primarysmtpaddress | Out-string | Select-String -Pattern $line.Email)){
        Write-Host $line.Email was added successfully -ForegroundColor Green
    } else {
        Write-Host Something went wrong for $line.Email -ForegroundColor Red
    }
}

Disconnect-ExchangeOnline