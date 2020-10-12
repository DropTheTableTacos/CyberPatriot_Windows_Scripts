@echo off

set ext_list=%userprofile%\Desktop\Script\lists\ext_del.txt

for /f %%a in (%ext_list%) do (
    del /s /f /q "C:\%%a" >> temp.txt
    del /s /f /q /ar "C:\%%a" >> temp.txt
    del /s /f /q /ah "C:\%%a" >> temp.txt
)

findstr "Deleted file - " "temp.txt" >> %userprofile%\Desktop\Script\lists\deleted_files.txt
del /f /q temp.txt