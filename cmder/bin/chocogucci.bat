@echo off

:: Set variables
cls
set ps=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%

:: OS Check
:oscheck
cls
set os=%ps% "(Get-CimInstance -ClassName CIM_OperatingSystem).Name"

%os% | findstr /c:"Server 2008" >nul && set os=Server2008 && goto install

:install
cls
echo Chocolatey will install things now...
echo.
echo Go back to the script (other tab) and continue.
echo.

choco install firefox malwarebytes mbsa --ignorechecksum --force

if %os% == Server2008 (
    choco install ie9
    goto open
)

choco install ie11 --ignorechecksum -f

:open
start /d "%programfiles%\Malwarebytes\Anti-Malware" mbam.exe
start /d "%programfiles%\Microsoft Baseline Security Analyzer 2" mbsa.exe

exit
