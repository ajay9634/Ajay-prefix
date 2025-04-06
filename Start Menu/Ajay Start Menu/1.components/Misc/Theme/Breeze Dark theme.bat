@echo off
if not exist "C:\windows\timeout.exe" (
    echo msgbox " It looks like timeout.exe is missing. Update 1.components scripts ! " , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
exit

) else (

)
echo installing Breeze Dark theme...
reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternativeFace /t REG_SZ /d "200 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "154 154 154" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "155 155 155" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "159 167 180" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "73 78 88" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "35 38 41" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "219 220 222" /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ThemeManager" /v ThemeActive /t REG_SZ /d 0 /f >nul 2>&1

timeout.exe 10 /nobreak >nul 2>&1

reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternativeFace /t REG_SZ /d "200 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "154 154 154" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "60 64 72" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "155 155 155" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "159 167 180" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "119 126 140" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "73 78 88" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "219 220 222" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "35 38 41" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "49 54 58" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "219 220 222" /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ThemeManager" /v ThemeActive /t REG_SZ /d 0 /f >nul 2>&1
timeout.exe /t 3 >nul

echo msgbox "Hello! Now Restart the container !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
