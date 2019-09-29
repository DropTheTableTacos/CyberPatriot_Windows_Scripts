# Jackson's Epic Powershell Script That Has A 100% Guaranteed Chance Of Not Breaking During The Competition

# List of things that need to happen:
#   - Get-UserList
#   - Finish all the rest of the stuff

# Make transcript file
Start-Transcript "C:\log.txt"

# Turn off command spam
Set-PSDebug -Trace 0

# Install epic carbon module
Install-Module Carbon

# Get windows version
function Get-Ver {
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
function Get-OS {
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
function Import-Lists {
   return Get-Content "$compfiles\lists\$args.txt"
}

# Get user list
function Get-BadUsers {
    $goodusers = Get-Content "$compfiles\lists\good_users.txt"

    # Add readme users to file if needed
    if ($goodusers -eq $null) {
        echo "Put readme users in this text file" >> "$compfiles\lists\good_users.txt"
        start-process "$compfiles\lists\good_users.txt"
        pause
    }

    # Compare and get bad users
    (Compare-Object $goodusers $users).foreach{
        return $_.InputObject
    }
}

# Variables lol
$global:desktop = "$env:userprofile\Desktop";
$global:compfiles = "$desktop\Script";
$global:sct = "$compfiles\sctbaselines";
$global:cmderbin = "$compfiles\cmder\bin";
$global:pass = ConvertTo-SecureString "abc123ABC123@@" -AsPlainText -Force
[System.Environment]::SetEnvironmentVariable("Path","%systemroot%;%systemroot%\system32; `
%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0; `
%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%sct%;%desktop%;%cmderbin%", `
[System.EnvironmentVariableTarget]::Machine);
$global:ver = Get-Ver
$global:os = Get-OS
$global:users_admins = Get-CUser
$global:users = $users_admins | where {$_.Name -notin (Import-Lists builtin_users)}
$global:badusers = Get-BadUsers
$global:ip = Get-CIPAddress | where {$_.IPAddressToString -match "192.168"} | select IPAddressToString `
| Format-Table -HideTableHeaders

# SCT Baselines
function Import-SCT {
    cd "$cmderbin"

    # IE Baselines
    .\LGPO /g "$sct\IE11"

    if ($os -eq "Server2008") {
        .\LGPO /g "$sct\IE9"
    }

    # OS baselines
    if ($os -eq "Win10") {
        .\LGPO /g "$sct\Win10_$ver"
    } else {
        .\LGPO /g "$sct\$os"
    }

    Add-Progress "SCT Baselines imported";
}

# README
function Open-Readme {
    Start-Process C:\CyberPatriot\README.url;
}

# Delete users
function Delete-Users {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls;

            $users_admins;
            echo "`n"
            $answer = Read-Host "Enter a username to delete"

            if ($answer -eq "n") {
                break;
            }

            Remove-LocalUser $answer
        }

        Add-Progress "User(s) have been deleted"
    } else {
        $badusers.foreach{
            Remove-LocalUser $_
        }

        Add-Progress "Unauthorized user(s) have been deleted"
    }
}

# Delete Admins
function Delete-Admins {
    while ($true) {
        cls;

        List-Admin;
        echo "`n"
        $answer = Read-Host "Enter a username to delete"

        if ($answer -eq "n") {
            break;
        }

        Remove-LocalGroupMember Administrators $answer
    }

    Add-Progress "Admin(s) have been deleted"
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
            $serv_exclusions = "termservice","sessionenv";
        } else {
            $serv_exclusions += $answer;
        }
    }

    # Disable list of services
    $services = Import-Lists services

    $services.foreach{
        Stop-Service $_;
        Set-Service $_ -startuptype Disabled -ErrorAction SilentlyContinue;
    }

    # Enable exlusions
    $serv_exclusions.foreach{
        Set-Service $_ -startuptype Automatic;
        Start-Service $_;
    }

	# Enable good services
	Set-Service wuauserv -startuptype Automatic;
    Start-Service wuauserv;
    Set-Service eventlog -startuptype Automatic;
    Start-Service eventlog;
	Set-Service windefend -startuptype Automatic;
    Start-Service windefend;
	Set-Service wscsvc -startuptype Automatic;
    Start-Service wscsvc;

    Add-Progress "Lame services disabled";
}

# Add Admins
function Add-Admins {
    while ($true) {
        cls;

        List-Admin;
        echo "`n"
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        Add-CGroupMember Administrators $answer
    }

    Add-Progress "Admin(s) have been added"
}

# Add to progress log
function Add-Progress {
    Write-Output "$args`n" >> "$desktop\progress.txt";
}

# Add users
function Add-Users {
    Open-Readme

    while ($true) {
        cls;

        $users_admins;
        echo "`n"
        $answer = Read-Host "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        New-LocalUser $answer -Password $pass
    }

    Add-Progress "User(s) have been added"
}

# Change passwords
function Change-Passwords {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls

            $users_admins
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
        $users_admins.foreach{
            Set-LocalUser $_ -Password $pass
        }

        Add-Progress "All passwords changed to a gamer secure password"

        echo "All passwords changed to: abc123ABC123@@"
    }
}

# Hosts file
function Clear-Hosts {
    Copy-Item "$compfiles\hosts" "$env:systemroot\system32\drivers\etc\hosts" -Force

    Add-Progress "Hosts file replaced"
}

# Copy script to profile
function Copy-ToProfile {
    Copy-Item "$env:userprofile\Desktop\Script\script.ps1" `
    "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}

# Delete applocker rules
function Delete-AppLocker {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

    Add-Progress "AppLocker policies cleared"
}

# Delete Media files
function Delete-MediaFiles {
    Import-Lists media_extensions

    $lists.foreach{
        Remove-Item "C:\$_" -Recurse -Exclude "C:\CyberPatriot\*" -Force
    }

    Add-Progress "Media files deleted"
}

# Remove programs
function Delete-Program {
    Add-Progress "Sketchy programs removed"
}

# Delete shares
function Delete-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        $answer = Read-Host "Choose a sketchy share to delete"

        if ($answer -eq "n") {
            Add-Progress "Sketchy shares deleted"
            break;
        }

        Remove-FileShare $_;
    }
}

# Delete leftover text files
function Delete-TempTxt {
    cd C:\
    Remove-Item approved_users.txt,mediafiles.txt,sketchyfiles.txt,eek.txt,*files.txt,whomst.txt,sketchymemes.txt, `
    userdiff.txt -Force -ErrorAction SilentlyContinue;
}

# Disable features
function Disable-Features {
    $feature_list = Get-Content

    $feature_list.foreach{
        Disable-WindowsOptionalFeature -Online -FeatureName $_;
    }

    Add-Progress "Disabled lame features"
}

# Disable remote desktop
function Disable-RemoteDesktop {
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" `
    -PropertyType DWord -Value "1" -Force

    Add-Progress "Remote Desktop disabled"
}

# Disable Users
function Disable-Users {
    if ($args -in "m","man","manual") {
        Open-Readme

        while ($true) {
            cls

            $users_admins
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

        Add-Progress "Built-in Admin and Guest disabled"

        echo "Built-in Admin and Guest disabled."
    }
}

# Enable Firewall and template
function Enable-Firewall {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True;
    # Put command to import firewall template here

    Add-Progress "Firewall enabled and template applied"
}

# Enable internet explorer
function Enable-InternetExplorer {
    # Enable IE
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all `
    -ErrorAction SilentlyContinue
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all `
    -ErrorAction SilentlyContinue

    Add-Progress "Enabled Internet Explorer"
}

# enable uac because that would be a good idea though its already enabled by default but whatever frick off
function Enable-UAC {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" `
    -PropertyType DWord -Value "1" -Force

    Add-Progress "UAC Enabled"
}

# Activate/Disable users
function Enable-Users {
    if ($args -in "man","manual","m") {
        Open-Readme

        while ($true) {
            cls

            $users_admins
            echo "`n"
            $answer = Read-Host "Enter username to enable"

            if ($answer -eq "n") {
                break;
            }

            Enable-LocalUser $answer
        }
    } else {
        $users.foreach{
            Enable-LocalUser $_;
        }

        Add-Progress "All users (except built-in Admin and Guest) enabled"

        echo "All users (except built-in Admin and Guest) enabled."
    }
}

# Find media files
function Find-MediaFiles {
    Import-Lists media_extensions

    $lists.foreach{
        $mediafiles = Get-ChildItem "C:\$_" -Recurse -Exclude "C:\CyberPatriot\*" -Force
    }

    $mediafiles >> "C:\mediafiles.txt"
    Start-Process "C:\mediafiles.txt"

    Add-Progress "Searched for media files"
}

# Find prohibited files
function Find-ProhibitedFiles {
       # Put stuff here eventually
}

# Prohibited users' files
function Find-ProhibitedUserFiles {
    $bad_users.foreach{
        $f = Get-ChildItem C:\* -Recurse | Get-Acl

        if ($f.Owner -eq "$_") {
            echo $f.Path
        }
    }
}

# Run Nessus scans
function Run-Nessus {
    $ip
    echo "Run Nessus scans, ya brainlet"
    pause

    Add-Progress "Nessus scan theoretically run?"
}

# Install chocolatey
function Install-Choco {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco feature enable -n allowGlobalConfirmation
    choco feature enable -n useFipsCompliantChecksums
}

# Get program list
function List-Programs {
    $program_list = Get-WmiObject -Class Win32_Product | select name, installsource, installlocation, version, `
    installdate, vendor | format-table -AutoSize
    $program_list > C:\program_list.txt
    Start-Process C:\program_list.txt
}

# Set logon message to username and password
function Set-LogonMessage {
    # Change password
    Set-LocalUser $env:username -Password $pass

    # Set logon message
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticecaption `
    PropertyType String -Value "Username: $env:username" -Force -InformationAction SilentlyContinue
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticetext `
    PropertyType String -Value "Password: abc123ABC123@@" -Force -InformationAction SilentlyContinue
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
function List-Admin {
    Get-LocalGroupMember -Group Administrators | select Name | format-wide;
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

    Add-Progress "Windows Update configured and started";
}

# Firefox config
function Set-FirefoxConfig {
    # 64-bit
    Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles\Mozilla Firefox\browser\override.ini" `
    -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles\Mozilla Firefox\mozilla.cfg" -Force `
    -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\local-settings.js" `
    "$env:programfiles\Mozilla Firefox\defaults\pref\local-settings.js" -Force -ErrorAction SilentlyContinue

    # 32-bit
    Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles(x86)\Mozilla Firefox\browser\override.ini" `
    -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles(x86)\Mozilla Firefox\mozilla.cfg" -Force `
    -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\local-settings.js" `
    "$env:programfiles(x86)\Mozilla Firefox\defaults\pref\local-settings.js" -Force -ErrorAction SilentlyContinue

    Add-Progress "Firefox config files copied"
}

# CISCAT Registry batch file
function Run-CiscatRegistry {
    $list = Import-Lists ciscat_registry

    $list.foreach{
        $_;
    }

    Add-Progress "CISCAT Registry batch file run";
}

# Import INF file
function Import-Inf {
    Get-OS
    cd "$cmderbin"

    # Good inf
    if ($args -eq "good") {
        .\LGPO /s "$compfiles\infs\${os}GoodInf.inf";
        Set-LogonMessage

        Add-Progress "Good INF applied"
    }

    # Bad inf
    if ($args -eq "bad") {
        .\LGPO /s "$compfiles\infs\${os}BadInf.inf";
        Set-LogonMessage

        Add-Progress "Bad INF applied"
    } else {
        echo "Please specify 'good' or 'bad' INF.";
        break;
    }
}

# Import Audit policy
function Import-Audit {
    Get-OS
    cd "$cmderbin"

    # Good
    if ($args -eq "good") {
        .\LGPO /a "$compfiles\audit_templates\${os}AllAudit.csv"

        Add-Progress "Good audit policy applied";
    }

    # Bad inf
    if ($args -eq "bad") {
        .\LGPO /a "$compfiles\audit_templates\${os}NoAudit.csv"

        Add-Progress "Bad audit policy applied";
    } else {
        echo "Please specify 'good' or 'bad' template.";
        break;
    }
}

# Check forensics questions
function Open-Forensics {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_;
    }

    Add-Progress "Forensics Questions checked out"
}

# View file shares
function View-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        $answer = Read-Host "Choose a sketchy share to view"

        if ($answer -eq "n") {
            Add-Progress "Sketchy shares viewed"
            break;
        }

        explorer "\\$env:computername\$_";
    }
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

    Add-Progress "Screensaver secured with password"
}

# List functions
function List-Functions {
    Import-Lists functions
    $lists.foreach{
        $alias = (Get-Alias -Definition $_).Name
        echo "$_ ($alias)"
    }
}

# Install gucci programs
function Install-Programs {
    Install-Choco

    choco install firefox ie11 malwarebytes mbsa --ignorechecksum --force

    Add-Progress "Good security programs installed"
}

# IE registry gamers
function Import-IERegistry {
    Import-Lists ie_registry
    $ie_reg = $lists | Select-String -NotMatch "#"

    $ie_reg.foreach{
        $_
    }

    Add-Progress "Set CISCAT Internet Explorer registry settings"
}

# Update programs
function Update-Programs {
    cls
    echo "Update all the dang programs, son."
    echo "`n"
    echo "IMPORTANT: Check if the programs have auto updates"
    pause
}

# Run Sysinternals
function Run-Sysinternals {
    $sysinternals = "autoruns","procexp","tcpview"

    $sysinternals.foreach{
        Start-Process "$cmderbin\$_"
    }
}

# Cat-Lite scanner
function Run-CatLite {
    Get-OS

    if ($os -in "Win10") {
        Start-Process "$cmderbin\cis-cat-lite\CISCAT.jar"
    } else {
        cls
        echo "Sorry mate, you can't use the Cat-Lite scanner. Cause it aint Windows 10."
    }
}

# Run script easily function
function Run-Script {
    Copy-ToProfile
    . $profile
}

# Delete user folders of bad users
function Delete-BadUserFolders {
    $badusers.foreach{
        Remove-Item C:\Users\$_ -Recurse -Force
    }
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
Import-Alias "$compfiles\lists\aliases.csv" -Force
Copy-ToProfile

# List functions gamer
cls
List-Functions

# Actually run all the functions now
# Put stuff here
