# Script that actually runs everything automatically

($functions | Where-Object Type -match "^Auto$").foreach{
    Invoke-Expression -Command "$_.Name"
}

# Run gamer seperate scripts
Disable-Features
Install-Programs
Remove-ProhibitedFiles
Disable-Services
Update-Windows
Start-CiscatRegistry
Import-IERegistry