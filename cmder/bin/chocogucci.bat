::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJHaK8WYiIQ1RDEnCGGqjEroSqNr+6OOIrEwRFNELXaKb6beGL+8f1mb9d5M/5ntOisIDGCdrfQCifhsnlVlLuGCKINSgsALlT1q15EI+J2Z8iGDfiTsyY51tgsZj
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
