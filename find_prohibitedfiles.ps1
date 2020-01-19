# Remove existing output file if it exists
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$ext = Import-Lists extensions | Where-Object Action -eq "Find"
$def_files = Import-Lists win10_defaultfiles
$pattern = Import-Lists sensinfo_patterns

# Initial finding txt and zip files cause they most common
Clear-Host
Write-Output "Finding common file types first..."

$cringe = "*.zip","*.txt","*.tar.gz"
$cringe.foreach{
    $old_files += Get-ChildItem -Path "C:\" -Filter $_ -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"
}

# Compare to default files
$files = (Compare-Object $old_files.FullName $def_files.Name).InputObject

# Takeown and output to file
$files.foreach{
    takeown /f $_.FullName
    icacls $_.FullName /grant ${env:USERNAME}:`(F`)
}
$files.FullName >> "C:\stinky_files.txt"

Start-Process "C:\stinky_files.txt"

# Find rest of extensions
Write-Output "Finding rest of extensions..."

$old_files = $null
$files = $null

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
$files.FullName >> "C:\stinky_files.txt"

Start-Process "C:\stinky_files.txt"

<#
# Find txt files matching patterns

$txt = Get-ChildItem -Path "C:\" -Filter *.txt -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

Write-Output "Finding patterns in txt files..."
$pattern.foreach{
    Get-Content $txt.FullName | Select-String "$_.Pattern" >> "C:\stinky_files.txt"
}

Start-Process "C:\stinky_files.txt"

# Find bad user owned files (doesnt work rn)
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$badusers.foreach{
    $f = Get-ChildItem -Path "C:\" -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot" | Get-Acl

    if ($f.Owner -eq "$_") {
        $f.Path >> "C:\stinky_files.txt"
    }
}
#>