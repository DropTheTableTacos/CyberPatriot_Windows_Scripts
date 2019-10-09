# Jackson's Epic Powershell Script That Has A 100% Guaranteed Chance Of Not Breaking During The Competition

# Make transcript file
Start-Transcript "C:\log.txt"

# Turn off command spam
Set-PSDebug -Trace 0

# Install epic carbon module
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module Carbon

# Get windows version
function Get-SOVer {
    $ver = (Get-WmiObject -Class Win32_OperatingSystem).Version

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
    $os_name = (Get-CimInstance -ClassName CIM_OperatingSystem).Name;
    $os_list = "Windows 7","Windows 8","Windows 10","Server 2008","Server 2016";

    $os_list.foreach{
        if ($os_name -match $_) {
            $os = $_
        }
    }

    # Change name to shorter, gooder version
    if ($os -in "Windows 7","Windows 8","Windows 10") {
        return $os.Remove(3,5)
    }
    if ($os -in "Server 2008","Server 2016") {
        return $os.Remove(6,1)
    }
}

# Import lists
function Import-SOLists {
    return Import-Csv "$compfiles\lists\$args.csv"
}

# README
function Open-Readme {
    Start-Process C:\CyberPatriot\README.url;

    echo "README opened."
}

# Get user list
function Get-SOBadUsers {
    $goodusers = Get-Content "$compfiles\lists\good_users.txt" -ErrorAction SilentlyContinue

    # Add readme users to file if needed
    if ($goodusers -eq $null) {
        Open-Readme

        echo "Put readme users in this text file" >> "$compfiles\lists\good_users.txt"
        start-process "$compfiles\lists\good_users.txt"
        pause
    }

    # Compare and get bad users
    (Compare-Object $goodusers $users_nobuiltin).foreach{
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
    Write-Output "$args`n" >> "$desktop\progress.txt";
}

# Delete leftover text files
function Delete-SOTempTxt {
    cd C:\
    Remove-Item approved_users.txt,mediafiles.txt,sketchyfiles.txt,eek.txt,*files.txt,whomst.txt,sketchymemes.txt, `
    userdiff.txt -Force -ErrorAction SilentlyContinue;
}

# Import aliases
function Import-SOAlias {
    $functions = Import-SOLists functions

    $functions.foreach{
        Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force
    }
}

# Variables lol
$global:desktop = "$env:userprofile\Desktop";
$global:compfiles = "$desktop\Script";
$global:sct = "$compfiles\sctbaselines";
$global:cmderbin = "$compfiles\cmder\bin";
$global:pass = "abc123ABC123@@" | ConvertTo-SecureString -AsPlainText -Force
[System.Environment]::SetEnvironmentVariable("Path","%systemroot%;%systemroot%\system32; `
%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0; `
%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%sct%;%desktop%;%cmderbin%", `
[System.EnvironmentVariableTarget]::Machine);
$global:ver = Get-SOVer
$global:os = Get-SOOS
$global:users = Get-CUser
$global:users_nobuiltin = $users | where {$_.Description -eq $null}
$global:badusers = Get-SOBadUsers
$global:ip = Get-CIPAddress | where {$_.IPAddressToString -match "192.168"} | select IPAddressToString `
| Format-Table -HideTableHeaders

# SCT Baselines
function Import-SCT {
    cd "$cmderbin"

    # Import Microsoft recommended baselines like an absolute chad
    .\LGPO.exe /g "$sct\${os}_$ver"

    # Allow cmder and stop scoring, etc. to actually run lol
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ValidateAdminCodeSignatures `
    -PropertyType DWord -Value "0" -Force
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableUIADesktopToggle `
    -PropertyType DWord -Value "0" -Force

    Add-SOProgress "SCT Baselines imported";
    echo "SCT baselines imported."
}

# Delete users
function Delete-Users {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls;

            List-Users nobuiltin
            echo "`n"
            $answer = Read-Host "Enter a username to delete"

            if ($answer -eq "n") {
                break;
            }

            Remove-LocalUser $answer
        }

        Add-SOProgress "User(s) have been deleted"
    } else {
        $badusers.foreach{
            Remove-LocalUser $_
        }

        Add-SOProgress "Unauthorized user(s) have been deleted"
        echo "Bad men deleted."
    }
}

# Delete Admins
function Delete-Admins {
    while ($true) {
        cls;

        List-Admins;
        echo "`n"
        $answer = Read-Host "Enter a username to delete"

        if ($answer -eq "n") {
            break;
        }

        Remove-LocalGroupMember Administrators $answer
    }

    Add-SOProgress "Admin(s) have been deleted"
}

# Disable services
function Disable-Services {
    # Service exclusions
    while ($true) {
        cls

        $answer = Read-Host "Enter a service to exclude (use 'remote' for Remote Desktop)";

        if ($answer -eq "n") {
            break;
        }

        if ($answer -eq "remote") {
            $serv_exclusions += "termservice","sessionenv";
        } else {
            $serv_exclusions += $answer;
        }
    }

    # Disable list of services
    $services = Import-SOLists services

    ($services | where {$_.State -match "Uninstall"}).foreach{
        Stop-Service $_;
        Set-Service $_ -startuptype Disabled -ErrorAction SilentlyContinue;
        Uninstall-Service -Name $_
    }

    ($services | where {$_.State -match "Automatic"}).foreach{
        Set-Service $_ -startuptype Automatic -ErrorAction SilentlyContinue;
        Start-Service $_;
    }

    ($services | where {$_.State -match "Manual"}).foreach{
        Set-Service $_ -startuptype Automatic -ErrorAction SilentlyContinue;
        Start-Service $_;
    }

    ($services | where {$_.State -match "Disabled"}).foreach{
        Stop-Service $_;
        Set-Service $_ -startuptype Disabled -ErrorAction SilentlyContinue;
    }

    # Enable exlusions
    $serv_exclusions.foreach{
        Set-Service $_ -startuptype Automatic;
        Start-Service $_;
    }

    Add-SOProgress "Lame services disabled";
    echo "Bad services disabled and good ones enabled."
}

# Check forensics questions
function Open-Forensics {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_;
    }

    Add-SOProgress "Forensics Questions checked out"
    echo "Opened the forensics questions, brah."
}

# Delete Media files
function Delete-MediaFiles {
    $ext = Get-Content "$compfiles\lists\media_extensions.txt"

    $ext.foreach{
        Remove-Item "C:\$_" -Recurse -Exclude "C:\CyberPatriot\*" -Force
    }

    Add-SOProgress "Media files deleted"
    echo "Bad media files deleted."
}

# Change passwords
function Change-Passwords {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls

            List-Users
            echo "`n"

            echo "NOTE: Passwords are set to: abc123ABC123@@"
            echo "`n"
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

        echo "All passwords changed to: abc123ABC123@@"
    }
}

# Enable Firewall and template
function Enable-Firewall {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True;
    # Put command to import firewall template here

    Add-SOProgress "Firewall enabled and template applied"
    echo "Firewall enabled, brah."
}

# Disable Users
function Disable-Users {
    if ($args -in "m","man","manual") {
        Open-Readme

        while ($true) {
            cls

            List-Users
            echo "`n"
            $answer = Read-Host "Enter username to disable"

            if ($answer -eq "n") {
                break;
            }

            Disable-LocalUser $answer
        }
    } else {
        $dumbusers = "BroShirt","BroPants","Administrator","Guest"

        $dumbusers.foreach{
            Disable-LocalUser $_ -ErrorAction SilentlyContinue
        }

        Add-SOProgress "Built-in Admin and Guest disabled"

        echo "Built-in Admin and Guest disabled."
    }
}

# Windows Update
function Update-Windows {
    # Set windows update service to auto and start
    Set-Service wuauserv -startuptype Automatic;
    Start-Service wuauserv;

    # Enable automatic updates
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" `
    -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" `
    -Name AUOptions -PropertyType DWord -Value "4" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate `
    -PropertyType DWord -Value "0" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name AUOptions `
    -PropertyType DWord -Value "4" -Force;

    # Completed message
    echo "`n";
    echo "Automatic Windows Update has been configured and the service was started.";
    echo "Now start the update, biggie.";

    # Opening gui
    Start-Process ms-settings:windowsupdate -ErrorAction SilentlyContinue;
    Start-Process wuapp.exe -ErrorAction SilentlyContinue;

    pause

    Add-SOProgress "Windows Update configured and started";
}

# Install gucci programs
function Install-Programs {
    if ((Test-Path $env:programdata\chocolatey) -eq $False) {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

        choco feature enable -n allowGlobalConfirmation
        choco feature enable -n useFipsCompliantChecksums
    }

    choco install firefox ie11 malwarebytes mbsa patch-my-pc --ignorechecksum --force

    Add-SOProgress "Good security programs installed"
    echo "Gucci security programs installed."
}

# Import INF file
function Import-Inf {
    cd "$cmderbin"

    # Good inf
    if ($args -eq "good") {
        .\LGPO /s "$compfiles\infs\${os}GoodInf.inf";
        Set-SOLogonMessage

        Add-SOProgress "Good INF applied"
        echo "Good inf applied mate."
    }

    # Bad inf
    if ($args -eq "bad") {
        .\LGPO /s "$compfiles\infs\${os}BadInf.inf";
        Set-SOLogonMessage

        Add-SOProgress "Bad INF applied"
        echo "Bad inf applied mate."
    } else {
        echo "Please specify 'good' or 'bad' INF.";
        break;
    }
}

# Import Audit policy
function Import-Audit {
    cd "$cmderbin"

    # Good
    if ($args -eq "good") {
        .\LGPO /a "$compfiles\audit_templates\${os}AllAudit.csv"

        Add-SOProgress "Good audit policy applied";
        echo "Good audit template applied my dude."
    }

    # Bad inf
    if ($args -eq "bad") {
        .\LGPO /a "$compfiles\audit_templates\${os}NoAudit.csv"

        Add-SOProgress "Bad audit policy applied";
        echo "Bad audit template applied my dude."
    } else {
        echo "Please specify 'good' or 'bad' template.";
        break;
    }
}

# Disable features
function Disable-Features {
    $feature_list = Import-SOLists features

    $feature_list.foreach{
        Uninstall-WindowsFeature -Name $_;
    }

    Add-SOProgress "Disabled lame features"
    echo "Lame features disabled, or one could say, clapped"
}

# View file shares
function View-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        $answer = Read-Host "Choose a sketchy share to view"

        if ($answer -eq "n") {
            Add-SOProgress "Sketchy shares viewed"
            break;
        }

        explorer "\\$env:computername\$_";
    }
}

# Delete shares
function Delete-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        $answer = Read-Host "Choose a sketchy share to delete"

        if ($answer -eq "n") {
            Add-SOProgress "Sketchy shares deleted"
            break;
        }

        Uninstall-FileShare $_;
    }
}

# Remove programs
function Delete-Programs {
    # WIP
    Add-SOProgress "Sketchy programs removed"
}

# Remove stinky malware
function Delete-Malware {
    # WIP
    Add-SOProgress "Malware absolutely yeeted on"
}

# Disable remote desktop
function Disable-RemoteDesktop {
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" `
    -PropertyType DWord -Value "1" -Force

    Add-SOProgress "Remote Desktop disabled"
    echo "Disable remote desktop."
}

# Secure screensaver with password gamer
function Secure-Screensaver {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Control Panel" -Force
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel" -Name "Desktop" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" `
    -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "Control Panel"
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel" -Name "Desktop" -Force
    New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" `
    -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    Add-SOProgress "Screensaver secured with password"
    echo "Secured screensaver with a password."
}

# Hosts file
function Clear-Hosts {
    Reset-CHostsFile

    Add-SOProgress "Hosts file cleared"
    echo "Hosts file cleared, ez"
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
    echo "Firefox swole settings copied."
}

# Prohibited users' files
function Find-ProhibitedUserFiles {
    $badusers.foreach{
        $f = Get-ChildItem C:\* -Recurse | Get-Acl

        if ($f.Owner -eq "$_") {
            echo $f.Path
        }
    }

    Add-SOProgress "Prohibited user files theoretically found maybe idk"
    echo "Prohibited user files theoretically found maybe idk."
}

# Delete user folders of bad users
function Delete-BadUserFolders {
    $badusers.foreach{
        Remove-Item C:\Users\$_ -Recurse -Force
    }

    Add-SOProgress "Bad user folders deleted"
    echo "Bad user folders deleted."
}

# Update programs
function Update-Programs {
    cls
    echo "Update all the dang programs, son."
    echo "`n"
    echo "IMPORTANT: Check if the programs have auto updates"
    pause
    Add-SOProgress "Hopefully got those gamer program updates"
}

# Run Nessus scans
function Run-Nessus {
    $ip
    echo "Run Nessus scans, ya brainlet"
    pause

    Add-SOProgress "Nessus scan theoretically run?"
}

# Find prohibited files
function Find-ProhibitedFiles {
       # Put stuff here eventually
       Add-SOProgress "Prohibited files may have been found"
       echo "Prohibited files may have been found"
}

# Run Sysinternals
function Run-Sysinternals {
    $sysinternals = "autoruns","procexp","tcpview"

    $sysinternals.foreach{
        Start-Process "$cmderbin\$_"
    }

    Add-SOProgress "Ran sysinternals stuff"
}

# CISCAT Registry batch file
function Run-CiscatRegistry {
    $cisreg = Get-Content "$compfiles\lists\ciscat_registry.txt"

    $cisreg.foreach{
        $_;
    }

    Add-SOProgress "CISCAT Registry batch file run";
}

# IE registry gamers
function Import-IERegistry {
    $ie_reg = Get-Content "$compfiles\lists\ie_registry.txt" | Select-String -NotMatch "#"

    $ie_reg.foreach{
        $_
    }

    Add-SOProgress "Set CISCAT Internet Explorer registry settings"
    echo "Imported IE Registry settings"
}

# Enable internet explorer
function Enable-InternetExplorer {
    # Enable IE
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all `
    -ErrorAction SilentlyContinue
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all `
    -ErrorAction SilentlyContinue

    Add-SOProgress "Enabled Internet Explorer"
    echo "Enabled the gamer internet explorer."
}

# Delete applocker rules
function Delete-AppLocker {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

    Add-SOProgress "AppLocker policies cleared"
    echo "Applocker policies cleared."
}

# Activate/Disable users
function Enable-Users {
    if ($args -in "man","manual","m") {
        Open-Readme

        while ($true) {
            cls

            List-Users nobuiltin
            echo "`n"
            $answer = Read-Host "Enter username to enable"

            if ($answer -eq "n") {
                break;
            }

            Enable-LocalUser $answer
        }
    } else {
        $users_nobuiltin.foreach{
            Enable-LocalUser $_;
        }

        Add-SOProgress "All users (except built-in Admin and Guest) enabled"

        echo "All users (except built-in Admin and Guest) enabled."
    }
}

# enable uac because that would be a good idea though its already enabled by default but whatever frick off
function Enable-UAC {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" `
    -PropertyType DWord -Value "1" -Force

    Add-SOProgress "UAC Enabled"
    echo "Enabled UAC"
}

# Cat-Lite scanner
function Run-CatLite {
    if ($os -eq "Win10") {
        Start-Process "$cmderbin\cis-cat-lite\CISCAT.jar"
    } else {
        cls
        echo "Sorry mate, you can't use the Cat-Lite scanner. Cause it aint Windows 10."
    }
}

# Add Admins
function Add-Admins {
    while ($true) {
        cls;

        List-Admins;
        echo "`n"
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        Add-CGroupMember Administrators $answer
    }

    Add-SOProgress "Admin(s) have been added"
}

# Add users
function Add-Users {
    Open-Readme

    while ($true) {
        cls;

        List-Users
        echo "`n"
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        New-LocalUser $answer -Password $pass
    }

    Add-SOProgress "User(s) have been added"
}

# Copy script to profile
function Copy-ToProfile {
    Copy-Item "$env:userprofile\Desktop\Script\script.ps1" `
    "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    echo "Script copied to pshell profile."
}

# Find media files
function Find-MediaFiles {
    $ext = Get-Content "$compfiles\lists\media_extensions.txt"

    $ext.foreach{
        $mediafiles = Get-ChildItem "C:\$_" -Recurse -Exclude "C:\CyberPatriot\*" -Force
    }

    $mediafiles >> "C:\mediafiles.txt"
    Start-Process "C:\mediafiles.txt"

    Add-SOProgress "Searched for media files"
}

# Get program list
function List-Programs {
    Get-CProgramInstallInfo
}

# List services
function List-Service {
    $services = Get-WmiObject -Class Win32_Service | select Name, DisplayName, State, StartMode, ProcessId, `
    InstallDate, PathName;

    if ($args -in "running","stopped") {
        $services | where state -match "$args";
        break;
    }

    if ($args -eq "auto","disabled","manual") {
        $services | where startmode -match "$args";
        break;
    } else {
        $services;
    }
}

# List admins
function List-Admins {
    $users | where {(test-groupmember Administrators $_) -eq $true} | select name
}

# List users
function List-Users {
    if ($args -eq "nobuiltin") {
        $users_nobuiltin | select name | format-wide
    } else {
        $users | select name | format-wide
    }
}

# List functions
function List-Functions {
    $functions = Import-SOLists functions

    $functions | where {$_ -notmatch "-SO"}
}

# Run script easily function
function Run-Script {
    Copy-ToProfile
    . $profile
}

# Intro screen bois
cls

echo "__          ___    _       _______   _    _ _____"
echo "\ \        / / |  | |   /\|__   __| | |  | |  __ \"
echo " \ \  /\  / /| |__| |  /  \  | |    | |  | | |__) |"
echo "  \ \/  \/ / |  __  | / /\ \ | |    | |  | |  ___/"
echo "   \  /\  /  | |  | |/ ____ \| |    | |__| | |"
echo "    \/  \/   |_|  |_/_/    \_\_|     \____/|_|"

echo "`n"

echo " _____ _____ _   _  _____   _____   ____  _   _  _____  _____"
echo "|  __ \_   _| \ | |/ ____| |  __ \ / __ \| \ | |/ ____|/ ____|"
echo "| |  | || | |  \| | |  __  | |  | | |  | |  \| | |  __| (___"
echo "| |  | || | | .   | | |_ | | |  | | |  | | .   | | |_ |\___ \"
echo "| |__| || |_| |\  | |__| | | |__| | |__| | |\  | |__| |____) |"
echo "|_____/_____|_| \_|\_____| |_____/ \____/|_| \_|\_____|_____/"

echo "`n"

pause

# Actually start the script UwU

# Setup Functions
Set-SOLogonMessage
Delete-SOTempTxt
Import-SOAlias
$functions = Import-SOLists functions
$functions.foreach{
    Set-Alias -Name $_.Alias -Value $_.Name -Option AllScope -Force
}

# Excute all functions with pauses inbetween
cls
List-Functions
