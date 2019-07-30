@echo off
cls

:: Set variables
:setup
mode con: cols=80 lines=22
set ps=@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command
set os=%ps% "(Get-CimInstance -ClassName CIM_OperatingSystem).Name"
set desktop=%userprofile%\Desktop
set compfiles=%desktop%\Windows
set scm=%compfiles%\scmbaselines
set cmderbin=%compfiles%\cmder\bin
set autousers=false
set getservice=%ps% "Get-WmiObject -Class Win32_Service | select Name, DisplayName, State, StartMode, ProcessId, InstallDate, PathName"
set listadmin=%ps% "Get-LocalGroupMember -Group Administrators | select Name"
set listuser=%ps% "Get-LocalUser | select Name, Enabled"
set ver=%ps% "(Get-WmiObject -Class Win32_OperatingSystem).Version"
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%

:: Delete leftover text files
cd C:\
del /f /q approved_users.txt users_admins.txt mediafiles.txt sketchyfiles.txt eek.txt *files.txt whomst.txt sketchymemes.txt userdiff.txt

:: Change our password
net user %username% abc123ABC123@@

:: Set logon message to username and password for helpfulness
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticecaption /t REG_SZ /d "Username: %username%" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticetext /t REG_SZ /d "Password: abc123ABC123@@" /f

:: Set execution policy for powershell
%ps% "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine"
%ps% "Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser"

:: OS Check
:oscheck
%os% | findstr /c:"Windows 7" >nul && set os=Win7 && goto setup
%os% | findstr /c:"Windows 8.1" >nul && set os=Win8 && goto setup
%os% | findstr /c:"Server 2008" >nul && set os=Server2008 && goto setup
%os% | findstr /c:"Server 2016" >nul && set os=Server2016 && goto setup
%os% | findstr /c:"Windows 10" >nul && set os=Win10 && goto setup

:: Return to user stuff check
cls

set /p return="Returning after powershell install restart? "
if %return% == y goto getuserlist

:: README
:1
cls

echo Read the README stoopid
echo.

start C:\CyberPatriot\README.url
pause

echo README read.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Windows Update
:2
cls

:: Enable & start update service automatically
sc config wuauserv start= auto
sc start wuauserv

:: Enable automatic updates
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 4 /f

echo.
echo Windows Automatic Update configured!
echo.
echo Now start the update biggie.
echo.

:: Checking which gui to open
if %os% == Win10 (start ms-settings:windowsupdate & goto 2a)
if %os% == Server2016 (start ms-settings:windowsupdate & goto 2a)
start wuapp.exe

:2a
pause

echo Windows automatic update configured and started.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Firewall + template
:3
cls

:: Import template
netsh advfirewall import "%compfiles%\firewall_templates\%os%Firewall.wfw"

:: Enable firewall
netsh advfirewall set allprofiles state on

echo Firewall enabled and template applied.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Hosts file
:4
cls

:: Replace hosts file with clean version
takeown /f "%systemroot%\system32\drivers\etc"
del "%systemroot%\system32\drivers\etc\hosts"
copy "%compfiles%\hosts" "%systemroot%\system32\drivers\etc\hosts"

echo Hosts file replaced.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Firefox config
:5
cls

:: Copy files for 64-bit
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\override.ini" "%programfiles%\Mozilla Firefox\browser\"
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\mozilla.cfg" "%programfiles%\Mozilla Firefox\"
if exist "%programfiles%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\local-settings.js" "%programfiles%\Mozilla Firefox\defaults\pref"

:: Copy files for 32-bit
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\override.ini" "%ProgramFiles(x86)%\Mozilla Firefox\browser\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\mozilla.cfg" "%ProgramFiles(x86)%\Mozilla Firefox\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%compfiles%\firefox_config\local-settings.js" "%ProgramFiles(x86)%\Mozilla Firefox\defaults\pref"

echo Firefox config settings copied.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: SCM Baselines
:6
cls

:: Internet Explorer baselines
LGPO /g "%scm%\IE11_Com_Sec"
LGPO /g "%scm%\IE11_User_Sec"

if %os% == Server2008 (
	LGPO /g "%scm%\IE9_User_Sec"
	LGPO /g "%scm%\IE9_Com_Sec"
)

:: Operating system baselines
if %os% == Win10 (
	%ver% | findstr "10.0.10240" && LGPO /g "%scm%\Win10_1507" && goto 6a
	%ver% | findstr "10.0.10586" && LGPO /g "%scm%\Win10_1511" && goto 6a
	%ver% | findstr "10.0.14393" && LGPO /g "%scm%\Win10_1607_Server2016" && goto 6a
	%ver% | findstr "10.0.15063" && LGPO /g "%scm%\Win10_1703" && goto 6a
	%ver% | findstr "10.0.16299" && LGPO /g "%scm%\Win10_1709" && goto 6a
	%ver% | findstr "10.0.17134" && LGPO /g "%scm%\Win10_1803" && goto 6a
)

if %os% == Server2016 (
	LGPO /g "%scm%\Win10_1607_Server2016"
	goto 6a
)

LGPO /g "%scm%\%os%"

:6a
echo SCM Baselines applied. (IE and OS)>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: CISCAT Registry Gucci
:7
cls

:: Apply all the things
call ciscatgucci.bat

echo Registry settings from CISCAT set.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Services
:8
cls

:: Auto disable bad services + exclusions
for /f %%G in (%compfiles%\services.txt) do (sc stop %%G & sc config %%G start= disabled)

:: Enable good services
sc config wuauserv start= auto & sc start wuauserv
sc config eventlog start= auto & sc start eventlog
sc config windefend start= auto & sc start windefend
sc config wscsvc start= auto & sc start wscsvc

echo Bad services stopped and disabled.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Exclusions (stay enabled)
:excludeserv
cls

echo Note: Use "remote" for Remote Desktop below
echo.

set /p excludeserv="Type in any service that needs to stay enabled... "

if %excludeserv% == n goto 9
if %excludeserv% == remote (
	sc config termservice start= auto & sc start termservice
	sc config sessionenv start= auto & sc start sessionenv
	goto excludeserv
)
sc config %excludeserv% start= auto & sc start %excludeserv%
goto excludeserv

:: Install programs
:9
cls

:: Check if chocolatey installed, if not, install
choco >nul && %ps% "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

choco feature enable -n allowGlobalConfirmation
choco feature enable -n useFipsCompliantChecksums

echo.
echo Choco gucci script is gonna install programs now...
echo.
start chocogucci.bat
pause

echo Security programs installed.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Inf files
:10
cls
::secedit /configure /db "%systemroot%\dankdatabase2.db" /cfg "%compfiles%\infs\%os%BadInf.inf"

:: Apply good inf
secedit /configure /db "%systemroot%\dankdatabase1.db" /cfg "%compfiles%\infs\%os%GoodInf.inf"

echo Good INF applied.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Re-change logon message
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticecaption /t REG_SZ /d "Username: %username%" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v legalnoticetext /t REG_SZ /d "Password: abc123ABC123@@" /f

:: Audit Policy
:11
cls

LGPO /a "%compfiles%\audit_templates\%os%AllAudit.csv"

echo Audit policy template applied.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Generate User List
choco list -l >nul | findstr /i "powershell" && goto getuserlist

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
cls

echo Generating user list...
echo.
for /f "skip=1 tokens=1" %%G in ('%ps% "glu | select name | ft -hidetableheaders"') do (echo %%G >> C:\users_admins.txt)
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
echo Let's hope the user list isn't broken
echo.
pause

:: Change passwords
:12
cls

for /f %%G in (C:\users_admins.txt) do (net user %%G abc123ABC123@@)

echo All user passwords changed. (abc123ABC123@@)>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Activate/Disable Users
:13
cls

:: Disable built-in accounts
net user BroShirt /active:no
net user BroPants /active:no

for /f %%G in (C:\users.txt) do (net user %%G /active:yes)

echo Disabled built-in users, enabled all others.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Add/Delete Users
:14
cls

call icdiff C:\approved_users_gucci.txt C:\users.txt

echo.
set /p choice="Add or remove user? (a/r) "
if %choice% == a (goto addusers)
if %choice% == r (goto delusers)
if %choice% == n (
	echo Users added/deleted.>> %desktop%\progress.txt
	echo.>> %desktop%\progress.txt
	goto 15
)

:addusers
cls
%listuser%

set /p user="Enter a username... "
if %user% == n (goto 14)
net user %user% /add

goto addusers

:delusers
cls

call icdiff C:\approved_users_gucci.txt C:\users.txt

echo.
set /p user="Enter a user to delete... "
if %user% == n (goto 14)
net user %user% /delete

goto delusers

:: Deleting/adding admins
:15
cls
%listadmin%

set /p choice="Add or remove admin? (a/r) "
if %choice% == a goto addadmins
if %choice% == r goto deladmins
if %choice% == n (
	echo Admins removed/added.>> %desktop%\progress.txt
	echo.>> %desktop%\progress.txt
	goto 16
)

:addadmins
cls
%listuser%

net localgroup administrators

set /p user="Enter a user to add to admin group... "
if %user% == n (goto 15)
net localgroup administrators %user% /add

goto addadmins

:deladmins
cls
%listadmin%

set /p user="Enter a user to remove from admin group... "
if %user% == n (goto 15)
net localgroup administrators %user% /delete

goto deladmins

:: Enable/disable features
:16
cls

:: Enabling Internet Explorer
%ps% "Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-x86' -all"
%ps% "Enable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -all"

:: Disable features
start featuresgucci.bat

echo Lame features disabled and IE enabled.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Nessus
:17
cls
ipconfig | findstr /i "IPv4 Address."

echo.
echo If Nessus is installed on your host PC, run it
echo.
echo If not, it's really not a big deal at all, tbh.
echo.
pause

echo Nessus scan run.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Remove Programs
:18
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

echo Bad programs and *possibly* archives removed.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Forensics
:19
cls

echo Do the forensics questions. Eek.
echo.
pause

echo Forensics questions attempted to be answered.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Media Files
:20
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
del /s /f /q /a *.mp3 *.mp4 *.avi *.wmv *.mid *.mov *.m4v *.3gp *.wma

echo.
echo Media files deleted.
echo.
echo Now check for any .wav files possibly missed. Wait a moment...
echo.

cd %homedrive%\
dir /s /a /b /o-d *.wav >> mediafiles.txt

start mediafiles.txt

pause

echo Media files deleted.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Operating System Settings
:21
cls

net share
echo.
echo The default, acceptable shares are:
echo.
echo C$, ADMIN$, IPC$
echo.
set /p share="Choose a share to delete cause it sketchy... "
if %share% == n goto oscont
net share %share% /del
goto 21

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

:: Update programs
:22
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

:: Prohibited files
:23
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

:: Prohibited users' files
:24
del /f /q C:\*files.txt

call icdiff C:\approved_users_gucci.txt C:\users.txt

echo.
echo Enter an unauthorized username to
set /p baduser="find their leftover files... "
if %baduser% == n (
	echo Prohibited user leftover files maybe found.>> %desktop%\progress.txt
	echo.>> %desktop%\progress.txt
	goto 25
)

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
if %eekfile% == n (goto 24)

cd C:\
dir /s /q /a "%eekfile%" >> C:\whomst.txt

start C:\whomst.txt
cls
echo It probably found something OOF
echo.
pause

goto badfiles

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

echo Sysinternals used to find malware and sketchiness.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

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

	echo CAT-Lite scanner run.>> %desktop%\progress.txt
	echo.>> %desktop%\progress.txt

	goto 27
)

:: MMC Stuff
:27
cls
echo Check locked users/other user stuff
echo.
compmgmt.msc
pause

echo Checked for locked users.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

cls
echo Enable Windows Defender
echo.
start gpedit.msc
pause

echo Enabled windows defender.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

cls
echo Enable Smartscreen (doesn't apply to Server 2008)
echo.
pause

echo Enabled smartscreen.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

cls
echo Disable autoplay
echo.
pause

echo Disabled autoplay.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

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

echo Set some security settings for firefox and IE.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

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

echo Server manager stuff done. (IE Enhanced Security Config, enable backup, whatevs)>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:noserv
goto 30

:: Event Viewer
:30
cls
echo Look at the Event Viewer for stuff that's BAD
echo.
start eventvwr.msc
pause

echo Event Viewer checked out.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

:: Backup
:31
cls
echo Real quick connect the drive to the VM (make sure it USB 2.0)
echo.
pause

cls
set /p location="Enter the drive letter for the backup location... "

wbadmin enable backup -addtarget:%location%: -include:C: -schedule:03:00 -quiet

echo Set up theoretical backup.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

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

echo Re-ran scan on security programs.>> %desktop%\progress.txt
echo.>> %desktop%\progress.txt

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
echo Go through every single step again bro
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

:: End
:end
echo I'd be suprised if you managed to make it to this screen.
echo.
echo If you did, good job, I think? Exiting script...
echo.

pause

exit
