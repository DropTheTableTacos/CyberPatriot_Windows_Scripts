# Jackson's Epic Powershell Script That Has A 100% Guaranteed Chance Of Not Breaking During The Competition

# Functions

# Get windows version
function Get-SOVer {
    $ver = (Get-WmiObject Win32_OperatingSystem).Version

    if ($ver -eq "10.0.10240") {return "1507"}
    if ($ver -eq "10.0.10586") {return "1511"}
    if ($ver -eq "10.0.14393") {return "1607"}
    if ($ver -eq "10.0.15063") {return "1703"}
    if ($ver -eq "10.0.16299") {return "1709"}
    if ($ver -eq "10.0.17134") {return "1803"}
    if ($ver -eq "10.0.17763") {return "1809"}
    if ($ver -eq "10.0.18362") {return "1903"}
}

# Get OS name
function Get-SOOS {
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
function Import-SOLists {
    return Import-Csv "$compfiles\lists\$args.csv"
}

# README
function Open-Readme {
    Start-Process -FilePath "C:\CyberPatriot\README.url"

    Write-Output -InputObject "README opened."
}

# Get bad users list
function Get-SOBadUsers {
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
function Get-SOBadAdmins {
    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt"
    $goodadmins = ($gooduserlist | Select-String ";").Split(";",2)

    # Add readme users to file if needed
    if ($null -eq $gooduserlist) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"

        Pause
    }

    # Compare and get bad users
    (Compare-Object $goodadmins $admins_nobuiltin).foreach{
        return $_.InputObject
    }
}

# Set logon message to username and password
function Set-SOLogonMessage {
    # Change password
    Set-LocalUser $env:username -Password $pass

    # Set logon message
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticecaption `
    -PropertyType String -Value "Username: $env:username" -Force -InformationAction SilentlyContinue
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticetext `
    -PropertyType String -Value "Password: abc123ABC123@@" -Force -InformationAction SilentlyContinue
}

# Add to progress log
function Add-SOProgress {
    Write-Output "$args`n" >> "$desktop\progress.txt"
}

# Import aliases
function Import-SOAlias {
    $functions = Import-SOLists functions

    $functions.foreach{
        Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force
    }
}

# Setup autologon again for our user for convenience
function Set-SOAutoLogon {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultUserName `
    -PropertyType String -Value "$env:username" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultPassword `
    -PropertyType String -Value "abc123ABC123@@" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon `
    -PropertyType String -Value "1" -Force
}

# SCT Baselines
function Import-SCT {
    Set-Location "$cmderbin"

    # Import Microsoft recommended baselines like an absolute chad
    .\LGPO.exe /g "$sct\${os}_$ver\MS"

    # Import chad custom baselines too
    .\LGPO.exe /g "$sct\${os}_$ver\Chad_$ver\Good"

    if ($args -eq "bad") {
        .\LGPO.exe /g "$sct\${os}_$ver\Chad_$ver\Bad"
    }

    # Allow cmder and stop scoring, etc. to actually run lol
    if ((Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
    -Name ValidateAdminCodeSignatures) -eq "1") {
        New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System `
        -Name ValidateAdminCodeSignatures -PropertyType DWord -Value "0" -Force
    }
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableUIADesktopToggle `
    -PropertyType DWord -Value "0" -Force

    # Set logon message
    Set-SOLogonMessage

    Add-SOProgress "SCT Baselines imported"
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

        Add-SOProgress "User(s) have been deleted"
    } else {
        $global:badusers = Get-SOBadUsers

        $badusers.foreach{
            Remove-LocalUser $_
            Write-Output "$_ was yeeted off the face of the earth."
        }

        Add-SOProgress "Unauthorized user(s) have been deleted"
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

        Add-SOProgress "Admin(s) have been deleted"
    } else {
        $global:badadmins = Get-SOBadAdmins

        $badadmins.foreach{
            Remove-LocalGroupMember "Administrators" $_
            Write-Output "$_ was removed from Administrators group."
        }

        Add-SOProgress "Admin(s) have been deleted"
    }
}

# Disable services
function Disable-Services {
    # Service exclusions
    while ($true) {
        Clear-Host

        $answer = Read-Host "Enter a service to exclude (use 'remote' for Remote Desktop)"

        if ($answer -eq "n") {
            break
        }

        if ($answer -eq "remote") {
            $serv_exclusions += "termservice","sessionenv"
        } else {
            $serv_exclusions += $answer
        }
    }

    # Disable list of services
    $services = Import-SOLists services

    ($services | Where-Object State -match "Uninstall").foreach{
        Stop-Service $_.Name
        Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
        Uninstall-Service -Name $_.Name
    }

    ($services | Where-Object State -match "Automatic").foreach{
        Set-Service $_.Name -startuptype Automatic -ErrorAction SilentlyContinue
        Start-Service $_.Name
    }

    ($services | Where-Object State -match "Manual").foreach{
        Set-Service $_.Name -startuptype Automatic -ErrorAction SilentlyContinue
        Start-Service $_.Name
    }

    ($services | Where-Object State -match "Disabled").foreach{
        Stop-Service $_.Name
        Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
    }

    # Enable exlusions
    $serv_exclusions.foreach{
        Set-Service $_.Name -startuptype Automatic
        Start-Service $_.Name
    }

    Add-SOProgress "Lame services disabled"
    Write-Output "Bad services disabled and good ones enabled."
}

# Check forensics questions
function Open-Forensics {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_
    }

    Add-SOProgress "Forensics Questions checked out"
    Write-Output "Opened the forensics questions, brah."
}

# Delete prohibited files
function Remove-ProhibitedFiles {
	Write-Output "Did you check the forensics questions mate? Be careful"
    Pause

    $ext = Import-SOLists extensions | Where-Object Action -eq "Delete"

    $ext.foreach{
        # Get the files
        $files = Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Force | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

        # Takeown and yeet them off the VM
        $files.foreach{
            takeown /f $_.FullName
            icacls $_.FullName /grant ${env:USERNAME}:(F)
        }
        $files.FullName | Remove-Item -Force
    }

    Add-SOProgress "Media files deleted"
    Write-Output "Bad media files deleted."
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

        Add-SOProgress "All passwords changed to a gamer secure password"
        Write-Output "All passwords changed to: abc123ABC123@@"
    }
}

# Enable Firewall and template
function Enable-Firewall {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    # Put command to import firewall template here

    Add-SOProgress "Firewall enabled and template applied"
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

    Add-SOProgress "Set user passwords to expire"
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

        Add-SOProgress "Built-in Admin and Guest disabled"

        Write-Output "Built-in Admin and Guest disabled."
    }
}

# Windows Update
function Update-Windows {
	# Get microsoft update server and start update, auto too fam
	Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d
	Set-WUSettings -AutoInstallMinorUpdates -IncludeRecommendedUpdates
	Get-WUInstall –MicrosoftUpdate –AcceptAll

    # Set windows update service to auto and start
    Set-Service wuauserv -startuptype Automatic
    Start-Service wuauserv

    # Enable automatic updates
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" `
    -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" `
    -Name AUOptions -PropertyType DWord -Value "4" -Force
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate `
    -PropertyType DWord -Value "0" -Force
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name AUOptions `
    -PropertyType DWord -Value "4" -Force

    # Completed message
    Write-Output "`n"
    Write-Output "Automatic Windows Update has been configured and the service was started."

    Add-SOProgress "Windows Update configured and started"
}

# Install gucci programs
function Install-Programs {
    if ((Test-Path $env:programdata\chocolatey) -eq $False) {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

        choco feature enable -n allowGlobalConfirmation
        choco feature enable -n useFipsCompliantChecksums
    }

    choco install firefox ie11 malwarebytes mbsa patch-my-pc iobit-uninstaller --ignorechecksum --force

    Add-SOProgress "Good security programs installed"
    Write-Output "Gucci security programs installed."
}

# Disable features
function Disable-Features {
    . "$compfiles\disable_features.ps1"

    Add-SOProgress "Disabled lame features"
    Write-Output "Lame features disabled, or one could say, clapped"
}

# Delete shares
function Remove-Shares {
    while ($true) {
        Clear-Host

        Get-FileShare
        Write-Output "`n"

        $answer = Read-Host "Choose a sketchy share to delete"

        if ($answer -eq "n") {
            Add-SOProgress "Sketchy shares deleted"
            break
        }

        explorer "\\$env:computername\$answer"
        Uninstall-FileShare $answer
    }
}

# Remove programs
function Remove-Programs {
    # WIP
    appwiz.cpl
    explorer.exe
    Add-SOProgress "Sketchy programs removed"
}

# Remove stinky malware
function Remove-Malware {
    # WIP
    Add-SOProgress "Malware absolutely yeeted on"
}

# Disable remote desktop
function Disable-RemoteDesktop {
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" `
    -PropertyType DWord -Value "1" -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fAllowToGetHelp" `
    -PropertyType DWord -Value "0" -Force

    Add-SOProgress "Remote Desktop disabled"
    Write-Output "Disable remote desktop."
}

# Secure screensaver with password gamer
function Protect-Screensaver {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Control Panel" -Force
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel" -Name "Desktop" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" `
    -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows" -Name "Control Panel"
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel" -Name "Desktop" -Force
    New-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" `
    -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    Add-SOProgress "Screensaver secured with password"
    Write-Output "Secured screensaver with a password."
}

# Hosts file
function Clear-Hosts {
    Reset-CHostsFile

    Add-SOProgress "Hosts file cleared"
    Write-Output "Hosts file cleared, ez"
}

# Firefox config
function Set-FirefoxConfig {
    # 64-bit
    if ((Test-Path "$env:programfiles\Mozilla Firefox") -eq $True) {
        Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles\Mozilla Firefox\browser\override.ini" `
        -Force
        Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles\Mozilla Firefox\mozilla.cfg" -Force
        Copy-Item "$compfiles\firefox_config\local-settings.js" `
        "$env:programfiles\Mozilla Firefox\defaults\pref\local-settings.js" -Force
    } else {
        # 32 bit
        Copy-Item "$compfiles\firefox_config\override.ini" `
        "$env:programfiles(x86)\Mozilla Firefox\browser\override.ini" -Force
        Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles(x86)\Mozilla Firefox\mozilla.cfg" -Force
        Copy-Item "$compfiles\firefox_config\local-settings.js" `
        "$env:programfiles(x86)\Mozilla Firefox\defaults\pref\local-settings.js" -Force
    }

    Add-SOProgress "Firefox config files copied"
    Write-Output "Firefox swole settings copied."
}

# Prohibited users' files
function Find-ProhibitedUserFiles {
    $global:badusers = Get-SOBadUsers

    $badusers.foreach{
        $f = Get-ChildItem C:\* -Recurse | Get-Acl

        if ($f.Owner -eq "$_") {
            Write-Output $f.Path
        }
    }

    Add-SOProgress "Prohibited user files theoretically found maybe idk"
    Write-Output "Prohibited user files theoretically found maybe idk."
}

# Delete user folders of bad users
function Remove-BadUserFolders {
    $global:badusers = Get-SOBadUsers

    $badusers.foreach{
        Remove-Item C:\Users\$_ -Recurse -Force
    }

    Add-SOProgress "Bad user folders deleted"
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
    Pause
    Add-SOProgress "Hopefully got those gamer program updates"
}

# Run Nessus scans
function Start-Nessus {
    $ip
    Write-Output "Run Nessus scans, ya brainlet"
    Pause

    Add-SOProgress "Nessus scan theoretically run?"
}

# Find prohibited files
function Find-ProhibitedFiles {
    # Remove existing output file if it exists
    Remove-Item "C:\stinkyfiles.txt" -Force -ErrorAction SilentlyContinue

    $ext = Import-SOLists extensions | Where-Object Action -eq "Find"
    $pattern = Import-SOLists sensinfo_patterns

    # Find the files
    $ext.foreach{
        # Get the files
        $files = Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Force | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

        # Output stinky ones to file and takeown
        $files.foreach{
            takeown /f $_.FullName
            icacls $_.FullName /grant ${env:USERNAME}:(F)
        }
        $files.FullName >> C:\stinkyfiles.txt

        # Find patterns in files
		$pattern.foreach{
			if ((Get-Content $files.FullName | Select-String -Pattern "$_.Pattern") -eq $true) {
                $_.FullName >> C:\stinkyfiles.txt
            }
		}
    }

    Start-Process C:\stinkyfiles.txt

    Add-SOProgress "Prohibited files may have been found"
    Write-Output "Prohibited files may have been found"
}

# Run Sysinternals
function Start-Sysinternals {
    $sysinternals = "autoruns","procexp","tcpview"

    $sysinternals.foreach{
        Start-Process "$cmderbin\$_"
    }

    Add-SOProgress "Ran sysinternals stuff"
}

# CISCAT Registry batch file
function Start-CiscatRegistry {
    . "$compfiles\ciscat_registry.ps1"

    Add-SOProgress "CISCAT Registry batch file run"
    Write-Output "CISCAT Registry batch file run"
}

# IE registry gamers
function Import-IERegistry {
    $ie_reg = Get-Content "$compfiles\lists\ie_registry.txt" | Select-String -NotMatch "#"

    $ie_reg.foreach{
        Invoke-Expression -Command "$_"
    }

    Add-SOProgress "Set CISCAT Internet Explorer registry settings"
    Write-Output "Imported IE Registry settings"
}

# Enable internet explorer
function Enable-InternetExplorer {
    # Enable IE
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all `
    -ErrorAction SilentlyContinue
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all `
    -ErrorAction SilentlyContinue

    Add-SOProgress "Enabled Internet Explorer"
    Write-Output "Enabled the gamer internet explorer."
}

# Delete applocker rules
function Remove-AppLocker {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

    Add-SOProgress "AppLocker policies cleared"
    Write-Output "Applocker policies cleared."
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

        Add-SOProgress "All users (except built-in Admin and Guest) enabled"

        Write-Output "All users (except built-in Admin and Guest) enabled."
    }
}

# enable uac because that would be a good idea though its already enabled by default but whatever frick off
function Enable-UAC {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" `
    -PropertyType DWord -Value "1" -Force

    Add-SOProgress "UAC Enabled"
    Write-Output "Enabled UAC"
}

# Cat-Lite scanner
function Start-CatLite {
    if ($os -eq "Win10") {
        Start-Process "$cmderbin\cis-cat-lite\CISCAT.jar"
    } else {
        Clear-Host
        Write-Output "Sorry mate, you can't use the Cat-Lite scanner. Cause it aint Windows 10."
    }
}

# Setup backup
function Enable-Backup {
    # WIP
    Install-WindowsFeature Windows-Server-Backup

    Read-Host "Plug in a flashdrive mate"

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

    Add-SOProgress "Admin(s) have been added"
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

    Add-SOProgress "User(s) have been added"
}

# Copy script to profile
function Copy-ToProfile {
    Copy-Item "$env:userprofile\Desktop\Script\script.ps1" "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    Write-Output "Script copied to pshell profile."
}

# List admins
function Get-Admins {
    $global:users = Get-CUser
    $global:users_nobuiltin = $users | Where-Object Description -eq $null | Where-Object Name -ne "defaultuser0"

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
    $global:users = Get-CUser
    $global:users_nobuiltin = $users | Where-Object Description -eq $null | Where-Object Name -ne "defaultuser0"

    if ($args -eq "nobuiltin") {
        $users_nobuiltin | Select-Object name | format-wide
    } else {
        $users | Select-Object name | format-wide
    }
}

# List functions
function Get-Functions {
    $functions = Import-SOLists functions

    $functions | Where-Object Type -ne "ScriptOnly" | Select-Object Name, Alias, Type | Format-Table
}

# Run script easily function
function Start-Script {
    Copy-ToProfile
    . $profile "$args"
}

# Open Scoring report
function Open-ScoringReport {
    C:\CyberPatriot\ScoringReport.html
}

# Open stop scoring thing (to check scoring timer)
function Open-StopScoring {
    C:\CyberPatriot\Stop.exe
}

# Enable remote desktop
function Enable-RemoteDesktop {
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" `
    -PropertyType DWord -Value "0" -Force

    Add-SOProgress "Remote Desktop enabled"
    Write-Output "Enable remote desktop."
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

    Add-SOProgress "Group(s) have been added"
}

# Replace ease of access menu with powershell because reasons
function Replace-EaseOfAccess {
    $list = "utilman.exe","powershell.exe"

    $list.foreach{
        takeown /f "C:\Windows\System32\$_"
        icacls "C:\Windows\System32\$_" /grant ${env:username}:(F)
    }

    Move-Item "C:\Windows\System32\utilman.exe" "C:\Windows\System32\utilman1.exe" -Force
    Copy-Item "C:\Windows\System32\powershell.exe" "C:\Windows\System32\utilman.exe" -Force

    Add-SOProgress "Replaced ease of access menu with powershell. (in case of lockout)"
    Write-Output "Replaced ease of access menu with powershell. (in case of lockout)"
}

# Install chocolatey function ez
function Install-Chocolatey {
	if ((Test-Path $env:programdata\chocolatey) -eq $False) {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

        choco feature enable -n allowGlobalConfirmation
        choco feature enable -n useFipsCompliantChecksums

		Write-Output "Chocolatey installed."
		Add-SOProgress "Chocolatey installed."
    }
}

# Allow cmder, stop scoring, etc. to work lol
function Fix-Programs {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ValidateAdminCodeSignatures" -PropertyType "DWord" -Value "0" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableUIADesktopToggle" -PropertyType "DWord" -Value "0" -Force

    Write-Output "Cmder, stop scoring, etc. fixed."
}

# Initial Setup

if ($env:firstrun -ne "false") {
    # Install Carbon and PSWindowsUpdate modules

    # Disable Use FIPS compliant checksums (Allow install of modules)
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy" -Name "Enabled" -PropertyType "DWord" -Value "0" -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "FIPSAlgorithmPolicy" -PropertyType "DWord" -Value "0" -Force

    Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"
    Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.201" -Force
    Install-Module -Name "Carbon" -AllowClobber -Force
    Install-Module -Name "PSWindowsUpdate" -AllowClobber -Force

    # Re-enable Use FIPS compliant algorithms
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy" -Name "Enabled" -PropertyType "DWord" -Value "1" -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "FIPSAlgorithmPolicy" -PropertyType "DWord" -Value "1" -Force
}

# Variables lol
$global:desktop = "$env:userprofile\Desktop"
$global:compfiles = "$desktop\Script"
$global:sct = "$compfiles\sctbaselines"
$global:cmderbin = "$compfiles\cmder\bin"
$global:pass = "abc123ABC123@@" | ConvertTo-SecureString -AsPlainText -Force
[System.Environment]::SetEnvironmentVariable("Path","%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%sct%;%desktop%;%cmderbin%",[System.EnvironmentVariableTarget]::Machine)
$global:ver = Get-SOVer
$global:os = Get-SOOS
$global:users = Get-CUser
$global:users_nobuiltin = $users | Where-Object Description -eq $null | Where-Object Name -ne "defaultuser0"
$global:admins = $users.foreach{
    if ((Test-CGroupMember "Administrators" $_) -eq $true) {return $_}
}
$global:admins_nobuiltin = $users_nobuiltin.foreach{
    if ((Test-CGroupMember "Administrators" $_) -eq $true) {return $_}
}
$global:badusers = Get-SOBadUsers
$global:badadmins = Get-SOBadAdmins
$global:ip = (Get-CIPAddress | Where-Object IPAddressToString -match "192\.168\.\d*\.\d*").IPAddressToString

# Run setup commands
Set-PSDebug -Trace 0
Set-SOLogonMessage
Import-SOAlias
Set-SOAutoLogon
Replace-EaseOfAccess
Copy-ToProfile
Remove-SOGitFolder

# Execute script
$functions = Import-SOLists functions

# Create aliases
$functions.foreach{
    Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force
}

# Determine type of execute, then execute
if ($args -eq "a") {
    ($functions | Where-Object Type -match "Auto").foreach{
        Invoke-Expression -Command "$_.Name"
    }

    ($functions | Where-Object Type -match "Manual").foreach{
        Invoke-Expression -Command "$_.Name"
        Pause
    }
}

if ($args -eq "m") {
    Clear-Host
    Get-Functions
}

if ($env:firstrun -ne "false") {
    Write-Output "__   __"
    Write-Output "\ \ / /_ _ _ __   __ _"
    Write-Output " \ V / _  | '_ \ / _  |"
    Write-Output "  | | (_| | | | | (_| |"
    Write-Output "  |_|\__,_|_| |_|\__, |"
    Write-Output " ____   ___ ____ |___/"
    Write-Output "|___ \ / _ \___ \ / _ \"
    Write-Output "  __) | | | |__) | | | |"
    Write-Output " / __/| |_| / __/| |_| |"
    Write-Output "|_____|\___/_____|\___/"

    Write-Output "`n"

    Write-Output "Welcome to Jackson's chad powershell script.`nRemember, don't be an idiot.`n`n"
}

if ($args -notin "a","m") {
    Clear-Host
    Write-Output "Please specify auto [a] or manual [m]"
}

# Set firstrun to false
[System.Environment]::SetEnvironmentVariable("firstrun","false",[System.EnvironmentVariableTarget]::Machine)
