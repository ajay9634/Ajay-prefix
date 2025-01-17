@echo off
if not exist "C:\windows\system32\timeout.exe" (
    echo msgbox " It looks like timeout.exe is missing. Update 1.components scripts ! " , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
exit

) else (

)
echo installing micewine theme
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ActiveBorder" /t REG_SZ /d "0 128 192" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ActiveTitle" /t REG_SZ /d "50 54 58" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "AppWorkSpace" /t REG_SZ /d "0 128 192" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 32" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonAlternateFace" /t REG_SZ /d "64 64 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonAlternativeFace" /t REG_SZ /d "200 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonDkShadow" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonFace" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonHilight" /t REG_SZ /d "50 56 65" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonLight" /t REG_SZ /d "48 54 60" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonShadow" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GradientActiveTitle" /t REG_SZ /d "0 84 224" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GradientInactiveTitle" /t REG_SZ /d "0 0 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GrayText" /t REG_SZ /d "155 155 155" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Hilight" /t REG_SZ /d "120 125 140" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "HilightText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "HotTrackingColor" /t REG_SZ /d "0 0 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveBorder" /t REG_SZ /d "0 0 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveTitle" /t REG_SZ /d "50 54 58" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveTitleText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InfoText" /t REG_SZ /d "160 168 180" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InfoWindow" /t REG_SZ /d "0 0 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Menu" /t REG_SZ /d "0 0 20" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuBar" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuHilight" /t REG_SZ /d "120 126 140" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Scrollbar" /t REG_SZ /d "82 104 104" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "TitleText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Window" /t REG_SZ /d "8 8 8" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "WindowFrame" /t REG_SZ /d "0 0 64" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "WindowText" /t REG_SZ /d "255 255 255" /f >nul 2>&1

timeout.exe 10 /nobreak >NUL 2>&1

reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ActiveBorder" /t REG_SZ /d "0 128 192" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ActiveTitle" /t REG_SZ /d "50 54 58" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "AppWorkSpace" /t REG_SZ /d "0 128 192" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 32" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonAlternateFace" /t REG_SZ /d "64 64 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonAlternativeFace" /t REG_SZ /d "200 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonDkShadow" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonFace" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonHilight" /t REG_SZ /d "50 56 65" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonLight" /t REG_SZ /d "48 54 60" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonShadow" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "ButtonText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GradientActiveTitle" /t REG_SZ /d "0 84 224" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GradientInactiveTitle" /t REG_SZ /d "0 0 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "GrayText" /t REG_SZ /d "155 155 155" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Hilight" /t REG_SZ /d "120 125 140" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "HilightText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "HotTrackingColor" /t REG_SZ /d "0 0 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveBorder" /t REG_SZ /d "0 0 128" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveTitle" /t REG_SZ /d "50 54 58" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InactiveTitleText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InfoText" /t REG_SZ /d "160 168 180" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "InfoWindow" /t REG_SZ /d "0 0 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Menu" /t REG_SZ /d "0 0 20" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuBar" /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuHilight" /t REG_SZ /d "120 126 140" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "MenuText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Scrollbar" /t REG_SZ /d "82 104 104" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "TitleText" /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Window" /t REG_SZ /d "8 8 8" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "WindowFrame" /t REG_SZ /d "0 0 64" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "WindowText" /t REG_SZ /d "255 255 255" /f >nul 2>&1

echo msgbox "Hello! Now Restart the container !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
