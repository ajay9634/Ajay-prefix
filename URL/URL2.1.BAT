set "URL1=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Start_Menu_Pro.7z"

set "URL2=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Start_Menu_Pro_wine.7z"

set "URL3=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu_Pro/Ajay_Start_Menu_Pro_Updater.bat"

echo [STEP] Downloading latest Ajay Start Menu Pro package...
set "OUTFILE=C:\Temp\Scripts_Pro.zip"
set "StartMenuPro=C:\Temp\Start_Menu_Pro.7z"
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Temp" "%URL1%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Temp" "%URL2%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Temp" "%URL3%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
timeout.exe /t 1 /nobreak >nul
