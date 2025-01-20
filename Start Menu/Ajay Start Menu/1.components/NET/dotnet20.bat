@echo off
color 1f
echo ==================================
echo ***** Warning: Uninstall mono or other .NET framework, This is official setup and tested in Wine 8.0.2 (Kron4ek) in Winlator Proot.
echo Installation will take a long time. Set Windows version to 7 in winecfg. *****
echo ==================================
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install .NET Framework 2.0 official
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
ECHO *** Installing .NET Framework 2.0...***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/NET/dotNetFx20_Full_x64.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/NET/dotNetFx20_Full_x64.din" "D:/Ajay_prefix/wget_files/temp/dotNetFx20_Full_x64.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega https://web.archive.org/web/20060509045320/https://download.microsoft.com/download/a/3/f/a3f1bf98-18f3-4036-9b68-8e6de530ce0a/NetFx64.exe
ren D:/Ajay_prefix/wget_files/temp/NetFx64.exe dotNetFx20_Full_x64.exe
    copy "D:/Ajay_prefix/wget_files/temp/dotNetFx20_Full_x64.exe" "D:/Ajay_prefix/wget_files/NET/dotNetFx20_Full_x64.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start D:/Ajay_prefix/wget_files/temp/dotNetFx20_Full_x64.exe

ECHO *******
exit
