@echo off
echo [INFO] Removing Temp
echo.
Start /wait "C:\Program Files (x86)\AutoIt3\AutoIt3.exe" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Temp_Cleaner.ajau3"
timeout.exe /t 1 /nobreak >nul
for /f "tokens=2 delims==" %%a in ('findstr /i "SetupFolder=" "%WINDIR%\AjayPrefixConf.txt"') do set "setupfolder=%%a"
for /f "tokens=2 delims==" %%b in ('findstr /i "SaveDataFolder=" "%WINDIR%\AjayPrefixConf.txt"') do set "savedatafolder=%%b"

:: set File=Physx\(file name)
mkdir "%setupfolder%\Ajay_prefix\Downloaded_Files\temp" >nul 2>&1
echo [PKD] Unpacking "%Full_File%"
echo.

cd /d "C:\Temp\"
"C:\Program Files (x86)\UHARC CMD\bin\uharc.exe" e -o+ -y "%setupfolder%\Ajay_prefix\.Resources\%PKD%" "%Full_File%" >nul

echo.
if %ERRORLEVEL% EQU 0 (
    echo [PKD] Unpack Complete.
    echo.
) else (
    echo [PKD] Unpack Failed. Make sure Resources Files exist.
    echo.
    pause
    exit
)
