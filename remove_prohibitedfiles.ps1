$ext = Import-Lists extensions | Where-Object Action -eq "Delete"

Write-Output "Files that have been deleted:`n" >> "C:\deleted_files.txt"

$ext.foreach{
    # Get the files
    $files += Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Attributes !Directory+!System,Hidden | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

    # Takeown and yeet them off the VM
    $files.foreach{
        if ((Test-Path "$_") -eq $true) {
            takeown /f $_.FullName
            icacls $_.FullName /grant ${env:USERNAME}:`(F`)
        }
    }

    $files.FullName | Remove-Item -Force
    $files.FullName >> "C:\deleted_files.txt"
}

