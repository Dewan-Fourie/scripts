import-module "<Full path of EXO V2 module>"

$AdminSiteURL="https://<Tenancy>-admin.sharepoint.com"
$OneDriveSiteUrl="https://<Tenancy>-my.sharepoint.com/personal/<Personal Site>"
 
#Get Credentials to connect to SharePoint Admin Center
$Cred = Get-Credential
 
#Connect to SharePoint Online Admin Center
Connect-SPOService -Url $AdminSiteURL -credential $Cred
 
#Remove OneDrive Site Collection
Remove-SPOSite -identity $OneDriveSiteUrl
Write-Host "OneDrive site collection deleted successfully"


#Read more: https://www.sharepointdiary.com/2017/04/how-to-delete-onedrive-for-business-site-collection-sharepoint-online.html#ixzz7jYV3riag