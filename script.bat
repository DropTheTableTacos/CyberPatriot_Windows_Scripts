@echo off

:: Start Message
title ThanosScript
echo ========================================
echo      The Ultra Gucci Windows Script
echo      Version like 35.2 or something
echo            by Jackson Kauflin
echo.
echo    This script is dedicated to Drake
echo because he make sure that north-side eat
echo ========================================
echo.
pause

:: Set pshellrun
set pshellrun=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command

:: Set up useful logon message initially
cls
net user %username% abc123ABC123@@

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticecaption /t REG_SZ /d "Username: %username%" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticetext /t REG_SZ /d "Password: abc123ABC123@@" /f

:: Set execution policy for powershell
cls
%pshellrun% "set-executionpolicy -executionpolicy RemoteSigned -scope LocalMachine"
%pshellrun% "set-executionpolicy -executionpolicy Restricted -scope CurrentUser"

:: OS Check
:oscheck
cls
set os=%pshellrun% "(get-wmiobject -class win32_operatingsystem).version"
set osname=%pshellrun% "(get-ciminstance -classname cim_operatingsystem).name"
%os% | findstr /b /i "6.1" >nul && set os=Win7&& goto setup
%os% | findstr /b /i "6.3" >nul && set os=Win8&& goto setup
%os% | findstr /b /i "6.0" >nul && set os=Server2008&& goto setup
%osname% | findstr /c:"Server 2016" >nul && set os=Server2016&& goto setup
%osname% | findstr /c:"Windows 10" >nul && set os=Win10&& goto setup

:: Setup
:setup
set sickomode=true
set return=false
set return_number=0
mode con: cols=100 lines=23
set desktop=%userprofile%\Desktop
set compfiles=%desktop%\Windows
set scm=%compfiles%\scmbaselines
set cmderbin=%compfiles%\cmder\bin
set autousers=false
set usersbroken=false
set listuser=%pshellrun% "Get-LocalUser | select name, enabled"
set listadmin=%pshellrun% "Get-LocalGroupMember -group Administrators | select name"
set getservice=Get-WmiObject -class win32_service ^| select name, displayname, state, startmode, processid, installdate, pathname
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%

del /f /q C:\approved_users.txt C:\users_admins.txt C:\mediafiles.txt C:\sketchyfiles.txt C:\eek.txt C:\*files.txt C:\whomst.txt C:\sketchymemes.txt C:\userdiff.txt

:: sickomode Check
cls
echo Hint: Auto is hetero and manual is not. nuff said.
echo.
set /p autochoice="Sicko mode or manual mode? (a/m) "
if %autochoice% == a set sickomode=true

:: Menu
:menu
cls
echo 1) README                    i) Disable features
echo 2) Windows Update            j) Remove programs
echo 3) Enable Firewall           k) Forensics
echo 4) Hosts file                l) Media files
echo 5) SCM baselines             m) Operating system settings
echo 6) CIS-CAT Registry Gucci    n) Update programs
echo 7) Services                  o) Prohibited files
echo 8) Install Programs          p) Sysinternals
echo 9) Inf files                 q) (Only Win10) Cat-Lite
echo a) Audit Policy              r) MMC Stuff
echo b) Nessus                    s) Application Settings
echo c) Activate/Disable users    t) Server Manager
echo d) Change passwords          u) Event Viewer
echo e) Prohibited users' files   v) Backup
echo f) Add/Delete users          w) Defensive Countermeasures
echo g) Add/Delete admins         x) Random list of things at the end
echo h) Readme Requirements
echo.
echo y) Generate User List
echo z) Open DankMMC
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

if %sickomode% == true goto 2

goto menu

:: Windows Update
:2
if %sickomode% == true (
	cls
	sc config wuauserv start= auto
	if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
	sc start wuauserv
	if %errorlevel% == 1 echo. && echo Uh oh. Error happened.

	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f

	cls
	echo Start Windows Update...
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
echo Start Windows Update...
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
cls
netsh advfirewall import "%compfiles%\firewall_templates\%os%Firewall.wfw"
netsh advfirewall set allprofiles state on
cls
echo Firewall enabled!
echo.
echo Don't worry if the template broke, it aint that important.
echo.

if %sickomode% == true goto 4

goto menu

:: Hosts file
:4
echo Resetting hosts file...
echo.

takeown /f "%systemroot%\system32\drivers\etc"
del "%systemroot%\system32\drivers\etc\hosts"
copy "%compfiles%\hosts" "%systemroot%\system32\drivers\etc\hosts"

echo.
echo Done!
echo.

:: SCM Baselines
:5
cls

LGPO /g "%scm%\IE11_Com_Sec"
LGPO /g "%scm%\IE11_User_Sec"

if %os% == Server2008 (
	LGPO /g "%scm%\IE9_User_Sec"
	LGPO /g "%scm%\IE9_Com_Sec"
)

if %os% == Server2016 (
	set ver=1607
	goto server2016scm
)

if %os% == Win10 goto newscm

LGPO /g "%scm%\%os%"

goto finishscm

:newscm
cls
set ver=%pshellrun% "(get-wmiobject -class win32_operatingsystem).version"

if %ver% == 10.0.10240 (
	LGPO /g "%scm%\Win10_1507"
	goto finishscm
)

if %ver% == 10.0.10586 (
	LGPO /g "%scm%\Win10_1511"
	goto finishscm
)

:server2016scm
if %ver% == 10.0.14393 (
	LGPO /g "%scm%\Win10_1607_Server2016"
	goto finishscm
)

if %ver% == 10.0.15063 (
	LGPO /g "%scm%\Win10_1703"
	goto finishscm
)

if %ver% == 10.0.16299 (
	LGPO /g "%scm%\Win10_1709"
	goto finishscm
)

if %ver% == 10.0.17134 (
	LGPO /g "%scm%\Win10_1803"
	goto finishscm
)

:finishscm
cls
echo SCM Baselines done!
echo.
echo Now wait for possible points.
echo.
pause

if %sickomode% == true goto 6

goto menu

:: CISCAT Registry Gucci
:6
cls
echo Alrighty, ciscat gucci script will run now...
echo.
call ciscatgucci.bat

if %sickomode% == true goto 7

:: Services
:7
cls
goto servicestart
if %sickomode% == true (
    :servicestart
	for /f %%G in (%compfiles%\services.txt) do (sc stop %%G & sc config %%G start= disabled)
	sc config wuauserv start= auto & sc start wuauserv
	sc config eventlog start= auto & sc start eventlog
	sc config windefend start= auto & sc start windefend
    sc config wscsvc start= auto & sc start wscsvc

	:excludeserv
	cls
	echo Services disabled!
	echo.
	echo Note: Use "remote" for Remote Desktop below
	echo.
	set /p excludeserv="Type in any service that needs to stay enabled... "
 	if %excludeserv% == n goto 8
	if %excludeserv% == remote (
		sc config termservice start= auto & sc start termservice
		sc config sessionenv start= auto & sc start sessionenv
		goto excludeserv
	)
	sc config %excludeserv% start= auto & sc start %excludeserv%
	goto excludeserv
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
	goto 7
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
if %serv% == n goto 7
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
if %serv% == n goto 7
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
echo 8) Exit
echo.

choice /c 12345678 /n /m "> "
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
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
	start %userprofile%\Desktop\services.txt
	pause
	goto manualserv
)

else (
	set return=7
	goto outputask
)

:: Exit
:8a
goto menu

:: Install programs
:8
cls
choco >nul && %pshellrun% "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

choco feature enable -n allowGlobalConfirmation
choco feature enable -n useFipsCompliantChecksums

cls
echo Choco gucci script is gonna install programs now...
echo.
start chocogucci.bat

if %sickomode% == true goto 9

goto menu

:: Inf files
:9
cls
if %sickomode% == true (
    secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\infs\%os%BadInf.inf"
    cls
    echo Bad INF template applied!
    echo.
    echo Wait and see if you got any vulnerabilities from it...
	echo.
	echo MEANWHILE, look at Forensics Questions.
    echo.
    pause

    secedit /configure /db "%systemroot%\dankdatabase1.db" /cfg "%compfiles%\infs\%os%GoodInf.inf"

	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticecaption /t REG_SZ /d "Username: %username%" /f
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticetext /t REG_SZ /d "Password: abc123ABC123@@" /f

    goto 10
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
    goto 9
)

:goodinf
cls
secedit /configure /db "%systemroot%\dankdatabase1.db" /cfg "%compfiles%\infs\%os%GoodInf.inf"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo Good INF Done!
echo.
echo Check the scoring report and copy/paste the vulnerabilities into notepad.
echo.
pause

goto 9

:badinf
cls
secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\infs\%os%BadInf.inf"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo Bad Inf Done!
echo.
echo Check the scoring report and copy/paste the vulnerabilities into notepad.
echo.
pause

goto 9

:: Audit Policy
:10
cls
if %sickomode% == true (
    LGPO /a "%compfiles%\audit_templates\%os%NoAudit.csv"
	cls
    echo Bad audit template applied!
    echo.
    echo Wait and see if you got any vulnerabilities from it...
	echo.
	echo MEANWHILE, look at Forensics Questions.
    echo.
    pause

    LGPO /a "%compfiles%\audit_templates\%os%AllAudit.csv"

    goto 11
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
    goto 10
)

:allaudit
cls
LGPO /a "%compfiles%\audit_templates\%os%AllAudit.csv"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo All Auditing template done!
echo.
echo Wait and see if you got points...
echo.
pause

goto 10

:noaudit
cls
LGPO /a "%compfiles%\audit_templates\%os%NoAudit.csv"
if %errorlevel% == 1 echo. && echo Uh oh. Error happened.
cls
echo No Auditing template done!
echo.
echo Wait and see if you got points...
echo.
pause

goto 11

:: Nessus
:11
cls
ipconfig
echo.

echo Run the Nessus immediately cause it might help and stuff yooo!
echo.
echo If you're not Jackson, don't worry 'bout it. ooof.
echo.

pause

if %sickomode% == true goto 12

goto menu

:: Activate/Disable Users
:12
if %usersbroken% == true set sickomode=false
if %usersbroken% == false (
	if %autochoice% == a set sickomode=true
	if %autochoice% == m set sickomode=false
)

if %sickomode% == true (
	if %autousers% == false (
		set return=true
		set return_number=12
		goto getuserlist
	)
	cls
	net user BroShirt /active:no
	net user BroPants /active:no
	for /f %%G in (C:\users.txt) do net user %%G /active:yes
	cls
	echo Activated users done!
	echo.
	echo Guest and Admin accounts have been disabled, so yeet.
	echo.
	goto 13
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
if %user% == n goto 12
if %user% == re goto menu
net user %user% /active:yes
goto activateusers

:disableusers
cls
%listuser%

set /p user="Enter a user to disable... "
if %user% == n goto 12
if %user% == re goto menu
net user %user% /active:no

goto disableusers

:: Change passwords
:13
if %usersbroken% == true set sickomode=false
if %usersbroken% == false (
	if %autochoice% == a set sickomode=true
	if %autochoice% == m set sickomode=false
)

if %sickomode% == true (
	if %autousers% == false (
		set return=true
		set return_number=13
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
	goto 14
)

cls
%listuser%

echo All users' passwords will be abc123ABC123@@
echo.

set /p user="Enter user for password change... "
if %user% == n goto menu
if %user% == re goto menu
net user %user% abc123ABC123@@

goto 13

:: Prohibited users' files
:14
if %usersbroken% == true set sickomode=false
if %usersbroken% == false (
	if %autochoice% == a set sickomode=true
	if %autochoice% == m set sickomode=false
)

del /f /q C:\*files.txt

if %sickomode% == true (
	if %autousers% == false (
		set return=true
		set return_number=14
		goto getuserlist
	)

	call icdiff C:\approved_users_gucci.txt C:\users.txt
	echo.
)

if %sickomode% == false (
	cls
	net user
	echo.
)

set /p baduser="Enter an unauthorized user's name to find their files... "
if %baduser% == n goto 15

cls
echo Ok. Wait for ting to happen.
echo.
dir /s /q /a /a-d /o-d /tc C:\ | findstr /i "%computername%\%baduser%" >> C:\%baduser%files.txt

start C:\%baduser%files.txt
:badfiles
cls
echo Look through the text file to find sketchiness.
echo.
set /p eekfile="Enter the filename of any suspicious files you see... "
if %eekfile% == n goto 14

cd C:\
dir /s /q /a "%eekfile%" >> C:\whomst.txt

start C:\whomst.txt
cls
echo It probably found something OOF
echo.
pause

goto badfiles

:: Add/Delete Users
:15
if %usersbroken% == true set sickomode=false
if %usersbroken% == false (
	if %autochoice% == a set sickomode=true
	if %autochoice% == m set sickomode=false
)

if %sickomode% == true (
	if %autousers% == false (
		set return=true
		set return_number=15
		goto getuserlist
	)

	call icdiff C:\approved_users_gucci.txt C:\users.txt
	echo.
)

if %sickomode% == false (
	cls
	%listuser%
)

set /p choice="Add or remove user? (a/r) "
if %choice% == a goto addusers
if %choice% == r goto delusers
if %choice% == n (
	if %autochoice% == a set sickomode=true
	if %sickomode% == true goto 16
	goto menu
)
if %choice% == re goto menu

:addusers
cls
%listuser%

set /p user="Enter a username... "
if %user% == n goto 15
if %user% == re goto menu
net user %user% /add

goto addusers

:delusers
cls
call icdiff C:\approved_users_gucci.txt C:\users.txt
echo.

set /p user="Enter a user to delete... "
if %user% == n goto 15
if %user% == re goto menu
net user %user% /delete

goto delusers

:: Deleting/adding admins
:16
cls
%listadmin%

set /p choice="Add or remove admin? (a/r) "

if %choice% == a goto addadmins
if %choice% == r goto deladmins
if %choice% == n (
	if %sickomode% == true goto 17
	goto menu
)
if %choice% == re goto menu

:addadmins
cls
%listuser%
net localgroup administrators

set /p user="Enter a user to add to admin group... "
if %user% == n goto 16
if %user% == re goto menu
net localgroup administrators %user% /add

goto addadmins

:deladmins
cls
%listadmin%

set /p user="Enter a user to remove from admin group... "
if %user% == n goto 16
if %user% == re goto menu
net localgroup administrators %user% /delete

goto deladmins

:: README Requirements
:17
cls
echo Open the readme and do the specific things it says to do.
echo Could be enabling service, adding user/group, etc.
echo.

pause

if %sickomode% == true goto 18

goto menu

:: Enable/disable features
:18
%pshellrun% "Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all"
%pshellrun% "Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x64' -all"

cls
if %sickomode% == true (
	for /f %%G in (%compfiles%\features.txt) do (%pshellrun% "Disable-WindowsOptionalFeature -Online -FeatureName '%%G'")
	goto 19
)

echo Disable features that are not lit.
echo.
echo Internet explorer has been enabled :ok_hand:
echo.
appwiz.cpl
pause

goto menu

:: Remove Programs
:19
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
echo Open the sketchy programs and see if you can
echo.
echo find anything archive-related, idk...
echo.
pause

cls
echo Uninstall programs
echo.
start appwiz.cpl
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

if %sickomode% == true goto 20
goto menu

:: Forensics
:20
cls
echo Do the forensics questions. Eek.
echo.
pause

if %sickomode% == true goto 21

goto menu

:: Media Files
:21
if %sickomode% == true goto deletemf

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
echo Note: "Could not find mediafiles.txt" is expected here.
echo.

del "%homedrive%\mediafiles.txt" /f /q

cd C:\
del /s /f /q *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma

cls
echo Media files deleted.
echo.
echo Now check for any .wav files possibly missed. Wait a moment...
echo.

cd %homedrive%\
dir /s /a /b /o-d *.wav >> mediafiles.txt

start mediafiles.txt

pause

if %sickomode% == true goto 22

goto 21

:searchmf
cls
echo Note: "Could not find mediafiles.txt" is expected here.
echo.
echo Searching for media files...
echo.

del "%homedrive%\mediafiles.txt" /f /q

cd %homedrive%\
dir /s /a /b /o-d *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma *.wav >> mediafiles.txt

start mediafiles.txt

pause

if %sickomode% == true goto 22

goto 21

:: Operating System Settings
:22
cls
net share
echo.
echo The default, acceptable shares are:
echo.
echo C$, ADMIN$, IPC$
echo.
set /p share="Choose a share to delete cause it sketchy... "
if %share% == n goto oscont
if %share% == re goto menu
net share %share% /del
goto 22

:oscont
cls
echo Enable screen saver + check "logon on resume"
echo.
control desktop
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

cls
echo Check AppLocker policies
echo.
echo Security Settings, Application Control Policies
echo.
start gpedit.msc
pause

if %sickomode% == true goto 23

goto menu

:: Update programs
:23
cls
echo Update all programs you need to.
echo.
echo This includes firefox, internet explorer, etc.
echo.
echo Just download the installers from the websites n stuff.
echo.
pause

cls
echo **IMPORTANT**
echo.
echo Check if the programs have auto-update features
echo.
echo and enable em, gamer
echo.
pause

if %sickomode% == true goto 24

goto menu

:: Prohibited files
:24
cls
echo Yaboi prohibited files is a thing now.
echo.

:: Search for sketchy strings
::echo Looking for Hashcat logs...
::echo.
::for /f %%G in ('dir /s /b /a /o-d /a-d C:\*') do (type %%G | findstr /i "Initializing hashcat" >nul && echo %%G)
::pause

::cls
::echo Looking for Ophcrack logs...
::echo.
::for /f %%G in ('dir /s /b /a /o-d /a-d C:\*') do (type %%G | findstr /i "Starting ophcrack" >nul && echo %%G)
::pause

::cls
::echo Looking for Aircrack-ng logs...
::for /f %%G in ('dir /s /b /a /o-d /a-d C:\*') do (type %%G | findstr /i "Aircrack-ng" >nul && echo %%G)
::pause

::cls
::echo Looking for Nmap logs...
::for /f %%G in ('dir /s /b /a /o-d /a-d C:\*') do (type %%G | findstr /i "nmap" >nul && echo %%G)
::pause

::cls
::echo Looking for Angry ip logs...
::for /f %%G in ('dir /s /b /a /o-d /a-d C:\*') do (type %%G | findstr /i "Angry IP" >nul && echo %%G)
::pause

cls
echo Looking for software archive-ish things...
dir /s /a /b /o-d /a-d C:\*.bin C:\*.index C:\*.start C:\*.bad C:\*.bru C:\*.zip C:\*.txt >> C:\sketchymemes.txt
start C:\sketchymemes.txt
pause

cls
echo Find files or something idk.
echo.
echo Probably just return to this later after more important
echo.
echo things are done. smh.
echo.
cd %homedrive%\
dir /s /a /b /o-d >> eek.txt
start eek.txt

pause

if %sickomode% == true goto 25

goto menu

:: Sysinternals
:25
cls
echo Opening TCPView, Process Explorer, and Autoruns...
echo.
echo Make sure to delete the file itself, not just the process
echo.
procexp
autoruns
tcpview
pause

if %sickomode% == true goto 26

goto menu

:: CAT-Lite
:26
if %os% == Win10 (
	cls
	echo Running CAT-Lite scanner...
	echo.
	echo After it's done, copy the report to a flash drive.
	echo.
	echo By default, it saves it in Documents or something.
	echo.
	start /d "%cmderbin%\cis-cat-lite" CISCAT.jar
	pause

	if %sickomode% == true goto 27

	goto menu
)
if %sickomode% == true goto 27

cls
echo Sorry man. This OS can't use Cat-Lite.
echo.
pause

goto menu

:: MMC Stuff
:27
cls
echo Check locked users/other user stuff
echo.
if %sickomode% == true start compmgmt.msc
pause

cls
echo Enable Windows Defender
echo.
if %sickomode% == true start gpedit.msc
pause

cls
echo Enable Smartscreen (doesn't apply to Server 2008)
echo.
pause

cls
echo Disable autoplay
echo.
pause

if %sickomode% == true goto 28

goto menu

:: Application Settings
:28
cls
echo Set all dem application security settings.
echo.
echo Firefox:
echo 	- Warn when try to install addons
echo	- Popup blocker
echo	- flash disabled, idk
echo	- other crap
echo.
echo Internet Explorer:
echo	- Trusted sites
echo	- Internet zone level
echo	- privacy tab
echo.
echo See if there are security settings for other programs.
echo Use the interwebs to your advantage.
echo.

start firefox.exe
start iexplore.exe

pause

if %sickomode% == true goto 29

goto menu

:: Server Manager
:29
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

if %sickomode% == true goto 30
goto menu

:noserv
if %sickomode% == true goto 30
cls
echo Oof no server manager here. Y'all bad.
echo.
pause
goto menu

:: Event Viewer
:30
cls
echo Look at the Event Viewer for stuff that's BAD
echo.
start eventvwr.msc
pause

if %sickomode% == true goto 31

goto menu

:: Backup
:31
cls
echo Real quick connect the drive to the VM (make sure it USB 2.0)
echo.
pause

cls
set /p location="Enter the drive letter for the backup location... "

wbadmin enable backup -addtarget:%location%: -include:C: -schedule:03:00 -quiet

if %sickomode% == true goto 32

goto menu

:: Defensive Countermeasures
:32
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

if %sickomode% == true goto 33

goto menu

:: Random Things At The End
:33
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
echo Past competition vulnerabilities packet
echo.
echo NOTE: QUITE IMPORTANT MY DUDES!
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

if %sickomode% == true goto end

goto menu

:: End
:end
echo If you reached this screen, you did a good.
echo.
echo You got that bread! That's legit epic.
echo.
echo Sending you back to the menu now...
echo.

pause

set sickomode=false
goto menu

:: Generate User List
:34
choco list -l | findstr /i "powershell" && goto getuserlist
if %os% == Win7 (
	choco install powershell dotnet4.5
	cls
	echo Yeah, so you HAVE to restart the VM here
	echo so that automatic users work. :shrug:
	echo.
	echo Feelsbadman.
	echo.
	pause
	exit
)

if %os% == Win8 (
	choco install powershell dotnet4.5
	cls
	echo Yeah, so you HAVE to restart the VM here
	echo so that automatic users work. :shrug:
	echo.
	echo Feelsbadman.
	echo.
	pause
	exit
)

if %os% == Server2008 (
	choco install powershell dotnet4.5
	cls
	echo Yeah, so you HAVE to restart the VM here
	echo so that automatic users work. :shrug:
	echo.
	echo Feelsbadman.
	echo.
	pause
	exit
)

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
type C:\users.txt
echo.
set /p usersbroken="Did the user list break? (y/n) "
cls
if %usersbroken% == y (
	set usersbroken=true
	if %return% == true goto %return_number%
	goto menu
)

set autousers=true
if %return% == true goto %return_number%
goto menu

:: Open DankMMC
:35
start /d "%cmderbin%" DankMMC.msc
goto menu
