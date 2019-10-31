$feature_list = Import-SOLists features

$feature_list.foreach{
    Disable-WindowsOptionalFeature -FeatureName $_.Name -Online -NoRestart
}