@echo off
echo updating registry
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "native,builtin" /f >nul 2>&1
timeout.exe /t 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "native,builtin" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1