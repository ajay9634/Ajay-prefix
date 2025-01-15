@echo off
if not exist "C:\windows\system32\timeout.exe" (
    echo msgbox " It looks like timeout.exe is missing. Update 1.components scripts ! " , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
exit

) else (

)

echo installing Ajay theme..
reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "10 36 106" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternateFace /t REG_SZ /d "181 181 181" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "64 64 64" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "211 225 217" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "166 202 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "192 192 192" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "0 64 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HotTrackingColor /t REG_SZ /d "0 0 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "255 255 225" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "10 36 106" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "224 229 229" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "0 0 0" /f >nul 2>&1

timeout 10 /nobreak >nul 2>&1

reg add "HKCU\Control Panel\Colors" /v ActiveBorder /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ActiveTitle /t REG_SZ /d "10 36 106" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v AppWorkSpace /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonAlternateFace /t REG_SZ /d "181 181 181" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonDkShadow /t REG_SZ /d "64 64 64" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonFace /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonHilight /t REG_SZ /d "211 225 217" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonLight /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonShadow /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v ButtonText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientActiveTitle /t REG_SZ /d "166 202 240" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GradientInactiveTitle /t REG_SZ /d "192 192 192" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v GrayText /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Hilight /t REG_SZ /d "0 64 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HilightText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v HotTrackingColor /t REG_SZ /d "0 0 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveBorder /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitle /t REG_SZ /d "128 128 128" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InactiveTitleText /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v InfoWindow /t REG_SZ /d "255 255 225" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Menu /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuBar /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuHilight /t REG_SZ /d "10 36 106" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v MenuText /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Scrollbar /t REG_SZ /d "212 208 200" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v TitleText /t REG_SZ /d "255 255 255" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Window /t REG_SZ /d "224 229 229" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowFrame /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v WindowText /t REG_SZ /d "0 0 0" /f >nul 2>&1
echo msgbox "Hello! Now Restart the container !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
