@echo off
echo updating registry
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >nul 2>&1
timeout.exe 10 /nobreak >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >nul 2>&1