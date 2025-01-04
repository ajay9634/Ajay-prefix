@echo off
mkdir D:\Ajay_prefix\wget_files\d3d
mkdir D:\Ajay_prefix\wget_files\dsound
mkdir D:\Ajay_prefix\wget_files\Files
mkdir D:\Ajay_prefix\wget_files\Fixes
mkdir D:\Ajay_prefix\wget_files\Game-fixes
mkdir D:\Ajay_prefix\wget_files\NET
mkdir D:\Ajay_prefix\wget_files\physx
mkdir D:\Ajay_prefix\wget_files\temp
mkdir D:\Ajay_prefix\wget_files\my_apps
mkdir D:\Ajay_prefix\save_data\users\Registry_backup
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Local
mkdir D:\Ajay_prefix\save_data\users\xuser\AppData\Roaming
mkdir D:\Ajay_prefix\save_data\users\xuser\Documents
mkdir "D:\Ajay_prefix\save_data\users\xuser\Documents\My Games"
mkdir "D:\Ajay_prefix\save_data\users\xuser\"Saved Games

echo msgbox "Hello! Ajay Prefix components are updated successfully, Changelog and Files are saved to drive_D/Ajay_prefix/wget_files/ !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
