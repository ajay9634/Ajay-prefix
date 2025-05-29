@echo off
del "%LOCALAPPDATA%\DOSBox\dosbox-staging.conf" >NUL 2>&1
echo done !
timeout.exe /t 3 >nul