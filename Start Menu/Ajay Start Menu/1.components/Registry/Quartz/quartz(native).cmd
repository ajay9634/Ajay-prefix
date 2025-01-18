@echo off
echo Configuring Quartz to use the native version in the registry...

:: Set Quartz to native
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "native" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "quartz" /t REG_SZ /d "native" /f >nul 2>&1

echo Quartz has been successfully configured to use the native version.
