# Copy script to profile
Copy-Item "$env:userprofile\Desktop\Script\script.ps1" `
"$env:userprofile\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"

# Delete unecessary git folder
Remove-Item "$env:userprofile\Desktop\Script\.git" -Recurse -Force

# Run script
. $profile
