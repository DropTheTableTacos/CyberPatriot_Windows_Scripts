# Copy script to profile
Copy-Item "$env:userprofile\Desktop\Script\profile.ps1" "$env:userprofile\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1"

# Run script
. $profile