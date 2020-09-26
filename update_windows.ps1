# Update windows

# Install & import PSWindowsUpdate module
New-Item -Path "HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319" -Force | New-ItemProperty -Name "SchUseStrongCrypto" -PropertyType "DWord" -Value "1" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319" -Force | New-ItemProperty -Name "SchUseStrongCrypto" -PropertyType "DWord" -Value "1" -Force | Out-Null
Install-Module PowershellGet -Force
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate

# Install recommended & minor updates
Set-WUSettings -AutoInstallMinorUpdates -IncludeRecommendedUpdates

# Start Windows Update service
Set-Service wuauserv -StartupType Automatic
Start-Service wuauserv

# Install Windows Updates
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll