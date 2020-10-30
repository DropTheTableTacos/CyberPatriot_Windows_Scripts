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
    "Open-ForensicsQuestions",
    "Remove-Shares",
    "Remove-UnwantedSoftware",
    "Remove-Malware",
    "Update-Applications",
    "Remove-ProhibitedFiles",
    "Find-ProhibitedFiles",
    "Enable-Backup",
    "Set-FirewallExceptions",
    "Set-RegHivePerms",
    "Set-EventLogPerms",
    "Run-Sysinternals"
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
    "Enable-ServerBackup",
    "Start-CatLite"
)

# Check remote desktop enabled or disabled
while ($true) {
    if ((Test-Path "C:\rd_*") -eq $false) {
        $answer = Read-Host "Enable or Disable remote desktop? [e/d]"
        if ($answer -eq "e") {
            New-Item "C:\rd_enable"
            break
        }
        if ($answer -eq "d") {
            New-Item "C:\rd_disable"
            break
        } else {
            Write-Output "Type 'e' or 'd', idiot."
        }
    }
}

if ((Test-Path "C:\rd_enable") -eq $true) {
    $functions[10] = Enable-RemoteDesktop
} else {
    $functions[10] = Disable-RemoteDesktop
}

# Run the functions epic
$functions.foreach{Invoke-Expression $_}
$functions_sep.foreach{Start-Process powershell "$_"}