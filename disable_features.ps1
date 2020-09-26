# Disable optional features
$feature_list = Import-Lists features

$feature_list.foreach{
    Disable-WindowsOptionalFeature -FeatureName $_.Name -Online -NoRestart
}