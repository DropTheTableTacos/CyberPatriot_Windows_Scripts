# Copy script to profile
Copy-Item "$env:userprofile\Desktop\Script\script.ps1" `
"$env:userprofile\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"

# Delete unecessary git folder
if ((Test-Path "$env:userprofile\Desktop\Script\.git") -eq $true) {
    Remove-Item "$env:userprofile\Desktop\Script\.git" -Recurse -Force
}

# Run script
. $profile
