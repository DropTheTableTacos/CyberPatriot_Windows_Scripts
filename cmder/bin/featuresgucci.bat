@echo off
cls
echo Features are going to be uninstalled here...
echo.
echo Internet explorer has been enabled.
echo.
echo Go back to the other tab and continue.
echo.

for /f %%G in (%compfiles%\features.txt) do (%pshellrun% "Disable-WindowsOptionalFeature -Online -FeatureName '%%G'")

exit
