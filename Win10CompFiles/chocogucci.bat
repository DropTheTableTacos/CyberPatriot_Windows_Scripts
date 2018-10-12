@echo off

cls
echo What up my big cheezits
echo.
echo This script is gonna install the programs with chocolatey
echo and then close so that's cool.
echo.
echo Real quick question tho...
echo.

set /p server="Is this Server 2008? (y/n) "

choco install firefox malwarebytes mbsa --ignorechecksum --force
if %server% == n choco install ie11
if %server% == y choco install ie9

start /d "%programfiles%\Malwarebytes\Anti-Malware" mbam.exe
start /d "%programfiles%\Microsoft Baseline Security Analyzer 2" mbsa.exe

exit