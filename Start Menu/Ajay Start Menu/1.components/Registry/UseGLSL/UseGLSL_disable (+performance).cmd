@echo off
echo Disabling GLSL in Wine's Direct3D settings...
reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "UseGLSL" /t REG_SZ /d "disabled" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "UseGLSL" /t REG_SZ /d "disabled" /f >nul 2>&1
echo GLSL setting has been disabled successfully.
exit