$feature_list = Import-Lists features

$feature_list.foreach{
    if (Get-WindowsOptionalFeature -Online -FeatureName $_ | Where-Object State -notmatch "Disable") {Disable-WindowsOptionalFeature -FeatureName $_.Name -Online -NoRestart}
}