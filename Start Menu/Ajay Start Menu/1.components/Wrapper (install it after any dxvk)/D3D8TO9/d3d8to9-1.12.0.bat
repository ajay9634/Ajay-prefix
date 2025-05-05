@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
set "version=1.12.0"
echo d3d8to9 Version: %version%
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading d3d8to9-%version%  ***

IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ https://github.com/crosire/d3d8to9/releases/download/v%version%/d3d8.dll
    mkdir "%drive_letter%:/Ajay_prefix/wget_files/d3d/d3d8to9-%version%/" >NUL 2>&1
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\d3d8.dll %drive_letter%:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll /E /H /C /I
) ELSE (
    ECHO d3d8to9-%version% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** installing...***
copy /s /y %drive_letter%:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll C:\windows\syswow64\d3d8.dll /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
