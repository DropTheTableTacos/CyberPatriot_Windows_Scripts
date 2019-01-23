@echo off

:: Setup
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
set listuser=%pshellrun% "Get-LocalUser | select name, enabled"
set listadmin=%pshellrun% "Get-LocalGroupMember -group Administrators | select name"
set getservice=Get-WmiObject -class win32_service ^| select name, displayname, state, startmode, processid, installdate, pathname
set PATH=%systemroot%;%systemroot%\system32;%systemroot%\system32\Wbem;%programfiles%;%programfiles(x86)%;%systemroot%\System32\WindowsPowerShell\v1.0;%programdata%\chocolatey\bin;%programfiles%\Git\bin;%compfiles%;%scm%;%desktop%;%cmderbin%
del /f /q C:\approved_users.txt C:\users_admins.txt C:\mediafiles.txt C:\sketchyfiles.txt C:\eek.txt C:\*files.txt C:\whomst.txt C:\sketchymemes.txt C:\userdiff.txt

cls

echo Configuring Automatic Windows Update...
echo.

sc config wuauserv start= auto
sc start wuauserv
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
echo.

echo Disabling Services...
echo.

for /f %%G in (%compfiles%\services.txt) do (sc stop %%G & sc config %%G start= disabled)
sc config wuauserv start= auto
sc start wuauserv
sc config eventlog start= auto
sc start eventlog
sc config windefend start= auto
sc start windefend
cls
echo Services disabled!
echo.
