@echo off
color 1f
echo ==================================
echo ***** Warning: Uninstall mono or other .NET framework, This is official setup and tested in Wine 8.0.2 (Kron4ek) in Winlator Proot.
echo Installation will take a long time. Set Windows version to 7 in winecfg. *****
echo ==================================
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install .NET Framework 4.5.2 official
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
ECHO *** Installing .NET Framework 4.5.2...***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din" "D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe
ren D:/Ajay_prefix/wget_files/temp/NDP452-KB2901907-x86-x64-AllOS-ENU.exe dotNetFx452_Full_x86_x64.exe
    copy "D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe" "D:/Ajay_prefix/wget_files/NET/dotNetFx452_Full_x86_x64.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start D:/Ajay_prefix/wget_files/temp/dotNetFx452_Full_x86_x64.exe /force /norestart

ECHO *******
exit
