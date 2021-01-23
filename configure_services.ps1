# Configure services script
$services = Import-Lists services
$SDDL = "D:AR(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCLCSWLOCRRC;;;IU)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)"

($services | Where-Object State -match "Uninstall").foreach{
    Stop-Service $_.Name -ErrorAction SilentlyContinue
    Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
    Set-Service $_.Name -SecurityDescriptorSddl $SDDL
    Uninstall-Service -Name $_.Name
}

($services | Where-Object State -match "Automatic").foreach{
    Set-Service $_.Name -startuptype Automatic -ErrorAction SilentlyContinue
    Start-Service $_.Name -ErrorAction SilentlyContinue
    Set-Service $_.Name -SecurityDescriptorSddl $SDDL
}

($services | Where-Object State -match "Manual").foreach{
    Set-Service $_.Name -startuptype Manual -ErrorAction SilentlyContinue
    Start-Service $_.Name -ErrorAction SilentlyContinue
    Set-Service $_.Name -SecurityDescriptorSddl $SDDL
}

($services | Where-Object State -match "Disabled").foreach{
    Stop-Service $_.Name -ErrorAction SilentlyContinue
    Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
    Set-Service $_.Name -SecurityDescriptorSddl $SDDL
}

# Enable remote desktop if needed
if ($rd_enable) {
    $rd_services = "termservice","sessionenv"
    $rd_services.foreach{
        Set-Service $_.Name -startuptype Automatic
        Start-Service $_.Name -ErrorAction SilentlyContinue
        Set-Service $_.Name -SecurityDescriptorSddl $SDDL
    }
} else {
    $rd_services = "termservice","sessionenv"
    $rd_services.foreach{
        Stop-Service $_.Name -ErrorAction SilentlyContinue
        Set-Service $_.Name -startuptype Disabled -ErrorAction SilentlyContinue
        Set-Service $_.Name -SecurityDescriptorSddl $SDDL
    }
}