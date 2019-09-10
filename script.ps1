# Jackson's Epic Powershell Script That Has A 100% Guaranteed Chance Of Not Breaking During The Competition

# List of things that need to happen:
#   - Get-UserList
#   - List-Functions
#   - Finish all the rest of the stuff

# Make transcript file
Start-Transcript "C:\log.txt"

# Turn off command spam
Set-PSDebug -Trace 0

# Import applocker
Import-Module AppLocker

# Setup all variables
function Set-Variables {
    $global:desktop = "$env:userprofile\Desktop";
    $global:compfiles = "$desktop\Script";
    $global:scm = "$compfiles\scmbaselines";
    $global:cmderbin = "$compfiles\cmder\bin";
    $global:autousers = $false;
    $global:pass = ConvertTo-SecureString "abc123ABC123@@"
    [System.Environment]::SetEnvironmentVariable("Path","%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%",[System.EnvironmentVariableTarget]::Machine);
}

# Install chocolatey
function Install-Choco {
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco feature enable -n allowGlobalConfirmation
    choco feature enable -n useFipsCompliantChecksums
}

# Powershell 5 check
function Check-Powershell5 {
    if (($PSVersionTable.PSVersion).Major -ne "5") {
        Install-Choco
        choco install powershell dotnet4.5

        Restart-Computer -Force
    }
}

# Get OS name
function Get-OS {
    $os_name = (Get-CimInstance -ClassName CIM_OperatingSystem).Name;
    $os_list = "Windows 7","Windows 8","Windows 10","Server 2008","Server 2016";
    $os = "Unknown";

    $os_list.foreach{
        if ($os_name -match $_) {
            $os = $_
        }
    }

    # Change name to shorter, gooder version
    if ($os -in "Windows 7","Windows 8","Windows 10") {
        $global:os = $os.Remove(3,5)
    }
    if ($os -in "Server 2008","Server 2016") {
        $global:os = $os.Remove(6,1)
    }
}

# Get version
function Get-Ver {
    $global:ver = (Get-WmiObject -Class Win32_OperatingSystem).Version
}

# Get user list
function Get-UserList {
    $global:user_list_admins = Get-LocalUser | select name

    Import-Lists builtin_users
    $global:user_list = Get-LocalUser | select name | where name -notin $lists

    # Add readme users to file
    cls
    echo "Please put all the users from README in this text file"
    start-process "$compfiles\lists\good_users.txt"
    pause

    # Get good user and bad user list
    Import-Lists good_users
    $global:bad_users = (Compare-Object $user_list $lists -PassThru).Name

    $bad_users
}

# Get program list
function List-Programs {
    $program_list = Get-WmiObject -Class Win32_Product | select name, installsource, installlocation, version, installdate, vendor | format-table -AutoSize
    $program_list > C:\program_list.txt
    Start-Process C:\program_list.txt
}

# User prompt
function Ask-Prompt {
    $global:answer = Read-Host $args
}

# Set logon message to username and password
function Set-LogonMessage {
    # Change password
    New-LocalUser $env:username -Password $pass

    # Set logon message
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticecaption -PropertyType String -Value "Username: $env:username" -Force -InformationAction SilentlyContinue
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name legalnoticetext -PropertyType String -Value "Password: abc123ABC123@@" -Force -InformationAction SilentlyContinue
}

# Delete leftover text files
function Remove-TempTxt {
    cd C:\
    Remove-Item approved_users.txt,mediafiles.txt,sketchyfiles.txt,eek.txt,*files.txt,whomst.txt,sketchymemes.txt,userdiff.txt -Force -ErrorAction SilentlyContinue;
}

# List services
function List-Service {
    $get_service = Get-WmiObject -Class Win32_Service | select Name, DisplayName, State, StartMode, ProcessId, InstallDate, PathName;

    if ($args -in "running","stopped") {
        $get_service | where state -match "$args";
        break;
    }

    if ($args -eq "auto","disabled","manual") {
        $get_service | where startmode -match "$args";
        break;
    } else {
        $get_service;
    }
}

# List users
function List-User {
    Get-LocalUser | select Name, Enabled | format-wide;
}

# List admins
function List-Admin {
    Get-LocalGroupMember -Group Administrators | select Name | format-wide;
}

# Add to progress log
function Add-Progress {
    echo "$args" >> "$desktop\progress.txt";
    echo "`n" >> "$desktop\progress.txt";
}

# Import lists
function Import-Lists {
    $global:lists = Get-Content "$compfiles\lists\$args.txt"
}

# README
function Open-Readme {
    Start-Process C:\CyberPatriot\README.url;
}

# Windows Update
function Update-Windows {
    # Set windows update service to auto and start
    Set-Service wuauserv -startuptype Automatic;
    Start-Service wuauserv;

    # Enable automatic updates
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name AUOptions -PropertyType DWord -Value "4" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate -PropertyType DWord -Value "0" -Force;
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name AUOptions -PropertyType DWord -Value "4" -Force;

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

# Enable Firewall and template
function Enable-Firewall {
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True;
    # Put command to import firewall template here

    Add-Progress "Firewall enabled and template applied"
}

# Hosts file
function Clear-Hosts {
    Copy-Item "$compfiles\hosts" "$env:systemroot\system32\drivers\etc\hosts" -Force

    Add-Progress "Hosts file replaced"
}

# Firefox config
function Set-FirefoxConfig {
    # 64-bit
    Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles\Mozilla Firefox\browser\override.ini" -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles\Mozilla Firefox\mozilla.cfg" -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\local-settings.js" "$env:programfiles\Mozilla Firefox\defaults\pref\local-settings.js" -Force -ErrorAction SilentlyContinue

    # 32-bit
    Copy-Item "$compfiles\firefox_config\override.ini" "$env:programfiles(x86)\Mozilla Firefox\browser\override.ini" -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\mozilla.cfg" "$env:programfiles(x86)\Mozilla Firefox\mozilla.cfg" -Force -ErrorAction SilentlyContinue
    Copy-Item "$compfiles\firefox_config\local-settings.js" "$env:programfiles(x86)\Mozilla Firefox\defaults\pref\local-settings.js" -Force -ErrorAction SilentlyContinue

    Add-Progress "Firefox config files copied"
}

# SCM Baselines
function Import-SCM {
    Get-Ver
    Get-OS

    cd "$cmderbin"

    # IE Baselines
    .\LGPO /g "$scm\IE11_Com_Sec";
    .\LGPO /g "$scm\IE11_User_Sec";

    if ($os -eq "Server2008") {
        .\LGPO /g "$scm\IE9_User_Sec";
	    .\LGPO /g "$scm\IE9_Com_Sec";
    }

    # OS baselines
    if ($os -eq "Win10") {
        if ($ver -eq "10.0.10240") {.\LGPO /g "$scm\Win10_1507"};
        if ($ver -eq "10.0.10586") {.\LGPO /g "$scm\Win10_1511"};
        if ($ver -eq "10.0.14393") {.\LGPO /g "$scm\Win10_1607_Server2016"};
        if ($ver -eq "10.0.15063") {.\LGPO /g "$scm\Win10_1703"};
        if ($ver -eq "10.0.16299") {.\LGPO /g "$scm\Win10_1709"};
        if ($ver -eq "10.0.17134") {.\LGPO /g "$scm\Win10_1803"};
    }

    if ($os -eq "Server2016") {
        .\LGPO /g "$scm\Win10_1607_Server2016";
    } else {
        .\LGPO /g "$scm\$os";
    }

    Add-Progress "SCM Baselines imported";
}

# CISCAT Registry batch file
function Run-CiscatRegistry {
    Import-Lists ciscat_registry

    $lists.foreach{
        $_;
    }

    Add-Progress "CISCAT Registry batch file run";
}

# Disable services
function Disable-Services {
    # Service exclusions
    while ($true) {
        cls

        Ask-Prompt "Enter a service to exclude (use 'remote' for Remote Desktop)";

        if ($answer -eq "n") {
            break;
        }

        if ($answer -eq "remote") {
            $global:serv_exclusions = "termservice","sessionenv";
        } else {
            $serv_exclusions += $answer;
        }
    }

    # Disable list of services
    Import-Lists services

    $lists.foreach{
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

# Get IP address
function Get-Ip {
    $ip = Get-NetIPAddress | where AddressFamily -match "IPv4" | where AddressState -match "Preferred" | where InterfaceAlias -notmatch "Loopback" | select IPAddress;

    $ip;

    Add-Progress "Nessus scan theoretically run?"
}

# Activate/Disable users
function Enable-Users {
    if ($args -in "man","manual","m") {
        Open-Readme

        while ($true) {
            cls

            List-User
            echo "`n"
            Ask-Prompt "Enter username to enable"

            if ($answer -eq "n") {
                break;
            }

            Enable-LocalUser $answer
        }
    } else {
        $user_list_admins.foreach{
            Enable-LocalUser $_;
        }

        Disable-LocalUser BroShirt;
        Disable-LocalUser BroPants;

        Add-Progress "All users (except built-in Admin and Guest) enabled"

        echo "All users (except built-in Admin and Guest) enabled."
    }
}

# Disable Users
function Disable-Users {
    if ($args -in "m","man","manual") {
        Open-Readme

        while ($true) {
            cls

            List-User
            echo "`n"
            Ask-Prompt "Enter username to disable"

            if ($answer -eq "n") {
                break;
            }

            Disable-LocalUser $answer
        }
    } else {
        Disable-LocalUser BroShirt;
        Disable-LocalUser BroPants;

        Add-Progress "Built-in Admin and Guest disabled"

        echo "Built-in Admin and Guest disabled."
    }
}

# Change passwords
function Change-Passwords {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls

            List-User
            echo "`n"

            echo "NOTE: Passwords are set to: abc123ABC123@@"
            echo "`n"
            Ask-Prompt "Enter username to change password"

            if ($answer -eq "n") {
                break
            }

            New-LocalUser $answer -Password $pass
        }
    } else {
        $user_list_admins.foreach{
            New-LocalUser $_ -Password $pass
        }

        Add-Progress "All passwords changed to a gamer secure password"

        echo "All passwords changed to: abc123ABC123@@"
    }
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

# Add users
function Add-Users {
    while ($true) {
        cls;

        List-User;
        echo "`n"
        Ask-Prompt "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        New-LocalUser $answer -Password $pass
    }

    Add-Progress "User(s) have been added"
}

# Delete users
function Remove-Users {
    if ($args -in "m","man","manual") {
        while ($true) {
            cls;

            List-User;
            echo "`n"
            Ask-Prompt "Enter a username to delete"

            if ($answer -eq "n") {
                break;
            }

            Remove-LocalUser $answer
        }

        Add-Progress "User(s) have been deleted"
    }

    else {
        $bad_users.foreach{
            Remove-LocalUser $_
        }

        Add-Progress "Unauthorized user(s) have been deleted"
    }
}

# Add Admins
function Add-Admins {
    while ($true) {
        cls;

        List-Admin;
        echo "`n"
        Ask-Prompt "Enter a username to add"

        if ($answer -eq "n") {
            break;
        }

        Add-LocalGroupMember Administrators $answer
    }

    Add-Progress "Admin(s) have been added"
}

# Delete Admins
function Remove-Admins {
    while ($true) {
        cls;

        List-Admin;
        echo "`n"
        Ask-Prompt "Enter a username to delete"

        if ($answer -eq "n") {
            break;
        }

        Remove-LocalGroupMember Administrators $answer
    }

    Add-Progress "Admin(s) have been deleted"
}

# Enable internet explorer
function Enable-InternetExplorer {
    # Enable IE
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all -ErrorAction SilentlyContinue
    Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all -ErrorAction SilentlyContinue

    Add-Progress "Enabled Internet Explorer"
}

# Disable features
function Disable-Features {
    $feature_list = Get-Content

    $feature_list.foreach{
        Disable-WindowsOptionalFeature -Online -FeatureName $_;
    }

    Add-Progress "Disabled lame features"
}

# Remove programs
function Remove-Program {
    Add-Progress "Sketchy programs removed"
}

# Check forensics questions
function Open-Forensics {
    (Get-ChildItem "$desktop\Forensics Question *.txt").foreach{
        Start-Process $_;
    }

    Add-Progress "Forensics Questions checked out"
}

# Delete Media files
function Remove-MediaFiles {
    Import-Lists media_extensions

    $lists.foreach{
        Remove-Item "C:\$_" -Recurse -Exclude "C:\CyberPatriot\*" -Force
    }

    Add-Progress "Media files deleted"
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

# Delete shares
function Remove-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        Ask-Prompt "Choose a sketchy share to delete"

        if ($answer -eq "n") {
            Add-Progress "Sketchy shares deleted"
            break;
        }

        Remove-FileShare $_;
    }
}

# View file shares
function View-Shares {
    while ($true) {
        cls;

        Get-FileShare
        echo "`n"

        Ask-Prompt "Choose a sketchy share to view"

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
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "Control Panel"
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Control Panel" -Name "Desktop" -Force
    New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name ScreenSaverIsSecure -PropertyType DWord -Value "1" -Force

    Add-Progress "Screensaver secured with password"
}

# Disable remote desktop
function Disable-RemoteDesktop {
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -PropertyType DWord -Value "1" -Force

    Add-Progress "Remote Desktop disabled"
}

# List functions
function List-Functions {
    Import-Lists functions
    $lists
}

# Delete applocker rules
function Delete-AppLocker {
    Set-AppLockerPolicy -XMLPolicy "$compfiles\begoneapplocker.xml"

    Add-Progress "AppLocker policies cleared"
}

# enable uac because that would be a good idea though its already enabled by default but whatever frick off
function Enable-UAC {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -PropertyType DWord -Value "1" -Force

    Add-Progress "UAC Enabled"
}

# Install gucci programs
function Install-Programs {
    Install-Choco

    choco install firefox ie11 malwarebytes mbsa --ignorechecksum --force
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
Set-Variables

cls
List-Functions

# Actually run all the functions now
# Put stuff here
