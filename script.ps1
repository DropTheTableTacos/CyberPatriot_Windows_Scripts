# ----------------------------------------------------------------
#            CyberPatriot Windows PowerShell MEGAScript
#                        by Jackson Kauflin
#
#                  This is the SCRIPT, which runs
#                      every single function.
# ----------------------------------------------------------------

# Put functions in array
$functions = $(
    "Open-Readme",
    "Apply-GPO",
    "Remove-Users",
    "Remove-Admins",
    "Set-Passwords",
    "Enable-Firewall",
    "Set-PasswordExpiration",
    "Disable-BuiltInUsers",
    "Enable-AllAuthorizedUsers",
    "Remove-BadUserFolders",
    "rd placeholder 10",
    "Clear-HostsFile",
    "Set-FirefoxConfig",
    "Enable-IE",
    "Remove-AppLockerPolicies",
    "Set-UACHigh",
    "Open-ForensicsQuestions"
)

# Functions that need to be run in seperate shell
$functions_sep = $(
    "Start-WindowsUpdate",
    "Disable-OptionalFeatures",
    "Install-Malwarebytes",
    "Install-MBSA",
    "Install-IOBitUninstaller",
    "Install-IOBitUnlocker",
    "Disable-Services",
    "Enable-Services",
    "Start-CatLite"
)

# Functions part to (to run after functions_sep)
$functions_pt2 = $(
    "Remove-Shares",
    "Remove-UnwantedSoftware",
    "Remove-Malware",
    "Update-Applications",
    "Remove-ProhibitedFiles",
    "Find-ProhibitedFiles",
    "Enable-Backup",
    "Enable-ServerBackup",
    "Set-FirewallExceptions",
    "Set-RegHivePerms",
    "Set-EventLogPerms",
    "Run-Sysinternals"
)

# Check remote desktop enabled or disabled
if ((Test-Path "C:\rd_*") -eq $false) {
    while ($true) {
        $answer = Read-Host "Enable or Disable remote desktop? [e/d]"
        if ($answer -eq "e") {
            New-Item "C:\rd_enable" | Out-Null
            $functions[10] = Enable-RemoteDesktop
            break
        }
        if ($answer -eq "d") {
            New-Item "C:\rd_disable" | Out-Null
            $functions[10] = Disable-RemoteDesktop
            break
        } else {
            Write-Output "Type 'e' or 'd', idiot."
        }
    }
}

# Check user list or no
if ((Test-Path "C:\ulist_*") -eq $false) {
    while ($true) {
        $answer = Read-Host "Create the user list? [y/n]"
        if ($answer -eq "y") {
            New-Item "C:\ulist_yes" | Out-Null
            break
        }
        if ($answer -eq "n") {
            New-Item "C:\ulist_no" | Out-Null
            break
        } else {
            Write-Output "Type 'y' or 'n', idiot."
        }
    }
}

# Run the functions epic
$functions.foreach{Invoke-Expression $_}
$functions_sep.foreach{Start-Process powershell "$_"}
$functions_pt2.foreach{Invoke-Expression $_}