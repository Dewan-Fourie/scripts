# Get location of PnP SharePoint module using "Get-Module -ListAvailable" command in powershell.
Import-Module '<SharePoint PnP Module>'

$SiteURL = '<Site URL>'
$ListName = '<List Name>'
 
Try {
    #Connect to PnP Online
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
    #Get the Default Members Group 
    $MembersGroup = Get-PnPGroup -AssociatedMemberGroup
    Write-Host $($MembersGroup.Title) -ForegroundColor Blue
   
    #Grant "Contribute" permission to the Group and remove "Edit"
    Set-PnPGroupPermissions -Identity $($MembersGroup.Title) -List $ListName -AddRole "Read" -RemoveRole "Edit"
 
    Write-Host "Removed 'Edit' Permissions and Granted 'Contribute' to $($MembersGroup.Title). " -foregroundcolor Green
}
Catch {
    write-host -f Red "Error Setting Permissions!" $_.Exception.Message
}  