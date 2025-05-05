@echo off
echo Setting Game Language for GTA V in the registry...

:: Set Language to English (en)
reg add "HKCU\Software\Rockstar Games\GTAV" /v "Language" /t REG_SZ /d "en" /f >nul 2>&1

:: Wait 10 seconds to ensure changes are applied
timeout.exe /t 6 /nobreak >nul 2>&1

:: Reapply the registry action silently
reg add "HKCU\Software\Rockstar Games\GTAV" /v "Language" /t REG_SZ /d "en" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
echo Game Language has been successfully set to English
