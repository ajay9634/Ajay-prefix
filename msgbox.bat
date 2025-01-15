@echo off
:: downloading timeout fix
wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/timeout.7z
copy /s /y D:\Ajay_prefix\wget_files\temp\timeout.7z D:\Ajay_prefix\wget_files\Files\timeout.7z /E /H /C /I
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp"
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\timeout.7z -oC:\windows\temp\ -r -y >NUL 2>&1
Xcopy /s /y C:\windows\temp\ C:\windows\ /E /H /C /I

if not exist "C:\windows\system32\timeout.exe" (
    echo msgbox "Hello! Looks like some fixes are failed to install, Check your internet connection !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

) else (

)

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
