@echo off

:: Start Message
title ThanosScript
echo ==========================================
echo      The Ultra Gucci Windows Script
echo      Version like 35.2 or something
echo            by Jackson Kauflin
echo.
echo    This script is dedicated to Drake
echo because he make sure that north-side eat
echo ========================================
echo.
pause

:: Copy Reminder
cls
echo Make sure you've copied all of the following
echo items to the desktop as well:
echo.
echo - CompFiles folder
echo.
echo - Service Pack (if on 7 or Server 2008)
echo.
echo - OurGloriousChecklist2018_Windows.txt
echo.
pause

:: OS Check
cls
set /p os="What OS is this? (7,8,10,2008,2016) "
if %os% == 7 set os=Win7
if %os% == 8 set os=Win8
if %os% == 10 set os=Win10
if %os% == 2008 set os=Server2008
if %os% == 2016 set os=Server2016

:: Setup
set automode=false
set return=false
set return_number=0
mode con: cols=100 lines=23
set desktop=%userprofile%\Desktop
set compfiles=%desktop%\%os%CompFiles
set scm=%compfiles%\SCMBaselines
set pshellrun=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command
set autousers=false
set diffopen=false
set usersbroken=false
set listuser=%pshellrun% "Get-LocalUser | select name, enabled"
set listadmin=%pshellrun% "Get-LocalGroupMember -group Administrators | select name"
set getservice="Get-WmiObject -class win32_service | select name, displayname, state, startmode, processid, installdate, pathname"
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%programfiles%\nodejs;%appdata%\npm;%desktop%;%desktop%\cmder\bin
del /f /q C:\approved_users.txt C:\users_admins.txt C:\mediafiles.txt C:\sketchyfiles.txt C:\eek.txt C:\*files.txt C:\whomst.txt

:: Startup Task
schtasks /create /tn RunScriptOnLogin /tr %desktop%\UltraGucciScript.bat /sc onlogon /rl highest /f

:: Ask if first time setup
cls
set /p cont="Is this first time setup? (y/n) "
if %cont% == n goto menu

:: Install initial things
cls
echo Installing initial things...
echo.
%pshellrun% "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

choco feature enable -n allowGlobalConfirmation
choco feature enable -n useFipsCompliantChecksums

sc config wuauserv start= auto
sc start wuauserv
choco install nodejs --ignorechecksum
call npm install -g diffchecker
if %os% == Win7 (
	choco install dotnet4.5 powershell --ignorechecksum
	cls
	echo Yeah, so you HAVE to restart the VM here for things to work.
	echo.
	echo Thanks, powershell.
	echo.
	pause
	exit
)

if %os% == Win8 (
	choco install powershell --ignorechecksum
	cls
	echo Yeah, so you HAVE to restart the VM here for things to work.
	echo.
	echo Thanks, powershell.
	echo.
	pause
	exit
)

if %os% == Server2008 (
	choco install dotnet4.5 powershell --ignorechecksum
	cls
	echo Yeah, so you HAVE to restart the VM here for things to work.
	echo.
	echo Thanks, powershell.
	echo.
	pause
	exit
)

:: Menu
:menu
cls
echo Menu is for quick stuff ya need to do, Auto mode is main option
echo.
echo Note: Auto mode will still take you to menu, you just choose where to start.
echo.
set /p autochoice="Menu or auto mode? (m/a) "

if %autochoice% == a (
	set automode=true
	goto menugood
)
if %autochoice% == m (
	set automode=false
	goto menugood
)
else (
	cls
	echo That's not an option, ya gaylord!
	echo.
	pause
	goto menu
)

:menugood
cls
echo 1) README                       h) Update programs
echo 2) Windows Update               i) Sysinternals
echo 3) Enable Firewall              j) SCM baselines
echo 4) Services                     k) DISA Stig
echo 5) Install programs             l) MMC Stuff
echo 6) Audit Policy                 m) Operating system settings
echo 7) Change passwords             n) Nessus
echo 8) Activate/Disable users       o) Application Settings
echo 9) Forensics                    p) Server Manager
echo a) Media files                  q) Event Viewer
echo b) Inf files                    r) Backup
echo c) CIS-CAT Registry Gucci       s) Readme Requirements
echo d) Prohibited users' files      t) Defensive Countermeasures
echo e) Add/Delete users             u) Prohibited files
echo f) Add/Delete admins            v) Random list of things at the end
echo g) Remove programs + features
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
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Read the README, ya bigot higot!
echo.
start C:\CyberPatriot\README.url

pause

if %automode% == true goto 2

goto menu

:: Windows Update
:2
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %automode% == true (
	cls
	sc config wuauserv start= auto
	if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
	sc start wuauserv
	if %errorlevel% == 1 echo. && echo Uh oh. Error happened.

	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f

	cls
	echo Set automatic updates!
	echo Still gotta start it manually oof
	echo.
    if %os% == Win7 start wuapp.exe
    if %os% == Win8 start wuapp.exe
    if %os% == Server2008 start wuapp.exe
    if %os% == Win10 start ms-settings:windowsupdate
    if %os% == Server2016 start ms-settings:windowsupdate
	pause

	goto 3
)

cls
echo Set automatic updates.
echo.
if %os% == Win7 start wuapp.exe
if %os% == Win8 start wuapp.exe
if %os% == Server2008 start wuapp.exe
if %os% == Win10 start ms-settings:windowsupdate
if %os% == Server2016 start ms-settings:windowsupdate
pause

goto menu

:: Enable firewall + template
:3
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
netsh advfirewall import "%compfiles%\%os%Firewall.wfw"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
netsh advfirewall set allprofiles state on
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo Firewall enabled!
echo.
pause
cls
echo Check firewall exceptions for sketchiness...
echo.
firewall.cpl
pause

if %automode% == true goto 4

goto menu

:: Services
:4
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
if %automode% == true (
	for /f %%G in (%compfiles%\services.txt) do (sc stop %%G)
	for /f %%G in (%compfiles%\services.txt) do (sc config %%G start= disabled)
	sc config wuauserv start= auto
	sc start wuauserv
	sc config eventlog start= auto
	sc start eventlog
	sc config windefend start= auto
	sc start windefend
	cls
	set /p remotegay="Does Remote Desktop need to be enabled? (y/n) "
 	if remotegay == y (
		sc config termservice start= auto
		sc start termservice
		sc config sessionenv start= auto
		sc start sessionenv
	)
	goto 5
)

echo tlntsvr (Telnet)
echo msftpsvc (FTP)
echo snmptrap (SNMP Trap)
echo ssdpsrv (SSDP Discovery)
echo termservice, sessionenv (Remote Desktop Services) *Dont disable these if remote desktop is needed*
echo remoteregistry (Remote Registry)
echo Messenger (Windows Messenger)
echo upnphos (Universal Plug n Play)
echo WAS (Web server Service)
echo RemoteAccess (Routing and Remote Access)
echo mnmsrvc (NetMeeting Remote Desktop Sharing)
echo NetTcpPortSharing (Net.Tcp Port Sharing Service)
echo RasMan (Access for dial-up and VPN)
echo TabletInputService (Tablet crap)
echo RpcSs (Remote Procedure Call)
echo SENS (System Event Notification Service)
echo EventSystem (COM+ Event System)
echo XblAuthManager, XblGameSave, XboxGipSvc, xboxgip, xbgm (Xbox services)
echo SysMain (Superfetch)
echo EventLog (Event Log duh)
echo W3SVC (World Wide Web Publishing)
echo.

set /p choice="Enable or Disable Service? (e/d/def) "

if %choice% == e goto enableserv
if %choice% == d goto disablegud
if %choice% == n goto manualserv
if %choice% == re goto menu
if %choice% == def (
	for /f %%G in (%compfiles%\services.txt) do (sc stop %%G)
	for /f %%G in (%compfiles%\services.txt) do (sc config %%G start= disabled)
	sc config wuauserv start= auto
	sc start wuauserv
	sc config eventlog start= auto
	sc start eventlog
	sc config windefend start= auto
	sc start windefend
	goto 4
)

:enableserv
cls
echo tlntsvr (Telnet)
echo msftpsvc (FTP)
echo snmptrap (SNMP Trap)
echo ssdpsrv (SSDP Discovery)
echo termservice, sessionenv (Remote Desktop Services) *Dont disable these if remote desktop is needed*
echo remoteregistry (Remote Registry)
echo Messenger (Windows Messenger)
echo upnphos (Universal Plug n Play)
echo WAS (Web server Service)
echo RemoteAccess (Routing and Remote Access)
echo mnmsrvc (NetMeeting Remote Desktop Sharing)
echo NetTcpPortSharing (Net.Tcp Port Sharing Service)
echo RasMan (Access for dial-up and VPN)
echo TabletInputService (Tablet crap)
echo RpcSs (Remote Procedure Call)
echo SENS (System Event Notification Service)
echo EventSystem (COM+ Event System)
echo XblAuthManager, XblGameSave, XboxGipSvc, xboxgip, xbgm (Xbox services)
echo SysMain (Superfetch)
echo EventLog (Event Log duh)
echo W3SVC (World Wide Web Publishing)
echo.

set /p serv="Enter a service to enable... "
if %serv% == n goto 4
if %serv% == re goto menu

sc config %serv% start= auto
sc start %serv%

goto enableserv

:disablegud
cls
echo tlntsvr (Telnet)
echo msftpsvc (FTP)
echo snmptrap (SNMP Trap)
echo ssdpsrv (SSDP Discovery)
echo termservice, sessionenv (Remote Desktop Services) *Dont disable these if remote desktop is needed*
echo remoteregistry (Remote Registry)
echo Messenger (Windows Messenger)
echo upnphos (Universal Plug n Play)
echo WAS (Web server Service)
echo RemoteAccess (Routing and Remote Access)
echo mnmsrvc (NetMeeting Remote Desktop Sharing)
echo NetTcpPortSharing (Net.Tcp Port Sharing Service)
echo RasMan (Access for dial-up and VPN)
echo TabletInputService (Tablet crap)
echo RpcSs (Remote Procedure Call)
echo SENS (System Event Notification Service)
echo EventSystem (COM+ Event System)
echo XblAuthManager, XblGameSave, XboxGipSvc, xboxgip, xbgm (Xbox services)
echo SysMain (Superfetch)
echo EventLog (Event Log duh)
echo W3SVC (World Wide Web Publishing)
echo.

set /p serv="Enter a service to disable... "
if %serv% == n goto 4
if %serv% == re goto menu

sc stop %serv%
sc config %serv% start= disabled

goto disablegud


:: Manual serv gucci
:manualserv
set default=powershell "%getservice%"
set running=powershell "%getservice% | ? state -match 'Running'"
set automatic=powershell "%getservice% | ? startmode -match 'Auto'"
set disabled=powershell "%getservice% | ? startmode -match 'Disabled'"
set stopped=powershell "%getservice% | ? state -match 'Stopped'"
set manual=powershell "%getservice% | ? startmode -match 'Manual'"
set nonsystem=powershell "%getservice% | findstr /v svchost.exe"

del /q /f "%userprofile%\Desktop\services.txt"
set output=false

cls
echo Here is a script to display services.
echo.
echo Select a filter...
echo.
echo 1) Default
echo 2) Running
echo 3) Automatic
echo 4) Disabled
echo 5) Stopped
echo 6) Manual
echo 7) Non-system (not svchost.exe)
echo.

choice /c 1234567 /n /m "> "
goto %errorlevel%a

:: Ask if display in cmd window or text file
:outputask
cls
set /p output="Display output in cmd window or output to text file? (c/t) "

goto %return%a

:: Default
:1a
if %output% == c (
	%default% | more
	goto manualserv
)

if %output% == t (
	%default% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=1
	goto outputask
)

:: Running
:2a
if %output% == c (
	%running% | more
	goto manualserv
)

if %output% == t (
	%running% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=2
	goto outputask
)

:: Automatic
:3a
if %output% == c (
	%automatic% | more
	goto manualserv
)

if %output% == t (
	%automatic% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=3
	goto outputask
)

:: Disabled
:4a
if %output% == c (
	%disabled% | more
	goto manualserv
)

if %output% == t (
	%disabled% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=4
	goto outputask
)

:: Stopped
:5a
if %output% == c (
	%stopped% | more
	goto manualserv
)

if %output% == t (
	%stopped% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=5
	goto outputask
)

:: Manual
:6a
if %output% == c (
	%manual% | more
	goto manualserv
)

if %output% == t (
	%manual% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=6
	goto outputask
)

:: Non-system
:7a
if %output% == c (
	%nonsystem% | more
	goto manualserv
)

if %output% == t (
	%nonsystem% >> %userprofile%\Desktop\services.txt
	cls
	echo Outputted to %userprofile%\Desktop\services.txt
	echo.
	pause
	goto manualserv
)

else (
	set return=7
	goto outputask
)

:: Install programs
:5
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo What up my big cheezits
echo.
echo Run the chocogucci.bat script to install good programs.
echo.
cd "%compfiles%"
explorer .
pause

if %automode% == true goto 6

goto menu

:: Audit Policy
:6
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
if %automode% == true (
    LGPO /a "%compfiles%\%os%AllAudit.csv"
    goto 7
)

set /p inf="No or All Auditing? (no/a) "
if %inf% == a goto allaudit
if %inf% == no goto noaudit
if %inf% == re goto menu
if %inf% == n goto menu
else (
    cls
    echo Oof try again.
    echo.
    pause
    goto 6
)

:allaudit
cls
LGPO /a "%compfiles%\%os%AllAudit.csv"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo All Auditing template done!
echo.
echo Wait and see if you got points...
echo.
pause

goto 6

:noaudit
cls
LGPO /a "%compfiles%\%os%NoAudit.csv"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo No Auditing template done!
echo.
echo Wait and see if you got points...
echo.
pause

goto 6

:: Change passwords
:7
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %automode% == true (
	if %autousers% == false (
		set return=true
		set return_number=9
		goto getuserlist
	)
	cls
	for /f %%G in (C:\users_admins.txt) do net user	%%G abc123ABC123@@
	cls
	echo Changing all passwords done!
	echo.
	echo Note: All passwords are abc123ABC123@@
	echo.
	pause
	goto 8
)

cls
%listuser%

echo All users' passwords will be abc123ABC123@@
echo.

set /p user="Enter user for password change... "
if %user% == n goto menu
if %user% == re goto menu
net user %user% abc123ABC123@@

goto 7

:: Activate/Disable Users
:8
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %automode% == true (
	if %autousers% == false (
		set return=true
		set return_number=8
		goto getuserlist
	)
	cls
	net user BroShirt /active:no
	net user BroPants /active:no
	for /f %%G in (C:\users.txt) do net user %%G /active:yes
	cls
	echo Activate users done!
	echo.
	pause
	goto 9
)

net user BroShirt /active:no
net user BroPants /active:no

cls
%listuser%

echo Enable all accounts. Guest account has been disabled.
echo.

set /p choice="Activate or disable user? (a/d) "
if %choice% == a goto activateusers
if %choice% == d goto disableusers
if %choice% == n goto menu
if %choice% == re goto menu

:activateusers
cls
%listuser%

set /p user="Enter a user to activate... "
if %user% == n goto 8
if %user% == re goto menu
net user %user% /active:yes
goto activateusers

:disableusers
cls
%listuser%

set /p user="Enter a user to disable... "
if %user% == n goto 8
if %user% == re goto menu
net user %user% /active:no

goto disableusers

:: Forensics
:9
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Do the forensics questions. Eek.
echo.
pause

if %automode% == true goto 10

goto menu

:: Media Files
:10
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %automode% == true goto deletemf

cls
set /p choice="Search for or "delete" media files? (s/d) "
if %choice% == s goto searchmf
if %choice% == d goto deletemf
if %choice% == n goto menu
if %choice% == re goto menu

:deletemf
cls
echo THIS IS ABOUT TO DELETE MEDIA FILES.
echo.
echo Make sure you did the forensics questions
echo.
echo *cough* timon *cough*
echo.
pause
cls
echo Note: "Couldn't find mediafiles.txt" is expected here.
echo.

del "%homedrive%\mediafiles.txt" /f /q

cd C:\
del /s /f /q *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma

cls
echo Media files deleted.
echo.
echo Now check for ones missed. Wait for dis.
echo.

cd %homedrive%\
dir /s /a /b /o-d *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma *.wav >> mediafiles.txt

start mediafiles.txt

pause

if %automode% == true goto 11

goto 10

:searchmf
cls
echo Note: "Couldn't find mediafiles.txt" is expected here.
echo.
echo Searching for media files...
echo.

del "%homedrive%\mediafiles.txt" /f /q

cd %homedrive%\
dir /s /a /b /o-d *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma *.wav >> mediafiles.txt

start mediafiles.txt

pause

if %automode% == true goto 11

goto 10

:: Inf files
:11
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
if %automode% == true (
    secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\%os%BadInf.inf"
    cls
    echo Bad INF done!
    echo.
    echo Wait and see if you got any points...
    echo.
    pause

    secedit /configure /db "%systemroot%\dankdatabase1.db" /cfg "%compfiles%\%os%GoodInf.inf"

    goto 12
)

set /p inf="Good or Bad Inf? (g/b) "
if %inf% == g goto goodinf
if %inf% == b goto badinf
if %inf% == re goto menu
if %inf% == n goto menu
else (
    cls
    echo Oof try again.
    echo.
    pause
    goto 11
)

:goodinf
cls
secedit /configure /db "%systemroot%\dankdatabase1.db" /cfg "%compfiles%\%os%GoodInf.inf"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo Good INF Done!
echo.
echo Check the scoring report and copy/paste the vulnerabilities into notepad.
echo.
pause

goto 11

:badinf
cls
secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\%os%BadInf.inf"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo Bad Inf Done!
echo.
echo Check the scoring report and copy/paste the vulnerabilities into notepad.
echo.
pause

goto 11

:: CISCAT Registry Gucci
:12
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Alrighty, run the ciscatgucci.bat script
echo.
echo that's inside the compfiles folder plz thanks.
echo.
echo WAIT for points before continuing!
echo.
cd "%compfiles%"
explorer .
pause

if %automode% == true goto catlite

goto menu

:: CAT-Lite
cls
echo Running CAT-Lite scanner...
echo.
echo Give report to Timon when done.
echo.
start /d "%compfiles%\cis-cat-lite" CISCAT.jar
pause

goto 13

:: Prohibited users' files
:13
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

del /f /q C:\*files.txt

if %automode% == true (
	if %autousers% == false (
		set return=true
		set return_number=13
		goto getuserlist
	)

	if %diffopen% == false (
		cls
		call diffchecker C:\approved_users_gucci.txt C:\users.txt
		set diffopen=true
	)
)

cls
set /p baduser="Enter an unauthorized user's name to find their files... "
if %baduser% == n goto 14

cls
echo Ok. Wait for ting to happen.
echo.
dir /s /q /ar /ah /a-d /o-d /tc C:\ | findstr /i "%computername%\%baduser%" >> C:\%baduser%files.txt

start C:\%baduser%files.txt
:badfiles
cls
echo Look through the text file to find sketchiness.
echo.
set /p eekfile="Enter the filename of any suspicious files you see... "
if %eekfile% == n goto 13

cd C:\
dir /s /q /ar /ah "%eekfile%" >> C:\whomst.txt

start C:\whomst.txt
cls
echo It probably found something OOF
echo.
pause

goto badfiles

:: Add/Delete Users
:14
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %automode% == true (
	if %autousers% == false (
		set return=true
		set return_number=14
		goto getuserlist
	)

	if %diffopen% == false (
		cls
		call diffchecker C:\approved_users_gucci.txt C:\users.txt
		set diffopen=true
	)
)

cls
%listuser%

set /p choice="Add or remove user? (a/r) "
if %choice% == a goto addusers
if %choice% == r goto delusers
if %choice% == n (
	if %autochoice% == a set automode=true
	if %automode% == true goto 15
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
%listuser%

set /p user="Enter a user to delete... "
if %user% == n goto 14
if %user% == re goto menu
net user %user% /delete

goto delusers

:: Deleting/adding admins
:15
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
%listadmin%

set /p choice="Add or remove admin? (a/r) "

if %choice% == a goto addadmins
if %choice% == r goto deladmins
if %choice% == n (
	if %automode% == true goto 16
	goto menu
)
if %choice% == re goto menu

:addadmins
cls
%listuser%
net localgroup administrators

set /p user="Enter a user to add to admin group... "
if %user% == n goto 15
if %user% == re goto menu
net localgroup administrators %user% /add

goto addadmins

:deladmins
cls
%listadmin%

set /p user="Enter a user to remove from admin group... "
if %user% == n goto 15
if %user% == re goto menu
net localgroup administrators %user% /delete

goto deladmins

:: Remove Programs + Features
:16
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Removing programs + features...
echo.
echo Attempt to remove archives (plain text n stuff too)
echo.
echo .zip, .exe, .msi, .txt, .bad, .bru
echo.
echo Wait for a scan here...
cd %homedrive%\
dir /s /a /b /o-d *.zip *.exe *.msi *.txt *.bad *.bru >> sketchyfiles.txt
start sketchyfiles.txt
pause

cls
echo Uninstall programs
echo.
start appwiz.cpl
pause

cls
echo Remove features
echo.
pause

cls
echo Remove folders in Program Files
echo.
echo Make sure to check hidden folders
echo.
cd "%programfiles%"
explorer .
pause

cls
echo Generally just find all the malware, yo
echo.
pause

if %automode% == true goto 17
goto menu

:: Update programs
:17
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Update all programs you need to.
echo.
echo This includes firefox, internet explorer, etc.
echo.
pause

if %automode% == true goto 18

goto menu

:: Sysinternals
:18
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls Installing Sysinternals...
echo.
choco install sysinternals

cls
echo Opening TCPView, Process Explorer, and Autoruns...
echo.
echo Make sure to delete the file itself, not just the process
echo.
procexp
autoruns
tcpview
pause

if %automode% == true goto 19

goto menu

:: SCM Baselines
:19
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
if %os% == Win7 (
	LGPO /g "%scm%"
	goto finishscm
)

if %os% == Win8 (
	LGPO /g "%scm%"
	goto finishscm
)

if %os% == Server2008 (
	LGPO /g "%scm%"
	goto finishscm
)

if %os% == Server2016 (
	set ver=1607
	goto server2016scm
)

if %os% == Win10 goto newscm

:newscm
cls
winver
set /p ver="Enter the version of windows 10 this is... "
if %ver% == n (
	if %automode% == true goto 20
	goto menu
)
if %ver% == re goto menu

if %ver% == 1507 (
	LGPO /g "%scm%\Win10_1507"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

if %ver% == 1511 (
	LGPO /g "%scm%\Win10_1511"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

:server2016scm
if %ver% == 1607 (
	LGPO /g "%scm%\Win10_1607_Server2016"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

if %ver% == 1703 (
	LGPO /g "%scm%\Win10_1703"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

if %ver% == 1709 (
	LGPO /g "%scm%\Win10_1709"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

if %ver% == 1803 (
	LGPO /g "%scm%\Win10_1803"
	LGPO /g "%scm%\IE11_Com_Sec"
	LGPO /g "%scm%\IE11_User_Sec"
	goto finishscm
)

else (
	cls
	echo Oof try again.
	echo.
	pause
	goto newscm
)

:finishscm
cls
echo SCM Baselines done!
echo.
echo Now wait for possible points.
echo.
pause

if %automode% == true goto 20

goto menu

:: DISA Stig
:20
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %os% == Win10 (
	if %automode% == true goto 21
	cls
	echo Windows 10 doesn't have a DISA Stig.
	echo.
	echo This is so sad, Alexa play Alan Walker - Faded
	echo.
	pause
	goto menu
)

if %os% == Server2016 (
	if %automode% == true goto 21
	cls
	echo Server 2016 doesn't have a DISA Stig.
	echo.
	echo This is so sad, Alexa play Alan Walker - Faded
	echo.
	pause
	goto menu
)

cls
secedit /configure /db "%systemroot%\dankdatabase3.db" /cfg "%compfiles%\%os%DISAStig.inf"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo DISA Stig Done!
echo.
echo Check the scoring report and copy/paste the vulnerabilities into notepad.
echo.

pause

if %automode% == true goto 21

goto menu

:: MMC Stuff
:21
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

:sharestart
cls
net share
echo.
set /p share="Choose a share to delete cause it sketchy... "
if %share% == n goto mmccont
if %share% == re goto menu
net share %share% /del
goto sharestart

:mmccont
cls
echo Check locked users/other user stuff
echo.
if %automode% == true start compmgmt.msc
pause

cls
echo Enable Windows Defender
echo.
if %automode% == true start gpedit.msc
pause

cls
echo Enable Smartscreen (doesn't apply to Server 2008)
echo.
pause

cls
echo Disable autoplay
echo.
pause

if %automode% == true goto 22

goto menu

:: Operating System Settings
:22
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo IF YOU'RE ON A SERVER OS, focus on this a little more.
echo.
echo Enable screen saver + check "logon on resume"
echo.
control desktop
pause

takeown /f "%systemroot%\system32\drivers\etc"
del "%systemroot%\system32\drivers\etc\hosts"
copy "%compfiles%\hosts" "%systemroot%\system32\drivers\etc\hosts"
cls
echo Oof it just did the hosts file so cool.
echo.
pause

cls
echo Check file permissions for danko folders
echo.
pause

cls
echo Disable remote desktop
echo.
start sysdm.cpl
pause

cls
echo Check action center (doesn't apply to Server 2008)
start wscui.cpl
echo.
pause

cls
echo Enable UAC
echo.
pause

if %os% == Win10 (
	cls
	echo What up it's ya boi cat-lite scanner here. imma scan and be cool.
	echo.
	start /d "%compfiles%\cis-cat-lite" CISCAT.jar
	pause
)

if %automode% == true goto 23

goto menu

:: Nessus
:23
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
ipconfig
echo.

echo Run the Nessus immediately cause it might help and stuff yooo!
echo.

pause

if %automode% == true goto 24

goto menu

:: Application Settings
:24
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo IF YOU'RE ON A SERVER OS, focus on this a little more.
echo.
echo Set all dem application security settings.
echo.
echo Firefox:
echo	- Warn when try to install addons
echo	- Popup blocker
echo	- other crap
echo.
echo See if there are security settings for other programs.
echo Use the interwebs to your advantage.
echo.

start firefox.exe

pause

if %automode% == true goto 25

goto menu

:: Server Manager
:25
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

if %os% == Server2008 goto servmgr
if %os% == Server2016 goto servmgr
if %os% == Win7 goto noserv
if %os% == Win8 goto noserv
if %os% == Win10 goto noserv

:servmgr
reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" /v "AllowRemoteShellAccess" /t reg_dword /d "1" /f

cls
echo Do all the things for Server Manager:
echo.
echo - Enable Powershell and Backup
echo - Enable Firewall
echo - Remove Roles + Features
echo - IE Enhanced Security Configuration
echo.

start /d "%SystemRoot%\system32" CompMgmtLauncher.exe
pause

if %automode% == true goto 26
goto menu

:noserv
if %automode% == true goto 26
cls
echo Oof no server manager here. Y'all bad.
echo.
pause
goto menu

:: Event Viewer
:26
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Look at the Event Viewer for stuff that's BAD
echo.
start eventvwr.msc
pause

if %automode% == true goto 27

goto menu

:: Backup
:27
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Real quick connect the drive to the VM (make sure it USB 2.0)
echo.
pause

cls
set /p location="Enter the drive letter for the backup location... "

wbadmin enable backup -addtarget:%location%: -include:C: -schedule:03:00 -quiet

if %automode% == true goto 28

goto menu

:: README Requirements
:28
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Open the readme and do the specific things it says to do.
echo Could be enabling service, adding user/group, etc.
echo.

pause

if %automode% == true goto 29

goto menu

:: Defensive Countermeasures
:29
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Make sure windows defender is danko enabled
echo.
pause

cls
echo Make sure you have the security programs installed
echo.
pause

cls
echo Scan on all those programs
echo.
pause

if %automode% == true goto 30

goto menu

:: Prohibited files
:30
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Yaboi prohibited files.
echo.
echo - Look for xml, txt, etc. in notepad that will open in a second.
echo.
echo - Look in folders for files (sort by date modified)
echo.

cd %homedrive%\
dir /s /a /b /o-d >> eek.txt
start eek.txt

pause

if %automode% == true goto 31

goto menu

:: Random Things At The End
:31
if %usersbroken% == true set automode=false
if %usersbroken% == false (
	if %autochoice% == a set automode=true
	if %autochoice% == m set automode=false
)

cls
echo Check processes for sketchiness.
echo.
start taskmgr.exe
start firefox.exe www.processlibrary.com
pause

cls
echo Vulns from other images
echo.
pause

cls
echo Go through every single step again (extreme thorough-ness not super necessary)
echo.
pause

cls
echo Past comp vulns (Make Peter or someone read them)
echo.
pause

cls
echo Go through everthing AGAIN MY MAN
echo.
pause

cls
echo Official checklist
echo.
if %os% == Win7 start /d "%compfiles%" OfficialWin7Checklist.pdf
if %os% == Win8 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Win10 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Server2008 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Server2016 start /d "%compfiles%" Official%os%Checklist.docx
pause

if %automode% == true goto end

goto menu

:: End
:end
echo If you reached this screen, you did a good. Maybe. Idk man.
echo.
echo Sending you back to the menu now...
echo.

pause

set automode=false
goto menu

:: Generate User List
:32
:getuserlist
if %usersbroken% == n (
	set autousers=true
	goto %return_number%
)

cls
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

cls
start C:\users.txt
set /p usersbroken="Did the user list break? (y/n) "
if %usersbroken% == y (
	set usersbroken=true
	if %return% == true goto %return_number%
	goto menu
)

set autousers=true
if %return% == true goto %return_number%
goto menu

:: Open DankMMC
:33
start /d "%compfiles%" DankMMC.msc
goto menu

:: Open official checklist
:34
if %os% == Win7 start /d "%compfiles%" Official%os%Checklist.pdf
if %os% == Win8 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Win10 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Server2008 start /d "%compfiles%" Official%os%Checklist.docx
if %os% == Server2016 start /d "%compfiles%" Official%os%Checklist.docx
goto menu

:: Open master checklist + vuln categories
:35
start /d "%desktop%" OurGloriousChecklist2018_Windows.txt
cls
echo Here are the vulnerability categories:
echo.
echo User Auditing
echo Account Policies
echo Local Policies
echo Defensive Countermeasures
echo Operating System Settings
echo Service Auditing
echo Operating System Updates
echo Application Updates
echo Policy Violation: Prohibited Files
echo Policy Violation: Unwanted Software
echo Policy Violation: Malware
echo Application Security Settings
echo.
pause
goto menu
