$ext = Import-Lists extensions | Where-Object Action -eq "Delete"

$ext.foreach{
    # Get the files
    $files += Get-ChildItem -Path "C:\" -Filter $_.Name -Recurse -Attributes !Directory+!System | Where-Object FullName -notmatch "C:\\Users\\$env:USERNAME\\Desktop\\Script" | Where-Object FullName -notmatch "C:\\CyberPatriot"

    # Takeown and yeet them off the VM
    $files.foreach{
        takeown /f $_.FullName
        icacls $_.FullName /grant ${env:USERNAME}:`(F`)
    }

    Write-Output "Files that have been deleted:"
    Write-Output "`n"
    $files.FullName >> "C:\deleted_files.txt"

    $files.FullName | Remove-Item -Force
}