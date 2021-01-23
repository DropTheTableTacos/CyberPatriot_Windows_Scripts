# ----------------------------------------------------------------
#            CyberPatriot Windows PowerShell MEGAScript
#                        by Jackson Kauflin
#
#                This is the PROFILE, which contains
#                      every single function.
#
#                       This gets copied to:
#  ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# ----------------------------------------------------------------


# ---------------------
#  Forensics Questions
# ---------------------

# Open forensics questions
function Open-ForensicsQuestions {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_
    }
    Write-Output "Do the forensics questions or work on them while other stuff runs in the background."
    Pause
    Add-Progress "Opened the forensics questions."
    Write-Output "Opened the forensics questions."
}


# ---------------
#  User Auditing
# ---------------

# Remove unauthorized users
function Remove-Users {
    $global:badusers = Get-BadUsers
    $badusers.foreach{
        Remove-LocalUser $_
        Add-Progress "Removed unauthorized user $_"
        Write-Output "$_ was yeeted off the face of the earth."
    }
}

# Remove unauthorized admins
function Remove-Admins {
    $global:badadmins = Get-BadAdmins
    # Check if user list exists
    if ($null -eq $badadmins) {
        $global:badadmins = Get-BadAdmins
    }
    $badadmins.foreach{
        Remove-LocalGroupMember "Administrators" $_
        Add-Progress "Removed unauthorized admin $_"
        Write-Output "$_ was yeeted out of the administrators group."
    }
}

# Set all user passwords
function Set-Passwords {
    $users.foreach{
        Set-LocalUser $_ -Password $pass
    }
    Add-Progress "All user passwords set to 'abc123ABC123@@'."
    Write-Output "All user passwords set to 'abc123ABC123@@'."
}

# Set passwords to expire
function Set-PasswordExpiration {
    $users.foreach{
        Set-LocalUser -Name "$_" -PasswordNeverExpires $false
    }
    Add-Progress "Set passwords to expire."
    Write-Output "Set passwords to expire."
}

# Disable built-in users
function Disable-BuiltInUsers {
    $dumbusers = "BroShirt","BroPants","Administrator","Guest"
    $dumbusers.foreach{
        Disable-LocalUser $_ -ErrorAction SilentlyContinue
    }
    Add-Progress "Built-in user accounts disabled."
    Write-Output "Built-in user accounts disabled."
}

# Enable all authorized users
function Enable-AllAuthorizedUsers {
    $users_nobuiltin.foreach{
        Enable-LocalUser $_
    }
    Add-Progress "All users (except built-in) enabled."
    Write-Output "All users (except built-in) enabled."
}

# Delete unauthorized user folders
function Remove-BadUserFolders {
    $global:badusers = Get-BadUsers
    $badusers.foreach{
        Remove-Item C:\Users\$_ -Recurse -Force
    }

    Add-Progress "Deleted unauthorized user folders."
    Write-Output "Deleted unauthorized user folders."
}


# ------------------
#  Account Policies
# ------------------

# In GPO.


# ----------------
#  Local Policies
# ----------------

# Apply GPO
function Apply-GPO {
    # Update registry.pol files
    LGPO /r "$compfiles\gpos\machine_lgpo.txt" /w "$compfiles\gpos\Win10\Machine\registry.pol"
    LGPO /r "$compfiles\gpos\user_lgpo.txt" /w "$compfiles\gpos\Win10\User\registry.pol"

    LGPO /r "$compfiles\gpos\machine_lgpo.txt" /w "$compfiles\gpos\Server2016\DC\Machine\registry.pol"
    LGPO /r "$compfiles\gpos\user_lgpo.txt" /w "$compfiles\gpos\Server2016\DC\User\registry.pol"

    LGPO /r "$compfiles\gpos\machine_lgpo.txt" /w "$compfiles\gpos\Server2016\MS\Machine\registry.pol"
    LGPO /r "$compfiles\gpos\user_lgpo.txt" /w "$compfiles\gpos\Server2016\MS\User\registry.pol"

    LGPO /r "$compfiles\gpos\machine_lgpo.txt" /w "$compfiles\gpos\Server2019\DC\Machine\registry.pol"
    LGPO /r "$compfiles\gpos\user_lgpo.txt" /w "$compfiles\gpos\Server2019\DC\User\registry.pol"

    LGPO /r "$compfiles\gpos\machine_lgpo.txt" /w "$compfiles\gpos\Server2019\MS\Machine\registry.pol"
    LGPO /r "$compfiles\gpos\user_lgpo.txt" /w "$compfiles\gpos\Server2019\MS\User\registry.pol"

    # Import GPO
    if ($os -eq "Win10") {
        LGPO /g "$compfiles\gpos\Win10"
    }

    if ($os -eq "Server2016") {
        if ((Get-CimInstance CIM_OperatingSystem).ProductType -eq "2") {
            LGPO /g "$compfiles\gpos\Server2016\DC"
        } else {
            LGPO /g "$compfiles\gpos\Server2016\MS"
        }    
    }

    if ($os -eq "Server2019") {
        if ((Get-CimInstance CIM_OperatingSystem).ProductType -eq "2") {
            LGPO /g "$compfiles\gpos\Server2019\DC"
        } else {
            LGPO /g "$compfiles\gpos\Server2019\MS"
        }
    }

    # Set useful login screen text
    New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeText" -PropertyType String -Value "Password: $pass" -Force
    New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeCaption" -PropertyType String -Value "Username: $env:USERNAME" -Force

    Add-Progress "GPO imported. Local security policy, auditing, other GP, all registry settings covered."
    Write-Output "GPO imported. Local security policy, auditing, other GP, all registry settings covered."
}

# Delete applocker policies
function Remove-AppLockerPolicies {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"
    Add-Progress "Deleted AppLocker policies."
    Write-Output "Deleted AppLocker policies."
}


# ---------------------------
#  Defensive Countermeasures
# ---------------------------

# Enable Windows Defender in GPO.

# Enable firewall
function Enable-Firewall {
    Set-NetFirewallProfile -All -Enabled True
    Add-Progress "Firewall enabled."
    Write-Output "Firewall enabled."
}

# Install security/utility programs
function Install-Programs {
    Start-Process "$installers\mbam.exe"
    Start-Process "$installers\mbsa.msi"
    Start-Process "$installers\iobituninstaller.exe"
    Start-Process "$installers\iobitunlocker.exe"

    Add-Progress "Installed security/utility programs."
    Write-Output "Installed security/utility programs."
}


# ---------------------------
#  Uncategorized OS Settings
# ---------------------------

# Disable remote desktop
function Disable-RemoteDesktop {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "1" -Force | Out-Null
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType "DWord" -Value "0" -Force | Out-Null
    Stop-Service "termservice"
    Set-Service "termservice" -StartupType Disabled
    Stop-Service "sessionenv"
    Set-Service "sessionenv" -StartupType Disabled
    Add-Progress "Remote desktop disabled."
    Write-Output "Remote desktop disabled."
}

# Enable remote desktop
function Enable-RemoteDesktop {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "0" -Force | Out-Null
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType "DWord" -Value "1" -Force | Out-Null
    Set-Service "termservice" -StartupType Automatic
    Start-Service "termservice"
    Set-Service "sessionenv" -StartupType Automatic
    Start-Service "sessionenv"
    Add-Progress "Remote desktop enabled."
    Write-Output "Remote desktop enabled."
}

# Remove non-administrative shares
function Remove-Shares {
    $shares = (Get-FileShare).Name
    $shares.foreach{
        if ("$_" -notin "IPC$","ADMIN$","C$") {
            Remove-FileShare -Name "$_"
        }
    }
    Add-Progress "Removed all non-administrative shares."
    Write-Output "Removed all non-administrative shares."
}

# Disable Autoplay in GPO.

# Secure screensaver with password in GPO.

# Enable smartscreen in GPO.

# Set UAC to high
function Set-UACHigh {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 5
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1
    Add-Progress "Set UAC to high."
    Write-Output "Set UAC to high."
}

# Enable Windows Server Backup
function Enable-ServerBackup {
    Install-WindowsFeature -Name Windows-Server-Backup
    Add-Progress "Enabled Windows Server Backup."
    Write-Output "Enabled Windows Server Backup."
}

# Clear hosts file
function Clear-HostsFile {
    Write-Output "" > "$env:SYSTEMROOT\System32\drivers\etc\hosts"
    Add-Progress "Cleared hosts file."
    Write-Output "Cleared hosts file."
}

# Enable internet explorer
function Enable-IE {
    if (($env:PROCESSOR_ARCHITECTURE) -eq "x86") {
        Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all -ErrorAction SilentlyContinue
    }
    if (($env:PROCESSOR_ARCHITECTURE) -eq "AMD64") {
        Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all -ErrorAction SilentlyContinue
    }
    Add-Progress "Enabled Internet Explorer."
    Write-Output "Enabled Internet Explorer."
}

# Enable UAC in GPO.

# Setup backup
# WIP
function Enable-Backup {
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
}


# ------------------
#  Service Auditing
# ------------------

# Disable dumb services
function Disable-Services {
    $services = Import-Lists services
    ($services | Where-Object State -match "Disabled").foreach{
        Stop-Service $_.Name
        Set-Service $_.Name -StartupType Disabled
    }
}

# Enable good services
function Enable-Services {
    $services = Import-Lists services
    ($services | Where-Object State -match "Automatic").foreach{
        Set-Service $_.Name -StartupType Automatic
        Start-Service $_.Name
    }
    ($services | Where-Object State -match "Manual").foreach{
        Set-Service $_.Name -StartupType Manual
        Start-Service $_.Name
    }
}

# Disable optional features
function Disable-OptionalFeatures {
    $feature_list = Import-Lists features

    $feature_list.foreach{
        Disable-WindowsOptionalFeature -FeatureName $_.Name -Online -NoRestart
    }
    Add-Progress "Disabled optional features."
    Write-Output "Disabled optional features."
}

# Configure firewall exceptions
function Set-FirewallExceptions {
    Clear-Host
    Write-Output "Check firewall exceptions, bud"
    Firewall.cpl

    Add-Progress "Configured firewall exceptions."
    Write-Output "Configured firewall exceptions."
}

# Check permissions of registry hives
function Set-RegHivePerms {
    Clear-Host
    Write-Output "Check the permissions of registry hives."

    Start-Process "$compfiles\hivepermissions.txt"
    Start-Process regedit.exe

    Write-Output "Set default permissions on registry hives."
    Add-Progress "Set default permissions on registry hives."
}

# Check permissions of event log things
function Set-EventLogPerms {
    Clear-Host
    Write-Output "Check the permissions of event log things."
    Write-Output "`n"
    Write-Output "Application, Security, System"

    explorer "$env:systemroot\System32\winevt"

    Write-Output "Set default permissions on event logs."
    Add-Progress "Set default permissions on event logs."
}


# --------------------------
#  Operating System Updates
# --------------------------

# Start Windows Update
function Start-WindowsUpdate {
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

    Add-Progress "Started Windows update."
    Write-Output "Started Windows update."
}

# Enable automatic update in GPO.


# ---------------------
#  Application Updates
# ---------------------

# Update applications
function Update-Applications {
    patchmypc

    Start-Process "$installers\firefox.msi"

    Add-Progress "Third-party applications updated."
    Write-Output "Third-party applications updated."
}


# ------------------
#  Prohibited Files
# ------------------

# Remove prohibited files
function Remove-ProhibitedFiles {
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/DropTheTableTacos/CyberPatriot_Windows_Scripts/master/rm_prohibfiles.bat?token=ACNBU4EIR5KX5QOOBRUWSRS7W432C" -Destination "$compfiles\rm_prohibfiles.bat"
    
    Start-Process {"$compfiles\rm_prohibfiles.bat"}

    Add-Progress "Prohibited files deleted."
    Write-Output "Prohibited files deleted."
}

# Find prohibited files
function Find-ProhibitedFiles {
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/DropTheTableTacos/CyberPatriot_Windows_Scripts/master/find_prohibitedfiles.bat?token=ACNBU4AP46TWV73DUY4EL427W44WS" -Destination "$compfiles\find_prohibitedfiles.bat"
    
    Start-Process {"$compfiles\find_prohibitedfiles.bat"}

    Add-Progress "Prohibited files found."
    Write-Output "Prohibited files found."
}


# -------------------
#  Unwanted Software
# -------------------

# Remove unwanted software
function Remove-UnwantedSoftware {
    if (Test-Path "$desktop\programfolderbackup" -eq $false) {
        mkdir "$desktop\programfolderbackup"
    }

    Start-Process "${env:ProgramFiles(x86)}\IObit\IObit Uninstaller\IObitUninstaler.exe"

    # Delete sketchy folders in ProgramFiles
    while ($true) {
        $folders = "$env:programfiles","${env:programfiles(x86)}","C:\ProgramData"
        $folders.foreach{
            Clear-Host
            Set-Location "$_"
            Get-ChildItem "$_"
            Get-ChildItem "$_" -Hidden
            Get-ChildItem "$_" -Attributes Encrypted

            $cringeprogram = Read-Host "`nType any sketcy folders you see"

            :a if ($cringeprogram -eq "n") {
                break a
            }

            Copy-Item "$_" "$desktop\programfolderbackup"
            Remove-Item "$cringeprogram" -Recurse -Force
        }
    }

    Add-Progress "Removed unauthorized programs."
    Write-Output "Removed unauthorized programs."
}

# ---------
#  Malware
# ---------

# Remove malware
function Remove-Malware {
    Start-Process "$env:programfiles\Malwarebytes\Anti-Malware\mbam.exe"

    Add-Progress "Removed malware."
    Write-Output "Removed malware."
}

# Run Sysinternals
function Run-Sysinternals {
    $sysinternals = "autoruns","procexp","tcpview"

    $sysinternals.foreach{
        Start-Process "$_"
    }

    Add-Progress "Ran sysinternals tools."
    Write-Output "Ran sysinternals tools."
}


# -------------------------------
#  Application Security Settings
# -------------------------------

# Configure firefox settings
function Set-FirefoxConfig {
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
}


# ---------------
#  Miscellaneous
# ---------------

# Open README
function Open-Readme {
    Start-Process "C:\CyberPatriot\README.url"

    Write-Output "README opened."

    Pause
}

# Import lists
function Import-Lists {
    return Import-Csv "$compfiles\lists\$args.csv"
}

# Add folders to PATH
$env:Path += ";$Env:CMDER_ROOT\bin;$Env:CMDER_ROOT\vendor\bin;$Env:CMDER_ROOT;$Env:CMDER_ROOT\bin\ciscatlite;$Env:CMDER_ROOT\bin\ripgrep;$Env:CMDER_ROOT\bin\sysinternals"

# Cat-Lite scanner
function Start-CatLite {
    Start-Process "$cmderbin\cis-cat-lite\CISCAT.jar"
}

# Add Admins
function addadmin {
    Add-LocalGroupMember Administrators $args
}

# Add users
function adduser {
    New-LocalUser $args -Password $pass
}

# Add groups function cause why not
function addgroup {
    New-LocalGroup -Name $args
}

# List functions
function Get-Functions {
    $functions = Import-Lists functions
    $functions | Format-Table
}

# Run script easily function
function script {
    . "$compfiles\script.ps1" "$args"
}

# Open Scoring report
function Open-ScoringReport {
    Start-Process "C:\CyberPatriot\ScoringReport.html"
}

# Open stop scoring thing (to check scoring timer)
function Open-StopScoring {
    Start-Process "C:\CyberPatriot\Stop.exe"
}

# Replace ease of access menu with powershell because reasons
function Set-EaseOfAccess {
    # Take ownership
    takeown /f "C:\Windows\System32\utilman.exe" >null
    icacls "C:\Windows\System32\utilman.exe" /grant ${env:username}:`(F`) >null
    takeown /f "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" >null
    icacls "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /grant ${env:username}:`(F`) >null

    # Replace files
    Move-Item "C:\Windows\System32\utilman.exe" "C:\Windows\System32\utilman1.exe" -Force -ErrorAction SilentlyContinue
    Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "C:\Windows\System32\utilman.exe" -Force -ErrorAction SilentlyContinue
}

# Allow cmder, stop scoring, etc. to work lol
function Unblock-Programs {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ValidateAdminCodeSignatures" -PropertyType "DWord" -Value "0" -Force | Out-Null
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableUIADesktopToggle" -PropertyType "DWord" -Value "0" -Force | Out-Null
}

# Get OS name
function Get-OS {
    $os_name = (Get-CimInstance CIM_OperatingSystem).Name
    $os_list = "Windows 10","Server 2016","Server 2019"

    $os_list.foreach{
        if ($os_name -match $_) {
            $os_name = $_

            # Change name to shorter, gooder version
            if ($os_name -in "Windows 10") {return $os_name.Remove(3,5)}
            if ($os_name -in "Server 2016") {return $os_name.Remove(6,1)}
            if ($os_name -in "Server 2019") {return $os_name.Remove(6,1)}
        }
    }
}

# Get bad users list
function Get-BadUsers {
    # Add readme users to file if needed
    if ((Test-Path "C:\ulist_no") -eq $true) {
        break
    }
    if ((Test-Path "C:\ulist_yes") -eq $true) {
        if ((Test-Path "C:\good_users.txt") -eq $false) {
            Open-Readme
            Write-Output "Put README users in this text file. (replace this text)" >> "C:\good_users.txt"
            Write-Output "Put a semicolon at the end of each administrator." >> "C:\good_users.txt"
            Start-Process "C:\good_users.txt"
            Pause
        }

        $gooduserlist = Get-Content "C:\good_users.txt" 2> $null
        $goodusers = ($gooduserlist).Trim(";")

        # Compare and get bad users
        (Compare-Object $goodusers $users_nobuiltin).foreach{
            return $_.InputObject
        }
    }
}

# Get bad admin list
function Get-BadAdmins {
    # Add readme users to file if needed
    if ((Test-Path "C:\ulist_no") -eq $true) {
        break
    }
    if ((Test-Path "C:\ulist_yes") -eq $true) {
        if ((Test-Path "C:\good_users.txt") -eq $false) {
            Open-Readme
            Write-Output "Put README users in this text file. (replace this text)" >> "C:\good_users.txt"
            Write-Output "Put a semicolon at the end of each administrator." >> "C:\good_users.txt"
            Start-Process "C:\good_users.txt"
            Pause
        }

        $gooduserlist = Get-Content "C:\good_users.txt" 2> $null
        $goodadmins = ($gooduserlist | Select-String ";" | Out-String -Stream).Trim(";")

        # Compare and get bad users
        (Compare-Object $goodadmins $users_nobuiltin).foreach{
            return $_.InputObject
        }
    }
}

# Add to progress log
function Add-Progress {
    Write-Output "$args`n" >> "$desktop\progress.txt"
}

# Variables
$global:desktop = "$env:userprofile\Desktop"
$global:compfiles = "$desktop\Script"
$global:installers = "$compfiles\installers"
$global:pass = "abc123ABC123@@" | ConvertTo-SecureString -AsPlainText -Force
$global:os = Get-OS
$global:users = (Get-LocalUser).Name
$global:users_nobuiltin = (Get-LocalUser | Where-Object Description -notmatch "." | Where-Object Name -ne "defaultuser0").Name
$global:admins = (Get-LocalGroupMember Administrators).Name.Trim(($env:COMPUTERNAME | Out-String)).Trim("\")
$global:admins_nobuiltin = $admins | Select-String -NotMatch "Administrator"

# Import aliases
Set-Alias -Name scl -Value Start-CatLite -Option AllScope -Force
Set-Alias -Name gf -Value Get-Functions -Option AllScope -Force
Set-Alias -Name osr -Value Open-ScoringReport -Option AllScope -Force
Set-Alias -Name oss -Value Open-StopScoring -Option AllScope -Force
Set-Alias -Name seoa -Value Set-EaseOfAccess -Option AllScope -Force
Set-Alias -Name up -Value Unblock-Programs -Option AllScope -Force

Set-EaseOfAccess
Unblock-Programs

Clear-Host