Import-Module "<Exchange online module - Full path>"

Connect-ExchangeOnline -UserPrincipalName "<global administrator>"

$GroupData = @() #Creates an array
$Groups = Get-UnifiedGroup -ResultSize Unlimited -SortBy Name

$Groups | Foreach-Object {
    #Get Group Owners
    $GroupOwners = Get-UnifiedGroupLinks -LinkType Owners -Identity $_.Id | Select DisplayName, PrimarySmtpAddress
    $GroupData += New-Object -TypeName PSObject -Property @{
    GroupName = $_.DisplayName
    GroupEmail = $_.PrimarySmtpAddress
    OwnerName = $GroupOwners.DisplayName -join "; "
    OwnerIDs = $GroupOwners.PrimarySmtpAddress -join "; "
    }
}

$GroupData | Export-Csv "C:\temp\GroupOwners.csv" -NoTypeInformation

Disconnect-ExchangeOnline -Confirm:$false