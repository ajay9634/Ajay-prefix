@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
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
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1

:: Check if the .din backup file exists
IF EXIST "%drive_letter%:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din" (
    ECHO *** backup file found, Now running the installer...***
    copy "%drive_letter%:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din" "C:/windows/temp/dotNetFx48_Full_x86_x64.exe"
) ELSE (
    echo.
    ECHO ! backup file not found, downloading...
    echo.
    wget -q --show-progress -P "C:/windows/temp/" --progress=dot:mega https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/abd170b4b0ec15ad0222a809b761a036/ndp48-x86-x64-allos-enu.exe
ren C:/windows/temp/ndp48-x86-x64-allos-enu.exe dotNetFx48_Full_x86_x64.exe
    copy "C:/windows/temp/dotNetFx48_Full_x86_x64.exe" "%drive_letter%:/Ajay_prefix/wget_files/NET/dotNetFx48_Full_x86_x64.din"
    echo.
    ECHO *** Download complete, installing...**"
    echo.
)

:: Run the installer
Start C:/windows/temp/dotNetFx48_Full_x86_x64.exe /force /norestart

ECHO *******
exit
