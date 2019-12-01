# Remove existing output file if it exists
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$ext = Import-Lists extensions | Where-Object Action -eq "Find"
$pattern = Import-Lists sensinfo_patterns

# Initial finding txt and zip files cause they most common
Clear-Host
Write-Output "Finding .zip and .txt files first..."

$cringe = "*.zip","*.txt"
$cringe.foreach{
    $files += Get-ChildItem -Path "C:\" -Filter $_ -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"
}

# Takeown and output to file
$files.foreach{
    if ((Test-Path "$_") -eq $true) {
        takeown /f $_.FullName
        icacls $_.FullName /grant ${env:USERNAME}:`(F`)
    }
}
$files.FullName >> "C:\stinky_files.txt"

Start-Process "C:\stinky_files.txt"

# Delete ones you possibly find
while ($true) {
    Clear-Host
    if ($null -ne $answer) {
        Write-Output "$answer has been deleted as hard as an Armenian in 1915."
        Write-Output "`n"
    }

    Write-Output "Found .zip and .txt files..."
    Write-Output "`n"
    $answer = Read-Host "Enter the path to a file to YEET it off the VM"

    if ($answer -eq "n") {
        break
    }

    takeown /f "$answer"
    icacls "$answer" /grant ${env:USERNAME}:`(F`)
    "$answer" >> "C:\deleted_files.txt"
    Remove-Item "$answer" -Force
}

# Find txt files matching patterns
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$txt = Get-ChildItem -Path "C:\" -Filter *.txt -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

$pattern.foreach{
    Get-Content $txt.FullName | Select-String "$_.Pattern" >> "C:\stinky_files.txt"
}

Start-Process "C:\stinky_files.txt"

# Delete ones you possibly find
while ($true) {
    Clear-Host
    if ($null -ne $answer) {
        Write-Output "$answer has been deleted as hard as an Armenian in 1915."
        Write-Output "`n"
    }

    Write-Output "Found sketchy .txt files..."
    Write-Output "`n"
    $answer = Read-Host "Enter the path to a file to YEET it off the VM"

    if ($answer -eq "n") {
        break
    }

    takeown /f "$answer"
    icacls "$answer" /grant ${env:USERNAME}:`(F`)
    "$answer" >> "C:\deleted_files.txt"
    Remove-Item "$answer" -Force
}

# Find rest of extensions
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$ext.foreach{
    # Get the files
    $files += Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

    # Takeown and output to file
    $files.foreach{
        if ((Test-Path "$_") -eq $true) {
            takeown /f $_.FullName
            icacls $_.FullName /grant ${env:USERNAME}:`(F`)
        }
    }

    $files.FullName >> "C:\stinky_files.txt"
}

Start-Process "C:\stinky_files.txt"

# Delete ones you possibly find
while ($true) {
    Clear-Host
    if ($null -ne $answer) {
        Write-Output "$answer has been deleted as hard as an Armenian in 1915."
        Write-Output "`n"
    }

    Write-Output "Found cringe files..."
    Write-Output "`n"
    $answer = Read-Host "Enter the path to a file to YEET it off the VM"

    if ($answer -eq "n") {
        break
    }

    takeown /f "$answer"
    icacls "$answer" /grant ${env:USERNAME}:`(F`)
    "$answer" >> "C:\deleted_files.txt"
    Remove-Item "$answer" -Force
}

# Find bad user owned files (doesnt work rn)
<#
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$badusers.foreach{
    $f = Get-ChildItem -Path "C:\" -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot" | Get-Acl

    if ($f.Owner -eq "$_") {
        $f.Path >> "C:\stinky_files.txt"
    }
}
#>