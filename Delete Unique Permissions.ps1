#Load SharePoint Online Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
#To call a non-generic method Load
Function Invoke-LoadMethod() {
    param(
            [Microsoft.SharePoint.Client.ClientObject]$Object = $(throw "Please provide a Client Object"),
            [string]$PropertyName
        ) 
   $ctx = $Object.Context
   $load = [Microsoft.SharePoint.Client.ClientContext].GetMethod("Load") 
   $type = $Object.GetType()
   $clientLoad = $load.MakeGenericMethod($type)
   
   $Parameter = [System.Linq.Expressions.Expression]::Parameter(($type), $type.Name)
   $Expression = [System.Linq.Expressions.Expression]::Lambda([System.Linq.Expressions.Expression]::Convert([System.Linq.Expressions.Expression]::PropertyOrField($Parameter,$PropertyName),[System.Object] ), $($Parameter))
   $ExpressionArray = [System.Array]::CreateInstance($Expression.GetType(), 1)
   $ExpressionArray.SetValue($Expression, 0)
   $clientLoad.Invoke($ctx,@($Object,$ExpressionArray))
}
    
##Variables for Processing
$SiteUrl = "https://crescent.sharepoint.com"
$ListName= "Documents"
   
#Get Credentials to connect
$Cred= Get-Credential
$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
   
#Set up the context
$Context = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl) 
$Context.Credentials = $Credentials
    
#Get the List
$List = $Context.web.Lists.GetByTitle($ListName)
 
$Query = New-Object Microsoft.SharePoint.Client.CamlQuery
$Query.ViewXml = "<View Scope='RecursiveAll'><RowLimit>2000</RowLimit></View>"
 
#Batch process list items - to mitigate list threshold issue on larger lists
Do {  
    #Get items from the list in batches
    $ListItems = $List.GetItems($Query)
    $Context.Load($ListItems)
    $Context.ExecuteQuery()
           
    $Query.ListItemCollectionPosition = $ListItems.ListItemCollectionPosition
  
    #Loop through each List item
    ForEach($ListItem in $ListItems)
    {
        Invoke-LoadMethod -Object $ListItem -PropertyName "HasUniqueRoleAssignments"
        $Context.ExecuteQuery()
        if ($ListItem.HasUniqueRoleAssignments -eq $true)
        {
            #Reset Permission Inheritance
            $ListItem.ResetRoleInheritance()
            Write-host  -ForegroundColor Yellow "Inheritence Restored on Item:" $ListItem.ID
        }
    }
    $Context.ExecuteQuery()
} While ($Query.ListItemCollectionPosition -ne $null)
  
Write-host "Broken Permissions are Deleted on All Items!" -ForegroundColor Green