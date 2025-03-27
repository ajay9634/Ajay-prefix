@echo off
echo Uninstalling Microsoft-xaudio2_9+redist ...
del C:\temp\Resources\fix\xaudio2_9\system32\xaudio2_9redist.dll >NUL 2>&1
del C:\windows\system32\xaudio2_9redist.dll >NUL 2>&1
del C:\temp\Resources\fix\xaudio2_9\system32\xaudio2_9.dll >NUL 2>&1
del C:\windows\system32\xaudio2_9.dll >NUL 2>&1

echo updating registry
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >nul 2>&1
timeout.exe 5 /nobreak >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >nul 2>&1
echo Uninstalled !
timeout.exe 3 /nobreak >NUL 2>&1
