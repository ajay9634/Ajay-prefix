@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "installname=dcom98"
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
echo [INFO] applying native,builtin registry
reg add "HKCU\Software\Wine\DllOverrides" /v ole32 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v oleaut32 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v rpcrt4 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v comcat /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2disp /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2nls /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v typelib /d native,builtin /f >nul 2>&1
timeout.exe 5 /nobreak >NUL 2>&1

reg add "HKCU\Software\Wine\DllOverrides" /v ole32 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v oleaut32 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v rpcrt4 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v comcat /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2 /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2disp /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v ole2nls /d native,builtin /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v typelib /d native,builtin /f >nul 2>&1

echo [INFO] Setting Wine version to win98...
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win98" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win98" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo [INFO] Wine version has been set to win98 successfully.
Start /wait "" "%drive_letter%:\Ajay_prefix\wget_files\temp\dcom98.exe"

echo [INFO] Setting Wine version to win7...
reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win7" /f >nul 2>&1

timeout.exe /t 6 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine" /v "Version" /t REG_SZ /d "win7" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo [INFO] Wine version has been set to win7 successfully
echo [Note] services.exe and rpcss.exe should be running before installing installshild setup
echo done !
echo ************************************************
timeout.exe 3 /nobreak
