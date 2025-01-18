@echo off
echo Setting RenderTargetLockMode to unlocked in Wine...

reg add "HKEY_CURRENT_USER\Software\Wine\Direct3D" /v "RenderTargetLockMode" /t REG_SZ /d "unlocked" /f >nul 2>&1

timeout.exe /t 10 /nobreak >nul 2>&1

echo RenderTargetLockMode has been set to unlocked successfully in Wine.
exit