@echo off

:: Show Wifi Networks
echo Show dem wifis
echo.

netsh wlan show profiles

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

:menugood
cls
echo 1) README                       h) Remove programs + features
echo 2) Windows Update               i) Update programs
echo 3) Enable Firewall              j) Sysinternals
echo 4) IE SCM baselines             k)
echo 5) Services                     l) DISA Stig
echo 6) Audit Policy                 m) MMC Stuff
echo 7) Change passwords             n) Operating system settings
echo 8) Activate/Disable users       o) Nessus
echo 9) Forensics                    p) Application Settings
echo a) Media files                  q) Server Manager
echo b) Inf files                    r) Event Viewer
echo c) CIS-CAT Registry Gucci       s) Backup
echo d) Prohibited users' files      t) Readme Requirements
echo e) Add/Delete users             u) Defensive Countermeasures
echo f) Add/Delete admins            v) Random list of things at the end
echo g) Prohibited files
echo.
echo w) Generate User List
echo x) Open DankMMC
echo y) Open official checklist
echo z) Open master checklist + view vuln categories
echo.

choice /c 123456789abcdefghijklmnopqrstuvwxyz /n /m "Where would you like to start? "
goto %errorlevel%

:: README
:1
cls
echo Read the README, ya bigot higot!
echo.
start C:\CyberPatriot\README.url

pause

if %automode% == true goto 2

goto menu

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
:: gpresult command insert here ha yeet
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

:: Prohibited users' files
:bad_user_files
echo Finding possible gay files that bad users may have...
echo.

del /f /q C:\*files.txt

if %automode% == true (
	call icdiff C:\approved_users_gucci.txt C:\users.txt
	echo.
)

set /p baduser="Enter an unauthorized user's name to find their files... "
if %baduser% == n goto
echo.

echo Ok. Wait for ting to happen.
echo.
dir /s /q /a /a-d /o-d /tc C:\ | findstr /i "%computername%\%baduser%" >> C:\%baduser%files.txt

start C:\%baduser%files.txt
:badfiles
cls
echo Look through the text file to find sketchiness.
echo.
set /p eekfile="Enter the filename of any suspicious files you see... "
if %eekfile% == n goto bad_user_files

cd C:\
dir /s /q /a "%eekfile%" >> C:\whomst.txt

start C:\whomst.txt
cls
echo It probably found something OOF
echo.
pause

goto bad_user_files

:: Add/Remove Users
:adddelusers
if %automode% == true (
	call icdiff C:\approved_users_gucci.txt C:\users.txt
	echo.
)

if %automode% == false (
	%listuser%
	echo.
)

set /p choice="Add or remove user? (a/r) "
if %choice% == a goto addusers
if %choice% == r goto delusers
if %choice% == n (
	if %autochoice% == a set automode=true
	if %automode% == true goto
	goto menu
)
if %choice% == re goto menu

:addusers
cls
%listuser%

set /p user="Enter a username... "
if %user% == n goto 14
if %user% == re goto menu
net user %user% /add

goto addusers

:delusers
cls
call icdiff C:\approved_users_gucci.txt C:\users.txt
echo.

set /p user="Enter a user to delete... "
if %user% == n goto 14
if %user% == re goto menu
net user %user% /delete

goto delusers
