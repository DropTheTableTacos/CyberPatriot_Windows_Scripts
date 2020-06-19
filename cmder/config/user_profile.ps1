# Copy script to profile
Copy-Item "$env:userprofile\Desktop\Script\profile.ps1" "$env:systemroot\System32\WindowsPowerShell\v1.0\profile.ps1" -Force

# Run script
. $profile.AllUsersAllHosts