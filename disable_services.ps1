# Disable services script

# Service exclusions
while ($true) {
    Clear-Host

    $answer = Read-Host "Enter a service to exclude (use 'remote' for Remote Desktop)"

    if ($answer -eq "n") {
        break
    }

    if ($answer -eq "remote") {
        $serv_exclusions += "termservice","sessionenv"
    } else {
        $serv_exclusions += $answer
    }
}

# Disable list of services
$services = Import-SOLists services

($services | Where-Object State -match "Uninstall").foreach{
    Stop-Service $_.Name
    Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
    Uninstall-Service -Name $_.Name
}

($services | Where-Object State -match "Automatic").foreach{
    Set-Service $_.Name -startuptype Automatic -ErrorAction SilentlyContinue
    Start-Service $_.Name
}

($services | Where-Object State -match "Manual").foreach{
    Set-Service $_.Name -startuptype Manual -ErrorAction SilentlyContinue
    Start-Service $_.Name
}

($services | Where-Object State -match "Disabled").foreach{
    Stop-Service $_.Name
    Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
}

# Enable exlusions
$serv_exclusions.foreach{
    Set-Service $_.Name -startuptype Automatic
    Start-Service $_.Name
}