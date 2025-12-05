echo [STEP] Checking New Version Info ...
rmdir C:\Temp\Scripts_Version >nul 2>&1
mkdir C:\Temp\Scripts_Version >nul 2>&1
if not exist "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt" (
    set "OLD_VER=0.0"
    goto Check_Latest
)
copy /y "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt" "C:\Temp\Scripts_Version\Old_Version.txt"

timeout.exe /t 1 /nobreak >nul

set "OLD_VER=0.0"
set /p OLD_VER=<"C:\Temp\Scripts_Version\Old_Version.txt"

:Check_Latest
set "Update_URL=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Version.txt"

wget -q -P "C:\Temp\Scripts_Version" "%Update_URL%" >nul 2>&1
if not exist "C:\Temp\Scripts_Version\Version.txt" (
    echo [ERROR] No internet or GitHub is down.
    timeout /t 4 >nul
    pause
    exit    
)

set "LATEST_VER=0.0"
set /p LATEST_VER=<"C:\Temp\Scripts_Version\Version.txt"
echo [VERSION INFO] Installed Current Version %OLD_VER%
echo [VERSION INFO] Avilable New Version %LATEST_VER%
if "%OLD_VER%"=="%LATEST_VER%" (
    echo [INFO] You are up to date.
) else (
    echo [INFO] NEW UPDATE AVAILABLE.
)

set "URL1=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Start_Menu_Pro.7z"

set "URL2=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Start_Menu_Pro_wine.7z"

set "URL3=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Ajay_Start_Menu_Pro_Updater.bat"



set "OUTFILE=C:\Temp\Scripts_Pro.zip"
set "StartMenuPro=C:\Temp\Start_Menu_Pro.7z"
timeout.exe /t 1 /nobreak >nul
echo [STEP] Downloading latest Ajay Start Menu Pro package...
copy /y "C:\Temp\Scripts_Version\Version.txt" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\Version.txt"

wget -q -P "C:\Temp" "%URL1%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Temp" "%URL2%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Temp" "%URL3%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
timeout.exe /t 1 /nobreak >nul
