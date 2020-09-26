# Copy script to profile
Copy-Item "$env:userprofile\Desktop\Script\profile.ps1" "$env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Force

# Run script
. $profile