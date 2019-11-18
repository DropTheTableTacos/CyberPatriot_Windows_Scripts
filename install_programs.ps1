if ((Test-Path $env:programdata\chocolatey) -eq $false) {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco feature enable -n allowGlobalConfirmation
    choco feature enable -n useFipsCompliantChecksums
}

choco install firefox ie11 malwarebytes mbsa patch-my-pc iobit-uninstaller --ignorechecksum --force