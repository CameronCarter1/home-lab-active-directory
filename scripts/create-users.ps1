# Bulk user creation script for Active Directory
$users = @(
    @{Name="James Carter"; Username="jcarter"; OU="OU=IT,DC=corp,DC=local"},
    @{Name="Maria Gonzalez"; Username="mgonzalez"; OU="OU=HR,DC=corp,DC=local"},
    @{Name="David Kim"; Username="dkim"; OU="OU=Finance,DC=corp,DC=local"},
    @{Name="Ashley Thompson"; Username="athompson"; OU="OU=Sales,DC=corp,DC=local"},
    @{Name="Marcus Williams"; Username="mwilliams"; OU="OU=IT,DC=corp,DC=local"},
    @{Name="Priya Patel"; Username="ppatel"; OU="OU=HR,DC=corp,DC=local"},
    @{Name="Tyler Brooks"; Username="tbrooks"; OU="OU=Finance,DC=corp,DC=local"},
    @{Name="Samantha Reed"; Username="sreed"; OU="OU=Sales,DC=corp,DC=local"},
    @{Name="Jordan Mitchell"; Username="jmitchell"; OU="OU=IT,DC=corp,DC=local"},
    @{Name="Lauren Evans"; Username="levans"; OU="OU=HR,DC=corp,DC=local"}
)

foreach ($user in $users) {
    New-ADUser `
        -Name $user.Name `
        -SamAccountName $user.Username `
        -UserPrincipalName "$($user.Username)@corp.local" `
        -Path $user.OU `
        -AccountPassword (ConvertTo-SecureString "Welcome@123" -AsPlainText -Force) `
        -Enabled $true
    Write-Host "Created user: $($user.Name)"
}
