# Uses a CSV to import IDs and attributes to add to Azure AD user.

# Connect to AzureAD
Connect-AzureAD

# Get CSV content
$CSVrecords = Import-Csv "<Full path of CSV containing fields: UserPrincipalName,Id,FirstName,LastName,PositionTitle>"

# Create arrays for skipped and failed users
$SkippedUsers = @()
$FailedUsers = @()

# Loop trough CSV records
foreach ($CSVrecord in $CSVrecords) {
    $upn = $CSVrecord.UserPrincipalName
    $user = Get-AzureADUser -Filter "userPrincipalName eq '$upn'"  
    if ($user) {
        $employeeId = New-Object System.Collections.Generic.Dictionary"[String,String]"
        $employeeId.Add("employeeId",$CSVrecord.Id)
        try{
        $user | Set-AzureADUser -ExtensionProperty $employeeId -GivenName $CSVrecord.FirstName -Surname $CSVrecord.LastName -JobTitle $CSVrecord.PositionTitle
        Write-Output "$upn user added successfully!"
        } catch {
        $FailedUsers += $upn
        Write-Warning "$upn user found, but FAILED to update."
        }
    }
    else {
        Write-Warning "$upn not found, skipped"
        $SkippedUsers += $upn
    }
}

# Array skipped users
# $SkippedUsers

# Array failed users
# $FailedUsers