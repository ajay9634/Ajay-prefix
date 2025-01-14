@echo off
if exist "C:\Program Files (x86)\Steam" (
    echo msgbox "Hello! Looks like you are playing Steam games, Backup save files of Steam games manually !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

) else (

)
mkdir D:\Ajay_prefix\wget_files\d3d 2>nul
mkdir D:\Ajay_prefix\wget_files\dsound 2>nul
mkdir D:\Ajay_prefix\wget_files\Files 2>nul
mkdir D:\Ajay_prefix\wget_files\Fixes 2>nul
mkdir D:\Ajay_prefix\wget_files\Game-fixes 2>nul
mkdir D:\Ajay_prefix\wget_files\NET 2>nul
mkdir D:\Ajay_prefix\wget_files\physx 2>nul
mkdir D:\Ajay_prefix\wget_files\temp 2>nul
mkdir D:\Ajay_prefix\wget_files\my_apps 2>nul
mkdir D:\Ajay_prefix\save_data\users\Registry_backup 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Local 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Roaming 2>nul
mkdir D:\Ajay_prefix\save_data\users\xuser\Documents 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\Documents\My Games" 2>nul
mkdir "D:\Ajay_prefix\save_data\users\xuser\"Saved Games 2>nul

echo msgbox "Hello! Ajay Prefix components are updated successfully, Changelog and Files are saved to drive_D/Ajay_prefix/wget_files/ !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
