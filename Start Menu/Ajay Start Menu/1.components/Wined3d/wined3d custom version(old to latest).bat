@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** downloding wined3d from `https://fdossena.com` , VPN maybe needed. ***
echo.
set installname=wined3d-
echo Enter wined3d version (eg 10.3 or 10.3-staging ) ( Note - Minimum value limit 1.6.2 for only syswow64 and 1.7.53 for system32 + syswow64 )
echo.
set /p version=Enter version: 
echo Version set to %version%
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
echo *** Downloading wined3d-%version% part01.rar ***
IF NOT EXIST "%drive_letter%:/Ajay_prefix/wget_files/d3d/%installname%%version%_64.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%-x86_64.zip
    ren C:/windows/temp/WineD3DForWindows_%version%-x86_64.zip %installname%%version%_64.zip
    copy "C:/windows/temp/%installname%%version%_64.zip" "%drive_letter%:/Ajay_prefix/wget_files/d3d/%installname%%version%_64.zip"
    echo Extracting....
    %drive_letter%:\Ajay_prefix\.Resources\winrar.exe e -y %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%%version%_64.zip C:\windows\temp\system32\ *.dll >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
    %drive_letter%:\Ajay_prefix\.Resources\winrar.exe e -y %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%%version%_64.zip C:\windows\temp\system32\ *.dll >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading wined3d-%version% part02.rar ***
IF NOT EXIST "%drive_letter%:/Ajay_prefix/wget_files/d3d/%installname%%version%.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%.zip
        ren C:/windows/temp/WineD3DForWindows_%version%.zip %installname%%version%.zip
    copy "C:/windows/temp/%installname%%version%.zip" "%drive_letter%:/Ajay_prefix/wget_files/d3d/%installname%%version%.zip"
    echo Extracting....
    %drive_letter%:\Ajay_prefix\.Resources\winrar.exe e -y %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%%version%.zip C:\windows\temp\syswow64\ *.dll >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
        %drive_letter%:\Ajay_prefix\.Resources\winrar.exe e -y %drive_letter%:\Ajay_prefix\wget_files\d3d\%installname%%version%.zip C:\windows\temp\syswow64\ *.dll >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
)

timeout.exe 5 /nobreak
