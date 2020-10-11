set ext_list=%userprofile%\Desktop\Script\lists\ext_del.txt

for %%a in (%ext_list%) do (
    del /s /f /q "C:\%%a" >> %userprofile%\Desktop\Script\lists\deleted_files.txt
    del /s /f /q /ar "C:\%%a" >> %userprofile%\Desktop\Script\lists\deleted_files.txt
    del /s /f /q /ah "C:\%%a" >> %userprofile%\Desktop\Script\lists\deleted_files.txt
)