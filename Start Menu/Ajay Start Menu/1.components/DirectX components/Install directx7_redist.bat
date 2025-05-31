@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "installname=directx7_redist"
color 0a
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading %installname%  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\%installname%.7z %drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Fixes\%installname%.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***

echo [INFO] Setting Wine version to win98...
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win98" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win98" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo [INFO] Wine version has been set to win98 successfully.
echo [INFO] Click on Reinstall DirectX !
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
Start /wait "" "%drive_letter%:\Ajay_prefix\wget_files\temp\directx\dxsetup.exe"

echo [INFO] Setting Wine version to win7...
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win7" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win7" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo [INFO] Wine version has been set to win7 successfully
echo done !
echo removed temp files !
echo msgbox "Hello! , Now install dmusic,dplay,dshow registry as native,builtin !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
echo ************************************************
timeout.exe 3 /nobreak
