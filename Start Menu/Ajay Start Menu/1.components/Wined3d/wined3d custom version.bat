@echo off
color 0a
set installname=wined3d-
echo Enter wined3d version (eg 10.3)
set /p version=Enter version: 
echo Version set to %version%
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
echo *** Downloading wined3d-%version% part01.rar ***
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%%version%_64.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%-x86_64.zip
    ren C:/windows/temp/WineD3DForWindows_%version%-x86_64.zip %installname%%version%_64.zip
    copy "C:/windows/temp/%installname%%version%_64.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%%version%_64.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe e -y D:\Ajay_prefix\wget_files\d3d\%installname%%version%_64.zip C:\windows\temp\system32\ *.dll >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe e -y D:\Ajay_prefix\wget_files\d3d\%installname%%version%_64.zip C:\windows\temp\system32\ *.dll >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading wined3d-%version% part02.rar ***
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%%version%.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%.zip
        ren C:/windows/temp/WineD3DForWindows_%version%.zip %installname%%version%.zip
    copy "C:/windows/temp/%installname%%version%.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%%version%.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe e -y D:\Ajay_prefix\wget_files\d3d\%installname%%version%.zip C:\windows\temp\syswow64\ *.dll >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
        D:\Ajay_prefix\.Resources\winrar.exe e -y D:\Ajay_prefix\wget_files\d3d\%installname%%version%.zip C:\windows\temp\syswow64\ *.dll >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
)

timeout.exe 5 /nobreak