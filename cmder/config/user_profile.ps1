Copy-Item "$env:userprofile\Desktop\Script\script.ps1" `
"$env:userprofile\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"

. $profile
