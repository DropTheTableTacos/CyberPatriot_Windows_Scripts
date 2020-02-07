Install-Chocolatey

Pause

# Install tings
choco install firefox ie11 malwarebytes patch-my-pc iobit-uninstaller --ignorechecksum --force

# Install MBSA
if (Test-OSIs32Bit) {$uri = "https://download.microsoft.com/download/A/1/0/A1052D8B-DA8D-431B-8831-4E95C00D63ED/MBSASetup-x86-EN.msi"}
if (Test-OSIs64Bit) {$uri = "https://download.microsoft.com/download/A/1/0/A1052D8B-DA8D-431B-8831-4E95C00D63ED/MBSASetup-x64-EN.msi"}

Invoke-WebRequest -Uri $uri -OutFile "C:\mbsa_installer.msi"
Start-Process "C:\mbsa_installer.msi"