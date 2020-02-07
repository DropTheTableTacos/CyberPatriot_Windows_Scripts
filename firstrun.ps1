# Initial Setup Script

# Install NuGet
Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.201" -Force

# Install modules
Install-Module -Name "Carbon" -AllowClobber -Force
Install-Module -Name "PSWindowsUpdate" -AllowClobber -Force

# Set firstrun variable to true
[System.Environment]::SetEnvironmentVariable("firstrun","true",[System.EnvironmentVariableTarget]::Machine)

# Exit message
Clear-Host
Write-Output "Initial setup successful. Please restart all terminals."

Pause

Exit