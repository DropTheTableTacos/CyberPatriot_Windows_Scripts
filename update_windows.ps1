# Set windows update service to auto and start
    
Set-Service wuauserv -startuptype Automatic
Start-Service wuauserv

# Enable automatic updates
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name AUOptions -PropertyType DWord -Value "4" -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name AUOptions -PropertyType DWord -Value "4" -Force

# Get microsoft update server and start update, auto too fam
Add-WUServiceManager -MicrosoftUpdate -Silent
Set-WUSettings -AutoInstallMinorUpdates -IncludeRecommendedUpdates
Get-WindowsUpdate -AcceptAll -ForceDownload -ForceInstall -Install