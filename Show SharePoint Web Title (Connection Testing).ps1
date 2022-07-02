#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
#Get Credentials to connect
$Cred= Get-Credential
$SiteURL = "https://lealtec.sharepoint.com/sites/Testing"
  
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