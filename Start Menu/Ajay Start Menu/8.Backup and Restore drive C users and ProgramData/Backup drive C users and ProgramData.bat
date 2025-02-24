@echo off
color 84
echo Backing up important folders...

D:\Ajay_prefix\.Resources\7z.exe a -t7z -y -bsp0 -bso0 D:\Ajay_prefix\save_data\drive_c.7z ^
    "C:\users\" "C:\ProgramData\" -mx0 ^
    -xr!Desktop -xr!Music -xr!"Start Menu" -xr!Microsoft -xr!Videos -xr!Temp ^
    -xr!Links -xr!Pictures -xr!Searches -xr!Downloads -xr!Contacts

echo msgbox "Hello! Important folders from 'drive-C/users/' and 'drive-C/ProgramData/' are backed up to 'Drive-D/Ajay_prefix/save_data/drive_c.7z'! You can restore them in any container using 'Restore Drive C.bat'." , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs