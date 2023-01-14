#Load SharePoint CSOM Assemblies
Add-Type -Path "<Full path of Microsoft.SharePoint.Client module>"
Add-Type -Path "<Full path of Microsoft.SharePoint.Client.Runtime module>"
 
#Get Credentials to connect
$Cred= Get-Credential
$SiteURL = "<SharePoint site URL>"
  
#Setup the context
$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
$Ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
 
#Get The Web
$Web =  $Ctx.Web
$Ctx.Load($Web)
$Ctx.ExecuteQuery()
 
#Get Web Title
Write-host $Ctx.Web.Title

#Read more: https://www.sharepointdiary.com/2018/12/download-install-sharepoint-online-client-side-sdk-using-powershell.html#ixzz7XlnFj5rr