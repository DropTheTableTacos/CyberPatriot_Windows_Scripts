# Remove existing output file if it exists
Remove-Item "C:\stinky_files.txt" -Force -ErrorAction SilentlyContinue | Out-Null

$ext = Import-SOLists extensions | Where-Object Action -eq "Find"
$pattern = Import-SOLists sensinfo_patterns

# Initial finding zip files cause they most common
$zip = Get-ChildItem -Path "C:\" -Filter *.zip -Recurse -Attributes !Directory+!System | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

# Takeown and output to file
$zip.foreach{
    takeown /f $_.FullName
    icacls $_.FullName /grant ${env:USERNAME}:`(F`)
}
$zip.FullName >> "C:\stinky_files.txt"

Start-Process "C:\stinky_files.txt"

while ($true) {
    Clear-Host
    if ($null -ne $answer) {
        Write-Output "$answer has been deleted as hard as an Armenian in 1915."
        Write-Output "`n"
    }

    $answer = Read-Host "Enter the path to a file to YEET it off the VM"

    if ($answer -eq "n") {
        break
    }

    takeown /f "$answer"
    icacls "$answer" /grant ${env:USERNAME}:`(F`)
    Remove-Item "$answer" -Force
}

$ext.foreach{
    # Get the files
    $files = Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Attributes !Directory+!System | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

    # Takeown and output to file
    $files.foreach{
        takeown /f $_.FullName
        icacls $_.FullName /grant ${env:USERNAME}:`(F`)
    }

    $files.FullName >> "C:\stinky_files.txt"

    # Find patterns in files
	$pattern.foreach{
		if ((Get-Content $files.FullName | Select-String -Pattern "$_.Pattern") -eq $true) {
            $_.FullName >> "C:\stinky_files.txt"
        }
	}
}

$badusers.foreach{
    $f = Get-ChildItem C:\* -Recurse -Force | Get-Acl

    if ($f.Owner -eq "$_") {
        $f.Path >> "C:\stinky_files.txt"
    }
}

Start-Process "C:\stinky_files.txt"

while ($true) {
    Clear-Host
    if ($null -ne $answer) {
        Write-Output "$answer has been deleted as hard as an Armenian in 1915."
        Write-Output "`n"
    }

    $answer = Read-Host "Enter the path to a file to YEET it off the VM"

    if ($answer -eq "n") {
        break
    }

    takeown /f "$answer"
    icacls "$answer" /grant ${env:USERNAME}:`(F`)
    Remove-Item "$answer" -Force
}