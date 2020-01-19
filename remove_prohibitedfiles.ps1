$ext = Import-Lists extensions | Where-Object Action -eq "Delete"
$def_files = Import-Lists win10_defaultfiles
$path = "$desktop\CringeFiles"

mkdir "$path"

Write-Output "Files that have been moved:`n" >> "C:\moved_files.txt"

$ext.foreach{
    # Get the files
    $old_files += Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"
}

# Compare to default files
$files = (Compare-Object $old_files.FullName $def_files.Name).InputObject

# Takeown and output to file
$files.foreach{
    takeown /f $_.FullName
    icacls $_.FullName /grant ${env:USERNAME}:`(F`)
}

$files | Move-Item $_.FullName $path\$_.Name -Force
$files.FullName >> "C:\moved_files.txt"
