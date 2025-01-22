@echo off
color 1E
echo don't close this window !
taskkill /F /IM 7z.exe /T >NUL 2>&1
taskkill /F /IM winrar.exe /T >NUL 2>&1

echo Checking ".Resources" files and "install necessary files.bat" ...

if not exist "D:\Ajay_prefix\.Resources\Resources.7z" (
    echo msgbox "Hello! Looks like Ajay prefix offline files are missing from d drive , Expect less Start Menu !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
goto checked
) else ( goto necessary_files )

:necessary_files
if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\install necessary files.bat" (
    echo adding "install necessary files.bat" and other shortcuts to Start Menu 

    rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\2.offline components\" >nul 2>&1
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Ajay Start Menu\3.GPU Test" >nul 2>&1

    D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\.Resources\Start_Menu.7z -oC:\ -p-q -r -y >NUL 2>&1
    ) else ( goto checked )

:checked
if not exist "C:\windows\timeout.exe" (
echo downloading update !
wget -q -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/update.7z
copy /q /s /y D:\Ajay_prefix\wget_files\temp\update.7z D:\Ajay_prefix\.Resources\update.7z /E /H /C /I
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp"
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\.Resources\update.7z -oC:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y C:\windows\temp\ C:\ /E /H /C /I >NUL 2>&1
) else (

)
if not exist "C:\windows\timeout.exe" (
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
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
