@echo off
color 0c
echo Uninstalling Microsoft-xaudio2_9+redist ...

:: Delete DLL files silently
del C:\windows\syswow64\xaudio2_9redist.dll >NUL 2>&1
del C:\windows\system32\xaudio2_9redist.dll >NUL 2>&1
del C:\windows\syswow64\xaudio2_9.dll >NUL 2>&1
del C:\windows\system32\xaudio2_9.dll >NUL 2>&1

echo Updating registry...
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >NUL 2>&1

:: Add a short delay
timeout.exe 5 /nobreak >NUL 2>&1

:: Ensure registry changes are applied
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "builtin,native" /f >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "builtin,native" /f >NUL 2>&1

color 0a
echo Uninstalled Successfully!
timeout.exe 3 /nobreak >NUL 2>&1
