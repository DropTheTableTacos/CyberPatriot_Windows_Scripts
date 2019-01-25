@echo off

:: OS Check
set os=%pshellrun% "(get-wmiobject -class win32_operatingsystem).version"
set osname=%pshellrun% "(get-ciminstance -classname cim_operatingsystem).name"
%os% | findstr /b /i "6.1" >nul && set os=Win7 && goto setup
%os% | findstr /b /i "6.3" >nul && set os=Win8 && goto setup
%os% | findstr /b /i "6.0" >nul && set os=Server2008 && goto setup
%osname% | findstr /c:"Server 2016" >nul && set os=Server2016 && goto setup
%osname% | findstr /c:"Windows 10" >nul && set os=Win10 && goto setup

:: Setup
:setup
set automode=false
set return=false
set return_number=0
mode con: cols=100 lines=23
set desktop=%userprofile%\Desktop
set compfiles=%desktop%\%os%CompFiles
if %os% == Win10 set compfiles=%desktop%\Win10CompFiles
if %os% == Server2016 set compfiles=%desktop%\Server2016CompFiles
set scm=%compfiles%\SCMBaselines
set cmderbin=%desktop%\cmder\bin
set autousers=false
set usersbroken=false
set serv_exclude=false
set listuser=%pshellrun% "Get-LocalUser | select name, enabled"
set listadmin=%pshellrun% "Get-LocalGroupMember -group Administrators | select name"
set getservice=Get-WmiObject -class win32_service ^| select name, displayname, state, startmode, processid, installdate, pathname
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%
del /f /q C:\approved_users.txt C:\users_admins.txt C:\mediafiles.txt C:\sketchyfiles.txt C:\eek.txt C:\*files.txt C:\whomst.txt C:\sketchymemes.txt C:\userdiff.txt

cls

:: Automatic Windows Update
echo Configuring Automatic Windows Update...
echo.

sc config wuauserv start= auto
sc start wuauserv
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
echo.
echo Done!
echo.

:: Disable Services
echo Disabling Services...
echo.
echo It's okay if you lose points temporarily...
echo.

for /f %%G in (%compfiles%\services.txt) do (sc stop %%G & sc config %%G start= disabled)
sc config wuauserv start= auto & sc start wuauserv
sc config eventlog start= auto & sc start eventlog
sc config windefend start= auto & sc start windefend
sc config %serv_exclude% start= auto & sc start %serv_exclude% && goto inf

:serv_exclude_check
cls
echo.
echo Services disabled!
echo.

set /p serv_exclude="Type any service that needs to stay enabled (README) "
if %serv_exclude% == n goto inf

sc config %serv_exclude% start= auto & sc start %serv_exclude%
echo.
goto serv_exclude_check

:: Inf
echo Applying BAD Inf...
echo.
echo Wait to see what vulnerabilities you get, if any, and note them down.
echo.
echo IN THE MEANTIME, look at and think about Forensics Questions.
echo.

secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\%os%BadInf.inf"
echo.
pause

echo.
echo Applying GOOD Inf...
echo.
echo Go into group policy manually and get back points (if any) lost by good inf.
echo.

secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\%os%GoodInf.inf"
echo.
pause
echo.

:: Something