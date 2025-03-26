@echo off
color 1E
title Ajay Start Menu installation
echo don't close this window !
taskkill /F /IM 7z.exe /T >NUL 2>&1
taskkill /F /IM winrar.exe /T >NUL 2>&1

echo Checking ".Resources" files ...

if not exist "D:\Ajay_prefix\.Resources\Resources.7z" (
    echo msgbox "Hello! Looks like Ajay prefix offline files are missing from d drive , Expect less Start Menu !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
goto checked
) else ( goto necessary_files )


:necessary_files
echo updating some offline scripts and necessary files script in current container
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components\" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >nul 2>&1
del "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat"
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*Backup and Restore*" >nul 2>&1
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\*export and import*" >nul 2>&1
wget -q -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/offline_scripts_update.7z
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\temp\offline_scripts_update.7z -oC:\ -r -y >NUL 2>&1

:checked
if not exist "C:\windows\curl.exe" (
echo downloading update !
wget -q -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/update.7z
copy /q /s /y D:\Ajay_prefix\wget_files\temp\update.7z D:\Ajay_prefix\.Resources\update.7z /E /H /C /I >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp"
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\.Resources\update.7z -oC:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y C:\windows\temp\ C:\ /E /H /C /I >NUL 2>&1
) else (

)
title Ajay Start Menu installation
if not exist "C:\windows\curl.exe" (
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
copy /Y "C:\windows\timeout.exe" "C:\windows\system32\timeout.exe" >nul 2>&1
cls
echo please wait ...
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo msgbox "Hello! Ajay Prefix components are updated successfully, Changelog and Files are saved to drive_D/Ajay_prefix/wget_files/!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
start /b cscript //nologo %tmp%\tmp.vbs
timeout.exe /t 2 >nul
del %tmp%\tmp.vbs 
del C:/msgbox.bat >nul 2>&1
del C:/ajay_prefix.reg >nul 2>&1
del C:/prefix.bat >nul 2>&1
