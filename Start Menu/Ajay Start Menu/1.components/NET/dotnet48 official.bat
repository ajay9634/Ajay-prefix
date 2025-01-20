@echo off
color 1f
echo ==================================
echo ***** Warning: Uninstall mono or other .NET framework, This is official setup and tested in Wine 8.0.2 (Kron4ek) in Winlator Proot.
echo Installation will take a long time. Set Windows version to 7 in winecfg. *****
echo ==================================
echo.
echo *** Now choose an option - ***
echo.
ECHO 1. Install .NET Framework 4.8 official
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
ECHO *** Installing .NET Framework 4.8...***
echo.
echo *** Script made by Ajay ***
echo.
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"

:: Check if the .din backup file exists
IF EXIST "D:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "D:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din" "D:/Ajay_prefix/wget_files/temp/dotNetFx48_Full_x86_x64.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "D:/Ajay_prefix/wget_files/temp/" --progress=dot:mega https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/abd170b4b0ec15ad0222a809b761a036/ndp48-x86-x64-allos-enu.exe
ren D:/Ajay_prefix/wget_files/temp/ndp48-x86-x64-allos-enu.exe dotNetFx48_Full_x86_x64.exe
    copy "D:/Ajay_prefix/wget_files/temp/dotNetFx48_Full_x86_x64.exe" "D:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start D:/Ajay_prefix/wget_files/temp/dotNetFx48_Full_x86_x64.exe /force /norestart

ECHO *******
exit
