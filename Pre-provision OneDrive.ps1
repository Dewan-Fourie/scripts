# Use (Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Scope Allusers) to install Microsoft Online SharePoint PowerShell modules.
# Use (Get-Module -listavailable) to find the path of 'Microsoft.Online.SharePoint.PowerShell' and enter below.
Import-Module "C:\Program Files\PowerShell\Modules\Microsoft.Online.SharePoint.PowerShell" # This may be different to your environment.
$credential = Get-credential
Connect-SPOService -url 'https://<tenant>-admin.sharepoint.com/' -Credential $credential #Use the global admin credentials.

$InputFilePath = "<Full path of csv file>" #Set this to the CSV file of the accounts you want to provision.
# The csv file needs 'User' as the header, with all the accounts listed under it.

$CsvFile = Import-Csv $InputFilePath

ForEach ($line in $CsvFile)
{ 
    Request-SPOPersonalSite -UserEmails $line.User -NoWait
    Write-Host Personal site provisioned for $line.User -ForegroundColor Yellow
}

# If facing issues, use (Uninstall-Module -Name Microsoft.Online.SharePoint.PowerShell) to uninstall modules, and re-install.
# It might be necessary to manually delete all folders starting with 'Microsoft.SharePoint' in 'C:\Windows\Microsoft.NET\assembly\GAC_MSIL'