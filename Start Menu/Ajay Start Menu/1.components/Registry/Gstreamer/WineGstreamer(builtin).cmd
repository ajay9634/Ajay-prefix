@echo off
echo Configuring winegstreamer to use the builtin version in the registry...

:: Set winegstreamer to builtin
reg add "HKCU\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "builtin" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 10 /nobreak >nul 2>&1

:: Reapply the registry actions silently
reg add "HKCU\Software\Wine\DllOverrides" /v "winegstreamer" /t REG_SZ /d "builtin" /f >nul 2>&1

echo winegstreamer has been successfully configured to use the builtin version.
