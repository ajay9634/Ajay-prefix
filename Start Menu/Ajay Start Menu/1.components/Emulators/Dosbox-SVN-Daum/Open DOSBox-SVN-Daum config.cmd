@echo off

if exist "%LOCALAPPDATA%\DOSBox\dosbox-SVN-Daum.conf" (
    start Notepad.exe "%LOCALAPPDATA%\DOSBox\dosbox-SVN-Daum.conf" >nul 2>&1
    echo done !
) else (
    echo File not found: %LOCALAPPDATA%\DOSBox\dosbox-SVN-Daum.conf
)

timeout.exe /t 3 >nul