@echo off

set ext_list=%userprofile%\Desktop\Script\lists\ext_find.txt

for /f %%a in (%ext_list%) do (
    dir /b /s /tc /o-d "C:\%%a" >> %userprofile%\Desktop\Script\lists\found_files.txt
    dir /b /s /ah /tc /o-d "C:\%%a" >> %userprofile%\Desktop\Script\lists\found_files.txt
    dir /b /s /ar /tc /o-d "C:\%%a" >> %userprofile%\Desktop\Script\lists\found_files.txt
)

notepad %userprofile%\Desktop\Script\lists\found_files.txt