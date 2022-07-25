#The HTTP POST URL from Microsoft Flow

$URI = "" #ADD YOUR URL HERE

#Get Current ComputerName

$computer = $env:computername

#Get Current UserName

$CurrentUser = whoami

#Get User’s Local Group Membership

$CurrentUserGroups = whoami /groups

#Check if current user is a member of the Local Admins group

$CurrentUserAdmin = $CurrentUserGroups -like "*S-1-5-32-544*"

#If user is an admin

if ($CurrentUserAdmin) {

$body = ConvertTo-JSON @{Device = $computer; User = $CurrentUser; IsAdmin = 'true'}

#Start Flow

Invoke-RestMethod -uri $URI -Method Post -body $body -ContentType 'application/json'

}

#If user is not an admin

else {

$body = ConvertTo-JSON @{Device = $computer; User = $CurrentUser; IsAdmin = 'false'}

#Start Flow

Invoke-RestMethod -uri $URI -Method Post -body $body -ContentType 'application/json'

}