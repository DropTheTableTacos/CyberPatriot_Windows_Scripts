@echo off
cls

set ps=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command

cls
echo Features are going to be uninstalled here...
echo.
echo Internet explorer has been enabled.
echo.
echo Go back to the other tab and continue.
echo.

for /f %%G in (%compfiles%\features.txt) do (%ps% "Disable-WindowsOptionalFeature -Online -FeatureName '%%G'")

exit
