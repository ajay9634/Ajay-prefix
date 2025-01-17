@echo off
if not exist "C:\windows\timeout.exe" (
    echo msgbox " It looks like timeout.exe is missing. Update 1.components scripts ! " , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
exit

) else (

)
echo Installing Windows 7 Light Theme...

reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "180 180 180" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "153 180 209" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "171 171 171" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternateFace /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "105 105 105" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "227 227 227" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "160 160 160" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "185 209 234" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "215 228 242" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "109 109 109" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "51 153 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HotTrackingColor /t REG_SZ /d "0 102 204" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "244 247 252" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "191 205 219" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "67 78 84" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "255 255 225" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "51 153 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "200 200 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "100 100 100" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ThemeManager" /v ThemeActive /t REG_SZ /d 0 /f

timeout.exe 10 /nobreak >nul 2>&1

reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "180 180 180" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "153 180 209" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "171 171 171" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternateFace /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "105 105 105" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "227 227 227" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "160 160 160" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "185 209 234" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "215 228 242" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "109 109 109" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "51 153 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HotTrackingColor /t REG_SZ /d "0 102 204" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "244 247 252" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "191 205 219" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "67 78 84" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "255 255 225" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "240 240 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "51 153 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "200 200 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "100 100 100" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ThemeManager" /v ThemeActive /t REG_SZ /d 0 /f

echo msgbox "Hello! Now Restart the container !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
