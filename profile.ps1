# Profile

# Add folders to PATH
$env:Path = "$Env:CMDER_ROOT\bin;$Env:CMDER_ROOT\vendor\bin;$Env:CMDER_ROOT;$Env:CMDER_ROOT\bin\ciscatlite;$Env:CMDER_ROOT\bin\ripgrep;$Env:CMDER_ROOT\bin\sysinternals;$env:Path;"

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

# Import lists
function Import-Lists {
    return Import-Csv "$compfiles\lists\$args.csv"
}

# Get bad users list
function Get-BadUsers {
    # Add readme users to file if needed
    if ($autouser -eq $true) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"
        Pause
    }

    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt" 2> $null
    $goodusers = ($gooduserlist).Trim(";")

    # Compare and get bad users
    (Compare-Object $goodusers $users_nobuiltin).foreach{
        return $_.InputObject
    }
}

# Get bad admin list
function Get-BadAdmins {
    # Add readme users to file if needed
    if ($autouser -eq $true) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"
        Pause
    }

    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt" 2> $null
    $goodadmins = ($gooduserlist | Select-String ";" | Out-String -Stream).Trim(";")

    # Compare and get bad admins
    (Compare-Object $goodadmins $admins_nobuiltin).foreach{
        return $_.InputObject
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
$global:gpos = "$compfiles\gpos"
$global:pass = "abc123ABC123@@" | ConvertTo-SecureString -AsPlainText -Force
$global:os = Get-OS
$global:users = (Get-LocalUser).Name
$global:users_nobuiltin = (Get-LocalUser | Where-Object Description -notmatch "." | Where-Object Name -ne "defaultuser0").Name
$global:admins = (Get-LocalGroupMember Administrators).Name.Trim(($env:COMPUTERNAME | Out-String)).Trim("\")
$global:admins_nobuiltin = $admins | Select-String -NotMatch "Administrator"
if ($args -eq "nul") {
    $global:badusers = $null
    $global:badadmins = $null
} else {
    $global:badusers = Get-BadUsers
    $global:badadmins = Get-BadAdmins
}

# Import aliases
Set-Alias -Name scl -Value Start-CatLite -Option AllScope -Force
Set-Alias -Name gf -Value Get-Functions -Option AllScope -Force
Set-Alias -Name osr -Value Open-ScoringReport -Option AllScope -Force
Set-Alias -Name oss -Value Open-StopScoring -Option AllScope -Force
Set-Alias -Name seoa -Value Set-EaseOfAccess -Option AllScope -Force
Set-Alias -Name up -Value Unblock-Programs -Option AllScope -Force

Set-EaseOfAccess
Unblock-Programs

clear