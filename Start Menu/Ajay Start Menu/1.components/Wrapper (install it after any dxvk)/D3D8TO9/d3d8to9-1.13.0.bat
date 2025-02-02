@echo off
set "version=1.13.0"
echo d3d8to9 Version: %version%
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading d3d8to9-%version%  ***

IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://github.com/crosire/d3d8to9/releases/download/v%version%/d3d8.dll
    mkdir "D:/Ajay_prefix/wget_files/d3d/d3d8to9-%version%/" >NUL 2>&1
    copy /s /y D:\Ajay_prefix\wget_files\temp\d3d8.dll D:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll /E /H /C /I
) ELSE (
    ECHO d3d8to9-%version% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** installing...***
copy /s /y D:\Ajay_prefix\wget_files\d3d\d3d8to9-%version%\d3d8.dll C:\windows\syswow64\d3d8.dll /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak