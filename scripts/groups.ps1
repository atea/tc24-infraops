$deltakere = Get-Content .\oppmeldte

Import-Module Microsoft.Graph

Connect-MgGraph -TenantId e007b86d-d3b0-4f2d-a8b8-2fdf7ea788ae -Scopes "Group.ReadWrite.All","User.ReadWrite.All"

Get-MgGroup -GroupId dec1b7dc-4231-48ed-9acc-d7dc4c2f31c2

foreach($line in $deltakere.Split(" ")){
    $displayname = (Get-Culture).TextInfo.ToTitleCase($line.Split("@")[0].Replace(".", " "))
    Write-Host $displayname
    New-MgInvitation -InvitedUserDisplayName $displayname -InvitedUserEmailAddress $line -InviteRedirectUrl "https://myapplications.microsoft.com" -SendInvitationMessage:$true
    $user = Get-MgUser -Filter "Mail eq '$line'"
    New-MgGroupMember -GroupId fa3f47fe-60e5-4957-b1bb-4f5d41dc4655 -DirectoryObjectId $user.Id
}