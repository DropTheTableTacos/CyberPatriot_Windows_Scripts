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
set automode=true
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

:: Hosts file
echo Resetting hosts file...
echo.

takeown /f "%systemroot%\system32\drivers\etc"
del "%systemroot%\system32\drivers\etc\hosts"
copy "%compfiles%\hosts" "%systemroot%\system32\drivers\etc\hosts"

echo.
echo Done!
echo.

:: IE SCM Baselines
echo Applying IE SCM Baselines...
echo.

LGPO /g "%scm%\IE11_Com_Sec"
LGPO /g "%scm%\IE11_User_Sec"

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

:: Install programs
echo Installing gucci security programs...
echo.
echo Run the "chocogucci.bat" script plz, thx.
echo.

explorer %compfiles%
pause
echo.

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

:: Audit Policy
echo Applying Audit Policy template...
echo.

LGPO /a "%compfiles%\%os%AllAudit.csv"
echo.
echo Done!
echo.

:: Generate User List
echo Generating user list...
echo.

for /f "skip=1 tokens=1" %%G in ('%pshellrun% "glu | select name | ft -hidetableheaders"') do (echo %%G >> C:\users_admins.txt)
findstr /v "BroPants BroShirt DefaultAccount defaultuser0 Administrator Guest" C:\users_admins.txt > C:\users.txt
call jrepl " +$" "" /f C:\users.txt /o -
call jrepl " +$" "" /f C:\users_admins.txt /o -

echo Please put all the users from README, including admins here and save then close > C:\approved_users.txt
echo Replace these 2 lines btw smh >> C:\approved_users.txt
start C:\approved_users.txt
pause

sort < C:\approved_users.txt > C:\approved_users_gucci.txt

echo.
type C:\users.txt
echo.
set /p usersbroken="Did the user list break? (y/n) "
if %usersbroken% == y (
	set usersbroken=true
    set automode=false
)
echo.

:: Enable Users/Disable Guest & Administrator
:enable_users
net user BroShirt /active:no
net user BroPants /active:no
echo.

if %automode% == true (
    echo Enabling all users...
    echo.
    echo Also, disabling guest and administrator accounts...
    echo.

    for /f %%G in (C:\users.txt) do net user %%G /active:yes

    echo.
    echo Done!
    echo.

    goto passwords
)

echo Enable all of the user accounts plz and thx.
echo.
echo Guest and Administrator have already been disabled.
echo.

set /p choice="Activate or disable user? (a/d) "
if %choice% == a goto activateusers
if %choice% == d goto disableusers
if %choice% == n goto passwords

:activateusers
cls
%listuser%

set /p user="Enter a user to activate... "
if %user% == n goto enable_users
net user %user% /active:yes
goto activateusers

:disableusers
cls
%listuser%

set /p user="Enter a user to disable... "
if %user% == n goto enable_users
net user %user% /active:no

goto disableusers

:: Change all passwords
:passwords
if %automode% == true (
    echo Changing all user passwords...
    echo.
    echo All passwords will be abc123ABC123@@
    echo.

    for /f %%G in (C:\users_admins.txt) do net user	%%G abc123ABC123@@

    echo.
    echo Done!
    echo.

    goto
)
