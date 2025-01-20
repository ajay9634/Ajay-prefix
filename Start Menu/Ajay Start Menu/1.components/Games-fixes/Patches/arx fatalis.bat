@echo off
color 1f
echo ==================================
echo ***** arx-libertatis-1.2.1 (size-10mb) *****

echo ==================================
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. install arx-libertatis-1.2.1
ECHO 2. Cancel or exit
set choice=
set /p choice=Type the number to select an option.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto end

:cancel
echo.
ECHO Installation cancelled. 
exit

:install
echo.
ECHO *** Installing arx-libertatis-1.2.1 4.0...***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/Game-fixes/arx-libertatis-1.2.1-windows.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/Game-fixes/arx-libertatis-1.2.1-windows.din" "D:/Ajay_prefix/wget_files/temp/arx-libertatis-1.2.1-windows.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega https://arx-libertatis.org/files/arx-libertatis-1.2.1-windows.exe
    copy "D:/Ajay_prefix/wget_files/temp/arx-libertatis-1.2.1-windows.exe" "D:/Ajay_prefix/wget_files/Game-fixes/arx-libertatis-1.2.1-windows.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start /wait D:/Ajay_prefix/wget_files/temp/arx-libertatis-1.2.1-windows.exe

ECHO *******
exit
