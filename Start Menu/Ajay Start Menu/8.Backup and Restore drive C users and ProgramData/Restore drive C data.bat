@echo off
color 84
echo Restoring...
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\save_data\drive_c.7z -oC:\ -p-q -r -y >NUL 2>&1
echo msgbox "Hello! some Important Game save folders from 'Drive-D/Ajay_prefix/save_data/drive_c.7z ' are Restored to 'drive-C' ! You can Backup it in any container by 'Backup Drive C users and ProgramData.bat'" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
