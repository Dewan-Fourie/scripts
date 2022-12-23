# Script to give user permission to all calendars in tenancy.
Import-Module "<Full path of EXO V2 module>"
Connect-ExchangeOnline -UserPrincipalName "<GLobal/Mailbox Admin>"

# This only gets the Microsoft 365 Groups.
Get-UnifiedGroup -ResultSize Unlimited | Select-Object PrimarySmtpAddress | ForEach-Object {
    Set-UnifiedGroup $_.PrimarySmtpAddress -CalendarMemberReadOnly:$true
    $FolderMailbox = $_.PrimarySmtpAddress + ":\calendar"
    $validation = Get-MailboxFolderPermission $FolderMailbox -User "Member@local" -GroupMailbox | Select-Object AccessRights
    # Validation
    if("Reviewer" -eq $validation.AccessRights){
        Write-Host $_.PrimarySmtpAddress "'s Member@local member was changed to read only." -ForegroundColor Green
    } else {
        Write-Host "Something went wrong with changing " $_.PrimarySmtpAddress "'s Member@local permissions." -ForegroundColor red
    }
}

Disconnect-ExchangeOnline