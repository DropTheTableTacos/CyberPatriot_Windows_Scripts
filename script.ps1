# Jackson's Epic Powershell Script That Has A 100% Guaranteed Chance Of Not Breaking During The Competition

# Auto Functions

# Open README
function Open-Readme {
    Start-Process "C:\CyberPatriot\README.url"

    Write-Output "README opened."
}

# SCT Baselines
function Import-SCT {
    Set-Location "$cmderbin"

    # Import Microsoft recommended baselines like an absolute chad
    .\LGPO.exe /g "$sct\MS"

    # Import chad custom baselines too
    .\LGPO.exe /g "$sct\Custom\Good"

    if ($args -eq "bad") {
        .\LGPO.exe /g "$sct\Custom\Bad"
    }

    # Allow cmder and stop scoring, etc. to actually run lol
    Fix-Programs

    # Set logon message
    Set-LogonMessage

    Add-Progress "SCT Baselines imported."
    Write-Output "SCT baselines imported."
}

# Delete users
function Remove-Users {
    if ($args -in "m","man","manual") {
        while ($true) {
            Clear-Host

            Get-Users nobuiltin
            Write-Output "`n"
            $answer = Read-Host "Enter a username to delete"

            if ($answer -eq "n") {
                break
            }

            Remove-LocalUser $answer
        }

        Add-Progress "User(s) have been deleted"
    } else {
        $global:badusers = Get-BadUsers

        $badusers.foreach{
            Remove-LocalUser $_
            Write-Output "$_ was yeeted off the face of the earth."
        }

        Add-Progress "Unauthorized user(s) have been deleted"
    }
}

# Delete Admins
function Remove-Admins {
    if ($args -in "m","man","manual") {
        while ($true) {
            Clear-Host

            Get-Admins
            Write-Output "`n"
            $answer = Read-Host "Enter a username to delete"

            if ($answer -eq "n") {
                break
            }

            Remove-LocalGroupMember "Administrators" $answer
        }

        Add-Progress "Admin(s) have been deleted"
    } else {
        $badadmins.foreach{
            Remove-LocalGroupMember "Administrators" $_
            Write-Output "$_ was removed from Administrators group."
        }

        Add-Progress "Admin(s) have been deleted"
    }
}

# Change passwords
function Set-Passwords {
    if ($args -in "m","man","manual") {
        while ($true) {
            Clear-Host

            Get-Users
            Write-Output "`n"

            Write-Output "NOTE: Passwords are set to: abc123ABC123@@"
            Write-Output "`n"
            $answer = Read-Host "Enter username to change password"

            if ($answer -eq "n") {
                break
            }

            Set-LocalUser $answer -Password $pass
        }
    } else {
        $users.foreach{
            Set-LocalUser $_ -Password $pass
        }

        Add-Progress "All passwords changed to a gamer secure password"
        Write-Output "All passwords changed to: abc123ABC123@@"
    }
}

# Enable Firewall
function Enable-Firewall {
    Set-NetFirewallProfile -All -Enabled True

    Add-Progress "Firewall enabled, brah."
    Write-Output "Firewall enabled, brah."
}

# Ensure user passwords expire
function Set-PasswordExpire {
    if ($args -in "m","man","manual") {
        while ($true) {
            Clear-Host

            Get-Users
            Write-Output "`n"
            $answer = Read-Host "Enter username to enable password expiration for"

            if ($answer -eq "n") {
                break
            }

            Set-LocalUser -Name "$answer" -PasswordNeverExpires $false
        }
    } else {
        $users.foreach{
            Set-LocalUser -Name "$_" -PasswordNeverExpires $false
        }
    }

    Add-Progress "Set user passwords to expire"
    Write-Output "Set user accounts to expire."
}

# Disable Users
function Disable-Users {
    if ($args -in "m","man","manual") {
        Open-Readme

        while ($true) {
            Clear-Host

            Get-Users
            Write-Output "`n"
            $answer = Read-Host "Enter username to disable"

            if ($answer -eq "n") {
                break
            }

            Disable-LocalUser $answer
        }
    } else {
        $dumbusers = "BroShirt","BroPants","Administrator","Guest"

        $dumbusers.foreach{
            Disable-LocalUser $_ -ErrorAction SilentlyContinue
        }

        Add-Progress "Built-in Admin and Guest disabled"

        Write-Output "Built-in Admin and Guest disabled."
    }
}

# Activate/Disable users
function Enable-Users {
    if ($args -in "man","manual","m") {
        Open-Readme

        while ($true) {
            Clear-Host

            Get-Users nobuiltin
            Write-Output "`n"
            $answer = Read-Host "Enter username to enable"

            if ($answer -eq "n") {
                break
            }

            Enable-LocalUser $answer
        }
    } else {
        $users_nobuiltin.foreach{
            Enable-LocalUser $_
        }

        Add-Progress "All users (except built-in Admin and Guest) enabled"

        Write-Output "All users (except built-in Admin and Guest) enabled."
    }
}

# Disable remote desktop
function Disable-RemoteDesktop {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "1" -Force
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType "DWord" -Value "0" -Force

    Add-Progress "Remote Desktop disabled"
    Write-Output "Disable remote desktop."
}

# Enable Windows Defender
function Enable-WindowsDefender {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | New-ItemProperty -Name "DisableAntiSpyware" -PropertyType "DWord" -Value "0" -Force

    Add-Progress "Enabled Windows Defender."
    Write-Output "Enabled Windows Defender."
}

# Secure screensaver with password gamer
function Protect-Screensaver {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType "DWord" -Value "1" -Force
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType "DWord" -Value "1" -Force

    Add-Progress "Screensaver secured with password"
    Write-Output "Secured screensaver with a password."
}

# Hosts file
function Clear-Hosts {
    Reset-CHostsFile

    Copy-Item "$compfiles\hosts" "$env:SystemRoot\System32\drivers\etc\hosts" -Force

    Add-Progress "Hosts file cleared, ez."
    Write-Output "Hosts file cleared, ez."
}

# Firefox config
function Set-FirefoxConfig {
    # 64-bit
    if ((Test-Path "$env:programfiles\Mozilla Firefox") -eq $True) {
        Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles\Mozilla Firefox\browser\override.ini" -Force
        Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles\Mozilla Firefox\mozilla.cfg" -Force
        Copy-Item "$compfiles\firefox_config\autoconfig.js" "$env:programfiles\Mozilla Firefox\defaults\pref\autoconfig.js" -Force
    } else {
        # 32 bit
        Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles(x86)\Mozilla Firefox\browser\override.ini" -Force
        Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles(x86)\Mozilla Firefox\mozilla.cfg" -Force
        Copy-Item "$compfiles\firefox_config\autoconfig.js" "$env:programfiles(x86)\Mozilla Firefox\defaults\pref\autoconfig.js" -Force
    }

    Add-Progress "Firefox config files copied"
    Write-Output "Firefox swole settings copied."
}

# Enable internet explorer
function Enable-InternetExplorer {
    # Enable IE
    if ((Test-OSIs32Bit) -eq $true) {Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all -ErrorAction SilentlyContinue}
    if ((Test-OSIs64Bit) -eq $true) {Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all -ErrorAction SilentlyContinue}

    Add-Progress "Enabled Internet Explorer"
    Write-Output "Enabled the gamer internet explorer."
}

# Delete applocker rules
function Remove-AppLocker {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

    Add-Progress "AppLocker policies cleared"
    Write-Output "AppLocker policies cleared."
}

# enable uac because that would be a good idea though its already enabled by default but whatever frick off
function Enable-UAC {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableLUA" -PropertyType "DWord" -Value "1" -Force

    Add-Progress "UAC Enabled"
    Write-Output "Enabled UAC"
}

# Enable SmartScreen
function Enable-SmartScreen {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "EnableSmartScreen" -PropertyType "DWord" -Value "2" -Force

    Add-Progress "Enabled SmartScreen."
    Write-Output "Enabled SmartScreen."
}

# Check forensics questions
function Open-Forensics {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_
    }

    Pause

    Add-Progress "Forensics Questions checked out"
    Write-Output "Opened the forensics questions, brah."
}

# Auto (but separate script) Functions

# Disable features
function Disable-Features {
    Invoke-Expression "cmd /c start powershell {$compfiles\disable_features.ps1}"

    Add-Progress "Disabled lame features"
    Write-Output "Lame features disabled, or one could say, clapped"
}

# Install gucci programs
function Install-Programs {
    Invoke-Expression "cmd /c start powershell {$compfiles\install_programs.ps1}"

    Add-Progress "Good security programs installed"
    Write-Output "Gucci security programs installed."
}

# Delete prohibited files
function Remove-ProhibitedFiles {
	Invoke-Expression "cmd /c start powershell {$compfiles\remove_prohibitedfiles.ps1}"

    Add-Progress "Media files deleted"
    Write-Output "Bad media files deleted."
}

# Disable services
function Disable-Services {
    Invoke-Expression "cmd /c start powershell {$compfiles\disable_services.ps1}"

    Add-Progress "Lame services disabled and good ones enabled."
    Write-Output "Bad services disabled and good ones enabled."
}

# Windows Update
function Update-Windows {
    Invoke-Expression "cmd /c start powershell {$compfiles\update_windows.ps1}"

    Write-Output "Automatic Windows Update has been configured and the service was started."
    Add-Progress "Windows Update configured and started"
}

# CISCAT Registry batch file
function Start-CiscatRegistry {
    Invoke-Expression "cmd /c start powershell {$compfiles\start_ciscatregistry.ps1}"

    Add-Progress "CISCAT Registry script run"
    Write-Output "CISCAT Registry script run"
}

# IE registry gamers
function Import-IERegistry {
    Invoke-Expression "cmd /c start powershell {$compfiles\import_ieregistry.ps1}"

    Add-Progress "Set CISCAT Internet Explorer registry settings"
    Write-Output "Imported IE Registry settings"
}

# Manual Functions

# Delete shares
function Remove-Shares {
    while ($true) {
        Clear-Host

        net share
        Write-Output "`n"

        $answer = Read-Host "Choose a sketchy share to delete"

        if ($answer -eq "n") {
            Add-Progress "Sketchy shares deleted"
            break
        }

        net share $answer /delete
    }
}

# Remove programs
function Remove-Programs {
    Start-Process "$env:ProgramFiles\IObit\IObit Uninstaller\IObitUninstaler.exe"
    Write-Output "REMOVE PROGRAMS!!1!"

    Add-Progress "Sketchy programs removed"
}

# Remove stinky malware
function Remove-Malware {
    Start-Process "$env:programfiles\Malwarebytes\Anti-Malware\mbam.exe"
    Start-Process "$env:programfiles\Microsoft Baseline Security Analyzer 2\mbsa.exe"
    Write-Output "REMOVE MALWARE!!1!"

    Add-Progress "Malware absolutely yeeted on"
}

# Delete user folders of bad users
function Remove-BadUserFolders {
    $global:badusers = Get-BadUsers

    $badusers.foreach{
        Remove-Item C:\Users\$_ -Recurse -Force
    }

    Add-Progress "Bad user folders deleted"
    Write-Output "Bad user folders deleted."
}

# Update programs
function Update-Programs {
    Clear-Host
    Write-Output "Update all the dang programs, son."
    Write-Output "`n"
    Write-Output "Java JRE 8, Firefox, others."
    Write-Output "`n"
    Write-Output "IMPORTANT: Check if the programs have auto updates"
    Start-Process "$env:programdata\chocolatey\bin\PatchMyPC.exe"

    Add-Progress "Hopefully got those gamer program updates"
}

# Unlock the users that may be locked yo
function Unlock-Users {
	lusrmgr.msc

	Clear-Host
	Write-Output "Gotta check locked users manually, sorry son."
	Write-Output "Powershell didn't come through for us this time."
	Write-Output "`n"
	Pause
	
	Add-Progress "Unlocked locked users"
	Write-Output "Unlocked locked users"
}

# Find prohibited files
function Find-ProhibitedFiles {
    Invoke-Expression "cmd /c start powershell {$compfiles\find_prohibitedfiles.ps1}"

    Add-Progress "Prohibited files may have been found"
    Write-Output "Prohibited files may have been found"
}

# Run Sysinternals
function Start-Sysinternals {
    $sysinternals = "autoruns","procexp","tcpview"

    $sysinternals.foreach{
        Start-Process "$cmderbin\$_"
    }

    Add-Progress "Ran sysinternals stuff"
}

# Setup backup
function Enable-Backup {
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
}

# Firewall exceptions check
function View-FirewallExceptions {
    Clear-Host
    Write-Output "Check firewall exceptions, bud"
    Firewall.cpl

    Add-Progress "Firewall exceptions checked."
}

# Utility Functions

# Cat-Lite scanner
function Start-CatLite {
    if ($os -eq "Win10") {
        Start-Process "$cmderbin\cis-cat-lite\CISCAT.jar"
    } else {
        Clear-Host
        Write-Output "Sorry mate, you can't use the Cat-Lite scanner. Cause it aint Windows 10."
    }
}

# Add Admins
function Add-Admins {
    while ($true) {
        Clear-Host

        Get-Admins
        Get-Users
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break
        }

        Add-CGroupMember Administrators $answer
    }

    Add-Progress "Admin(s) have been added"
}

# Add users
function Add-Users {
    Open-Readme

    while ($true) {
        Clear-Host

        Get-Users
        Write-Output "`n"
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break
        }

        New-LocalUser $answer -Password $pass
    }

    Add-Progress "User(s) have been added"
}

# Add groups function cause why not
function Add-Groups {
    while ($true) {
        Clear-Host

        Get-LocalGroup
        Write-Output "`n"
        $answer = Read-Host "Enter a group name to add"

        if ($answer -eq "n") {
            break
        }

        New-LocalGroup -Name $answer
    }

    Add-Progress "Group(s) have been added"
}

# Copy script to profile
function Copy-ToProfile {
    Copy-Item "$env:userprofile\Desktop\Script\script.ps1" "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    Write-Output "Script copied to pshell profile."
}

# List admins
function Get-Admins {
    if ($args -eq "nobuiltin") {
        $users_nobuiltin.foreach{
            if ((test-groupmember Administrators $_) -eq $true) {
                Write-Output "$_"
            }
        }
    } else {
        $users.foreach{
            if ((test-groupmember Administrators $_) -eq $true) {
                Write-Output "$_"
            }
        }
    }
}

# List users
function Get-Users {
    if ($args -eq "nobuiltin") {
        $users_nobuiltin | Select-Object Name
    } else {
        $users | Select-Object Name
    }
}

# List functions
function Get-Functions {
    $functions = Import-Lists functions

    $functions | Where-Object Type -ne "ScriptOnly" | Format-Table
}

# Run script easily function
function Start-Script {
    Copy-ToProfile
    . $profile "$args"
}

# Open Scoring report
function Open-ScoringReport {
    Start-Process "C:\CyberPatriot\ScoringReport.html"
}

# Open stop scoring thing (to check scoring timer)
function Open-StopScoring {
    Start-Process "C:\CyberPatriot\Stop.exe"
}

# Enable remote desktop
function Enable-RemoteDesktop {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType "DWord" -Value "0" -Force

    Add-Progress "Remote desktop enabled."
    Write-Output "Remote desktop enabled."
}

# Replace ease of access menu with powershell because reasons
function Replace-EaseOfAccess {
    # Take ownership
    takeown /f "C:\Windows\System32\utilman.exe"
    icacls "C:\Windows\System32\utilman.exe" /grant ${env:username}:`(F`)
    takeown /f "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    icacls "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /grant ${env:username}:`(F`)

    # Replace files
    Move-Item "C:\Windows\System32\utilman.exe" "C:\Windows\System32\utilman1.exe" -Force -ErrorAction SilentlyContinue
    Copy-Item "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "C:\Windows\System32\utilman.exe" -Force -ErrorAction SilentlyContinue

    Add-Progress "Replaced ease of access menu with powershell. (in case of lockout)"
    Write-Output "Replaced ease of access menu with powershell. (in case of lockout)"
}

# Install chocolatey function ez
function Install-Chocolatey {
	if ((Test-Path $env:programdata\chocolatey) -eq $False) {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

        choco feature enable -n allowGlobalConfirmation
        choco feature enable -n useFipsCompliantChecksums

		Write-Output "Chocolatey installed."
		Add-Progress "Chocolatey installed."
    }
}

# Allow cmder, stop scoring, etc. to work lol
function Fix-Programs {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ValidateAdminCodeSignatures" -PropertyType "DWord" -Value "0" -Force
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableUIADesktopToggle" -PropertyType "DWord" -Value "0" -Force

    Write-Output "Cmder, stop scoring, etc. fixed."
}

# Run initial setup manually
function Start-InitialSetup {
    # Install Carbon and PSWindowsUpdate modules

    # Disable Use FIPS compliant checksums (Allow install of modules)
    <#
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy" -Force | New-ItemProperty -Name "Enabled" -PropertyType "DWord" -Value "0" -Force
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Force | New-ItemProperty -Name "FIPSAlgorithmPolicy" -PropertyType "DWord" -Value "0" -Force
    #>

    #Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"
    Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.201" -Force
    Install-Module -Name "Carbon" -AllowClobber -Force
    Install-Module -Name "PSWindowsUpdate" -AllowClobber -Force

    # Re-enable Use FIPS compliant algorithms
    <#
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy" -Force | New-ItemProperty -Name "Enabled" -PropertyType "DWord" -Value "1" -Force
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Force | New-ItemProperty -Name "FIPSAlgorithmPolicy" -PropertyType "DWord" -Value "1" -Force
    #>
}

# Script-Use Only Functions

# Get OS name
function Get-OS {
    $os_name = (Get-CimInstance CIM_OperatingSystem).Name
    $os_list = "Windows 10","Server 2016"

    $os_list.foreach{
        if ($os_name -match $_) {
            $os_name = $_

            # Change name to shorter, gooder version
            if ($os_name -in "Windows 10") {return $os_name.Remove(3,5)}
            if ($os_name -in "Server 2016") {return $os_name.Remove(6,1)}
        }
    }
}

# Import lists
function Import-Lists {
    return Import-Csv "$compfiles\lists\$args.csv"
}

# Get bad users list
function Get-BadUsers {
    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt"
    $goodusers = ($gooduserlist).Split(";",2)

    # Add readme users to file if needed
    if ($null -eq $gooduserlist) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"

        Pause
    }

    # Compare and get bad users
    (Compare-Object $goodusers $users_nobuiltin).foreach{
        return $_.InputObject
    }
}

# Get bad admin list
function Get-BadAdmins {
    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt"
    $goodadmins = ($gooduserlist | Select-String ";" | Out-String -Stream).Split(";",2)

    # Add readme users to file if needed
    if ($null -eq $gooduserlist) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"

        Pause
    }

    # Compare and get bad admins
    (Compare-Object $goodadmins $admins_nobuiltin).foreach{
        return $_.InputObject
    }
}

# Set logon message to username and password
function Set-LogonMessage {
    # Change password
    Set-LocalUser $env:username -Password $pass

    # Set logon message
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "legalnoticecaption" -PropertyType "String" -Value "Username: $env:username" -Force
    New-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Force | New-ItemProperty -Name "legalnoticetext" -PropertyType "String" -Value "Password: abc123ABC123@@" -Force

    Write-Output "Set logon message to useful thing."
}

# Add to progress log
function Add-Progress {
    Write-Output "$args`n" >> "$desktop\progress.txt"
}

# Import aliases
function Import-Alias {
    $functions = Import-Lists functions

    $functions.foreach{
        Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force
    }
}

# Initial Setup
if ($null -eq (Get-InstalledModule -Name "Carbon")) {Start-InitialSetup}
if ($null -eq (Get-InstalledModule -Name "PSWindowsUpdate")) {Start-InitialSetup}
Set-PSDebug -Trace 0
Set-LogonMessage
Import-Alias
Replace-EaseOfAccess
Copy-ToProfile

# Variables lol
$global:desktop = "$env:userprofile\Desktop"
$global:compfiles = "$desktop\Script"
$global:sct = "$compfiles\sctbaselines"
$global:cmderbin = "$compfiles\cmder\bin"
$global:pass = "abc123ABC123@@" | ConvertTo-SecureString -AsPlainText -Force
[System.Environment]::SetEnvironmentVariable("Path","%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%sct%;%desktop%;%cmderbin%",[System.EnvironmentVariableTarget]::Machine)
$global:os = Get-OS
$global:users = Get-CUser
$global:users_nobuiltin = $users | Where-Object Description -eq $null | Where-Object Name -ne "defaultuser0"
$global:admins = $users.foreach{
    if ((Test-CGroupMember "Administrators" $_) -eq $true) {return $_}
}
$global:admins_nobuiltin = $users_nobuiltin.foreach{
    if ((Test-CGroupMember "Administrators" $_) -eq $true) {return $_}
}
$global:badusers = Get-BadUsers
$global:badadmins = Get-BadAdmins

# Create aliases
$functions = Import-Lists functions
$functions.foreach{Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force}

# Determine type of execute, then execute
if ($args -eq "a") {
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
}

$banner = Get-Random -Maximum "4"

Clear-Host

# Show a random banner lmao
if ($banner -eq "0") {
    Write-Output "__     __                 "
    Write-Output "\ \   / /                 "
    Write-Output " \ \_/ /___ _ __   ____   "
    Write-Output "  \   / _  | '_ \ / _  |  "
    Write-Output "   | | (_| | | | | (_| |  "
    Write-Output "  _|_|\__,_|_| |_|\__, |  "
    Write-Output " / ____|           __/ |  "
    Write-Output "| |  __  ____ _ __|___/__ "
    Write-Output "| | |_ |/ _  | '_ \ / _  |"
    Write-Output "| |__| | (_| | | | | (_| |"
    Write-Output " \_____|\__,_|_| |_|\__, |"
    Write-Output "                     __/ |"
    Write-Output "                    |___/ "
}

if ($banner -eq "1") {
    Write-Output "  _____ _           _     _    _       "
    Write-Output " / ____| |         | |   | |  | |      "
    Write-Output "| (___ | |__  _   _| |_  | |  | |_ __  "
    Write-Output " \___ \| '_ \| | | | __| | |  | | '_ \ "
    Write-Output " ____) | | | | |_| | |_  | |__| | |_) |"
    Write-Output "|_____/|_| |_|\__,_|\__|  \____/| .__/ "
    Write-Output "|  _ \                          | |    "
    Write-Output "| |_) | ___   ___  _ ______   __|_| __ "
    Write-Output "|  _ < / _ \ / _ \| '_   _ \ / _ \ '__|"
    Write-Output "| |_) | (_) | (_) | | | | | |  __/ |   "
    Write-Output "|____/ \___/ \___/|_| |_| |_|\___|_|   "
}

if ($banner -eq "2") {
    Write-Output " _    _ _        ____  _       "
    Write-Output "| |  | | |      / __ \| |      "
    Write-Output "| |  | | |__   | |  | | |__    "
    Write-Output "| |  | | '_ \  | |  | | '_ \   "
    Write-Output "| |__| | | | | | |__| | | | |  "
    Write-Output " \____/|_| |_|  \____/|_| |_|  "
    Write-Output " / ____| | (_)     | |         "
    Write-Output "| (___ | |_ _ _ __ | | ___   _ "
    Write-Output " \___ \| __| | '_ \| |/ / | | |"
    Write-Output " ____) | |_| | | | |   <| |_| |"
    Write-Output "|_____/ \__|_|_| |_|_|\_\\__, |"
    Write-Output "                          __/ |"
    Write-Output "                         |___/ "
}

if ($banner -eq "3") {
    Write-Output "  _____                _____ _ _                "
    Write-Output " / ____|              / ____(_) |               "
    Write-Output "| (___   ____ _   _  | (___  _| | _____         "
    Write-Output " \___ \ / _  | | | |  \___ \| | |/ / _ \        "
    Write-Output " ____) | (_| | |_| |  ____) | |   <  __/        "
    Write-Output "|_____/ \__,_|\__, | |_____/|_|_|\_\___|        "
    Write-Output "               __/ |                            "
    Write-Output " _____  _     |___/   _     _   _               "
    Write-Output "|  __ \(_)     | |   | |   | \ | |              "
    Write-Output "| |__) |_  ____| |__ | |_  |  \| | _____      __"
    Write-Output "|  _  /| |/ _  | '_ \| __| | .   |/ _ \ \ /\ / /"
    Write-Output "| | \ \| | (_| | | | | |_  | |\  | (_) \ V  V / "
    Write-Output "|_|  \_\_|\__, |_| |_|\__| |_| \_|\___/ \_/\_/  "
    Write-Output "           __/ |                                "
    Write-Output "          |___/                                 "
}

Write-Output "`n"
Write-Output "Welcome to Jackson's chad powershell script."
Write-Output "Remember, don't be an idiot."
Write-Output "`n"
Write-Output "To list all available functions:"
Write-Output "Type 'Get-Functions' (or gf)"
Write-Output "`n"
Write-Output "To run the script in auto mode:"
Write-Output "Type 'Start-Script a' (or ss a)"