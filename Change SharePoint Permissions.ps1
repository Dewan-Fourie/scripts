$SiteURL = "https://contoso.sharepoint.com/sites/<site>"
 
Try {
    #Connect to PnP Online
    Connect-PnPOnline -Url $SiteURL -Interactive
 
    #Get the Default Members Group 
    $MembersGroup = Get-PnPGroup -AssociatedMemberGroup
   
    #Grant "Contribute" permission to the Group and remove "Edit"
    Set-PnPGroupPermissions -Identity $MembersGroup -AddRole "Contribute" -RemoveRole "Edit"
 
    Write-Host "Removed 'Edit' Permissions and Granted 'Contribute' to $($MembersGroup.Title). " -foregroundcolor Green
}
Catch {
    write-host -f Red "Error Setting Permissions!" $_.Exception.Message
}  