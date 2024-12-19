@echo off
color 7c
echo.
echo Do you want to Uninstall MangoHud?
echo [1] Yes
echo [2] No (Cancel)
echo.
set /p userChoice="Enter your choice (1 or 2): "

IF "%userChoice%"=="2" (
    echo *** Cancelled by user. Exiting script. ***
    pause
    exit /b
)

IF NOT "%userChoice%"=="1" (
    echo *** Invalid input. Please enter 1 or 2. Exiting script. ***
    pause
    exit /b
)
echo *** You selected Yes. Uninstalling... ***
del /s "Z:\usr\*mango*.*"
del /s "Z:\usr\*presets.conf.example*.*"