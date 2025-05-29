@echo off

if exist "%LOCALAPPDATA%\DOSBox\dosbox-staging.conf" (
    start Notepad.exe "%LOCALAPPDATA%\DOSBox\dosbox-staging.conf" >nul 2>&1
    echo done !
) else (
    echo File not found: %LOCALAPPDATA%\DOSBox\dosbox-staging.conf
)

timeout.exe /t 3 >nul