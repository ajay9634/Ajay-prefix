set "URL1=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu/Start_Menu.7z"

set "URL2=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu/Ajay_Prefix_Extra_Setup.bat"

set "URL3=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu/Ajay_Start_Menu_Updater.bat"

set "URL4=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu/cmd.bat"

set "URL5=https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/Ajay_Start_Menu/Changelog.txt"

echo [STEP] Downloading latest Ajay Start Menu package...
set "OUTFILE=C:\Windows\Temp\Scripts.zip"
set "StartMenu=C:\Windows\Temp\Start_Menu.7z"
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Windows\Temp" "%URL1%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Windows\Temp" "%URL2%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Windows\Temp" "%URL3%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Windows\Temp" "%URL4%" >nul 2>&1
timeout.exe /t 1 /nobreak >nul
wget -q -P "C:\Windows\Temp" "%URL5%" >nul 2>&1

timeout.exe /t 1 /nobreak >nul
timeout.exe /t 1 /nobreak >nul
