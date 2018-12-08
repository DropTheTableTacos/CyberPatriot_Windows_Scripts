@echo off

set pshellrun=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command

:: OS Check
:oscheck
cls
set os=%pshellrun% "(get-wmiobject -class win32_operatingsystem).version"
set osname=%pshellrun% "(get-ciminstance -classname cim_operatingsystem).name"
%os% | findstr /b /i "6.1" >nul && set os=Win7
%os% | findstr /b /i "6.3" >nul && set os=Win8
%os% | findstr /b /i "6.0" >nul && set os=Server2008
%osname% | findstr /c:"Server 2016" >nul && set os=Server2016
%osname% | findstr /c:"Windows 10" >nul && set os=Win10

cls
echo What up my big cheezits
echo.
echo This script is gonna install the programs with chocolatey
echo and then close so that's cool.
echo.
pause

choco install firefox malwarebytes mbsa --ignorechecksum --force
if %os% == Server2008 choco install ie9
choco install ie11 --ignorechecksum -f

start /d "%programfiles%\Malwarebytes\Anti-Malware" mbam.exe
start /d "%programfiles%\Microsoft Baseline Security Analyzer 2" mbsa.exe

exit
