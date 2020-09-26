# Profile

# Variables
$global:desktop = "$env:userprofile\Desktop"
$global:compfiles = "$desktop\Script"
$global:installers = "$compfiles\installers"
$global:gpo = "$compfiles\gpo"
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

# Add cmder/bin to PATH
$env:Path = "$Env:CMDER_ROOT\bin;$Env:CMDER_ROOT\vendor\bin;$env:Path;$Env:CMDER_ROOT"

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

    Add-Progress "Replaced ease of access menu with powershell. (in case of lockout)"
}

# Allow cmder, stop scoring, etc. to work lol
function Unblock-Programs {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ValidateAdminCodeSignatures" -PropertyType "DWord" -Value "0" -Force | Out-Null
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableUIADesktopToggle" -PropertyType "DWord" -Value "0" -Force | Out-Null

    Write-Output "Cmder, stop scoring, etc. fixed."
}

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
    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt" | Out-Null

    <# Add readme users to file if needed
    if ($null -eq $gooduserlist) {
        Open-Readme
        Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
        Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"
        Start-Process "$compfiles\lists\good_users.txt"
        Pause
    }#>

    $goodusers = ($gooduserlist).Trim(";")

    # Compare and get bad users
    (Compare-Object $goodusers $users_nobuiltin).foreach{
        return $_.InputObject
    }
}

# Get bad admin list
function Get-BadAdmins {
    #Write-Output "Put README users in this text file. (replace this text)" >> "$compfiles\lists\good_users.txt"
    #Write-Output "Put a semicolon at the end of each administrator." >> "$compfiles\lists\good_users.txt"

    $gooduserlist = Get-Content "$compfiles\lists\good_users.txt"
    $goodadmins = ($gooduserlist | Select-String ";" | Out-String -Stream).Trim(";")

    <# Add readme users to file if needed
    if ($null -eq $gooduserlist) {
        Open-Readme
        Start-Process "$compfiles\lists\good_users.txt"

        Pause
    }#>

    # Compare and get bad admins
    (Compare-Object $goodadmins $admins_nobuiltin).foreach{
        return $_.InputObject
    }
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

Set-EaseOfAccess
Unblock-Programs
Import-Alias