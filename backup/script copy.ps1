# THE CyberPatriot Windows MEGAScript
# by Jackson Kauflin

# Start windows update
Invoke-Expression "cmd /c start powershell {$compfiles\update_windows.ps1}"

Add-Progress "Started Windows update."
Write-Output "Started Windows update."

# Apply GPO

# Update registry.pol files
LGPO /r "$gpos\machine_lgpo.txt" /w "$gpos\Win10\Machine\registry.pol"
LGPO /r "$gpos\user_lgpo.txt" /w "$gpos\Win10\User\registry.pol"

LGPO /r "$gpos\machine_lgpo.txt" /w "$gpos\Server2016\DC\Machine\registry.pol"
LGPO /r "$gpos\user_lgpo.txt" /w "$gpos\Server2016\DC\User\registry.pol"

LGPO /r "$gpos\machine_lgpo.txt" /w "$gpos\Server2016\MS\Machine\registry.pol"
LGPO /r "$gpos\user_lgpo.txt" /w "$gpos\Server2016\MS\User\registry.pol"

LGPO /r "$gpos\machine_lgpo.txt" /w "$gpos\Server2019\DC\Machine\registry.pol"
LGPO /r "$gpos\user_lgpo.txt" /w "$gpos\Server2019\DC\User\registry.pol"

LGPO /r "$gpos\machine_lgpo.txt" /w "$gpos\Server2019\MS\Machine\registry.pol"
LGPO /r "$gpos\user_lgpo.txt" /w "$gpos\Server2019\MS\User\registry.pol"

# Import GPO
if ($os -eq "Win10") {
    LGPO /g "$gpos\Win10"
}

if ($os -eq "Server2016") {
    if ((Get-CimInstance CIM_OperatingSystem).ProductType -eq "2") {
        LGPO /g "$gpos\Server2016\DC"
    } else {
        LGPO /g "$gpos\Server2016\MS"
    }
    
}

if ($os -eq "Server2019") {
    if ((Get-CimInstance CIM_OperatingSystem).ProductType -eq "2") {
        LGPO /g "$gpos\Server2019\DC"
    } else {
        LGPO /g "$gpos\Server2019\MS"
    }
    
}

# Set useful login screen text
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeText" -PropertyType String -Value "Password: $pass" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeCaption" -PropertyType String -Value "Username: $env:USERNAME" -Force

Add-Progress "GPO imported. Local security policy, auditing, other GP, all registry settings covered."
Write-Output "GPO imported. Local security policy, auditing, other GP, all registry settings covered."

# Remove unauthorized users

# Check if user list exists
if ($null -eq $badusers) {
    $global:autouser = $true
    $global:badusers = Get-BadUsers
}

$badusers.foreach{
    Remove-LocalUser $_
    Add-Progress "Removed unauthorized user $_"
    Write-Output "$_ was yeeted off the face of the earth."
}

# Remove unauthorized admins

# Check if user list exists
if ($null -eq $badadmins) {
    $global:autouser = $true
    $global:badadmins = Get-BadAdmins
}

$badadmins.foreach{
    Remove-LocalGroupMember "Administrators" $_
    Add-Progress "Removed unauthorized admin $_"
    Write-Output "$_ was yeeted out of the administrators group."
}

# Set all user passwords
$users.foreach{
    Set-LocalUser $_ -Password $pass
}

Add-Progress "All user passwords set to 'abc123ABC123@@'."
Write-Output "All user passwords set to 'abc123ABC123@@'."

# Enable firewall
Set-NetFirewallProfile -All -Enabled True

Add-Progress "Firewall enabled."
Write-Output "Firewall enabled."

# Set passwords to expire
$users.foreach{
    Set-LocalUser -Name "$_" -PasswordNeverExpires $false
}

Add-Progress "Set passwords to expire."
Write-Output "Set passwords to expire."

# Disable built-in users
$dumbusers = "BroShirt","BroPants","Administrator","Guest"

$dumbusers.foreach{
    Disable-LocalUser $_ -ErrorAction SilentlyContinue
}

Add-Progress "Built-in user accounts disabled."
Write-Output "Built-in user accounts disabled."

# Enable all users
$users_nobuiltin.foreach{
    Enable-LocalUser $_
}

Add-Progress "All users (except built-in) enabled."
Write-Output "All users (except built-in) enabled."

# Disable remote dekstop if required
$answer = Read-Host "Disable remote desktop? (y/n)"

if ($answer -eq "y") {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "1" -Force | Out-Null
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType "DWord" -Value "0" -Force | Out-Null

    $global:rd_enable = $false

    Add-Progress "Remote desktop disabled."
    Write-Output "Remote desktop disabled."
} else {
    $global:rd_enable = $true

    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "0" -Force | Out-Null
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType "DWord" -Value "1" -Force | Out-Null
}

# Enable Windows Defender
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | New-ItemProperty -Name "DisableAntiSpyware" -PropertyType "DWord" -Value "0" -Force | Out-Null

Add-Progress "Enabled Windows Defender."
Write-Output "Enabled Windows Defender."

# Secure screensaver with password
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType "DWord" -Value "1" -Force | Out-Null
New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType "DWord" -Value "1" -Force | Out-Null

Add-Progress "Secured screensaver with password."
Write-Output "Secured screensaver with password."

# Reset hosts file
Copy-Item "$compfiles\hosts" "$env:SystemRoot\System32\drivers\etc\hosts" -Force

Add-Progress "Reset hosts file."
Write-Output "Reset hosts file."

# Configure firefox settings

# Backup current profiles
Copy-Item "$env:APPDATA\Mozilla\Firefox\Profiles" -Recurse "$desktop\firefoxprofiles"

# Add config files
if ((Test-Path "$env:programfiles\Mozilla Firefox") -eq $True) {
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles\Mozilla Firefox\mozilla.cfg" -Force
    Copy-Item "$compfiles\firefox_config\local-settings.js" "$env:programfiles\Mozilla Firefox\defaults\pref\local-settings.js" -Force
} else {
    # 32 bit
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "${env:programfiles(x86)}\Mozilla Firefox\mozilla.cfg" -Force
    Copy-Item "$compfiles\firefox_config\local-settings.js" "${env:programfiles(x86)}\Mozilla Firefox\defaults\pref\local-settings.js" -Force
}

Add-Progress "Configured firefox settings."
Write-Output "Configured firefox settings."

# Enable internet explorer
if (($env:PROCESSOR_ARCHITECTURE) -eq "x86") {Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all -ErrorAction SilentlyContinue}
if (($env:PROCESSOR_ARCHITECTURE) -eq "AMD64") {Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all -ErrorAction SilentlyContinue}

Add-Progress "Enabled Internet Explorer."
Write-Output "Enabled Internet Explorer."

# Delete applocker policies
Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

Add-Progress "Deleted AppLocker policies."
Write-Output "Deleted AppLocker policies."

# Enable UAC
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableLUA" -PropertyType "DWord" -Value "1" -Force | Out-Null

Add-Progress "Enabled UAC."
Write-Output "Enabled UAC."

# Enable SmartScreen
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "EnableSmartScreen" -PropertyType "DWord" -Value "2" -Force | Out-Null

Add-Progress "Enabled SmartScreen."
Write-Output "Enabled SmartScreen."

# Open forensics questions
(Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
    Start-Process $_
}
Write-Output "Do the forensics questions or work on them while other stuff runs in the background."
Pause

Add-Progress "Opened the forensics questions."
Write-Output "Opened the forensics questions."

# Disable optional features
Invoke-Expression "cmd /c start powershell {$compfiles\disable_features.ps1}"

Add-Progress "Disabled optional features."
Write-Output "Disabled optional features."

# Install security programs
Invoke-Expression "cmd /c start powershell {$compfiles\install_programs.ps1}"

Add-Progress "Installed security programs."
Write-Output "Installed security programs."

# Delete prohibited files
Invoke-Expression "cmd /c $compfiles\rm_prohibfiles.bat"

Add-Progress "Prohibited files deleted."
Write-Output "Prohibited files deleted."

# Configure services
Invoke-Expression "cmd /c start powershell {$compfiles\configure_services.ps1}"

Add-Progress "Configured services."
Write-Output "Configured services."

# Enable automatic windows update
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name "NoAutoUpdate" -PropertyType "DWord" -Value "0" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name "AUOptions" -PropertyType "DWord" -Value "4" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "NoAutoUpdate" -PropertyType "DWord" -Value "0" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "AUOptions" -PropertyType "DWord" -Value "4" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name "ElevateNonAdmins" -PropertyType "DWord" -Value "1" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name "IncludeRecommendedUpdates" -PropertyType "DWord" -Value "1" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\Auto Update" -Force | New-ItemProperty -Name "ScheduledInstallTime" -PropertyType "DWord" -Value "22" -Force | Out-Null

Add-Progress "Enabled automatic windows update."
Write-Output "Enabled automatic windows update."

# Remove C share
Remove-FileShare -Name C

Add-Progress "Removed C share (if it existed)."
Write-Output "Removed C share (if it existed)."

# Remove unauthorized programs
Start-Process "${env:ProgramFiles(x86)}\IObit\IObit Uninstaller\IObitUninstaler.exe"

Add-Progress "Removed unauthorized programs."
Write-Output "Removed unauthorized programs."

# Remove malware
Start-Process "$env:programfiles\Malwarebytes\Anti-Malware\mbam.exe"

Add-Progress "Removed malware."
Write-Output "Removed malware."

# Delete unauthorized user folders

# Check if user list exists
if ($null -eq $badusers) {
    $global:autouser = $true
    $global:badusers = Get-BadUsers
}

$badusers.foreach{
    Remove-Item C:\Users\$_ -Recurse -Force
}

Add-Progress "Deleted unauthorized user folders."
Write-Output "Deleted unauthorized user folders."

# Update applications
patchmypc

Start-Process "$installers\firefox.msi"
Start-Process "$installers\notepadplusplus.exe"

Add-Progress "Third-party applications updated."
Write-Output "Third-party applications updated."

# Unlock all users


# Find prohibited files
Invoke-Expression "cmd /c start powershell {$compfiles\find_prohibitedfiles.ps1}"

Add-Progress "Found prohibited files."
Write-Output "Found prohibited files."

# Run Sysinternals
$sysinternals = "autoruns","procexp","tcpview"

$sysinternals.foreach{
    Start-Process "$_"
}

Add-Progress "Ran sysinternals tools."
Write-Output "Ran sysinternals tools."

# Setup backup
# WIP
Install-WindowsFeature Windows-Server-Backup

Clear-Host
Write-Output "Plug in a flashdrive mate"
Pause

while ($true) {
    Clear-Host
    Get-PSDrive -PSProvider "FileSystem"

    $answer = Read-Host "Choose the drive to use for backup"

    if ($answer -eq "n") {
        break
    }

    wbadmin start backup -backupTarget:${answer}: -include:C: -quiet -allCritical
}

Add-Progress "Setup backup."
Write-Output "Setup backup."

# Configure firewall exceptions
Clear-Host
Write-Output "Check firewall exceptions, bud"
Firewall.cpl

Add-Progress "Configured firewall exceptions."
Write-Output "Configured firewall exceptions."

# Check permissions of registry hives
Clear-Host
Write-Output "Check the permissions of registry hives."

Start-Process "$compfiles\hivepermissions.txt"
Start-Process regedit.exe

Write-Output "Set default permissions on registry hives."
Add-Progress "Set default permissions on registry hives."

# Check permissions of event log things
Clear-Host
Write-Output "Check the permissions of event log things."
Write-Output "`n"
Write-Output "Application, Security, System"

explorer "$env:systemroot\System32\winevt"

Write-Output "Set default permissions on event logs."
Add-Progress "Set default permissions on event logs."