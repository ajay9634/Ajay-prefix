@echo off
color 0a
set installname=%~n0
set version=4.13
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
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%-x86_64.zip
    ren C:/windows/temp/WineD3DForWindows_%version%-x86_64.zip %installname%_64.zip
    copy "C:/windows/temp/%installname%_64.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip C:\windows\temp\system32\ -r -y >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip C:\windows\temp\system32\ -r -y >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y C:\windows\temp\system32\ C:\windows\system32\ /E /H /C /I
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading wined3d-%version% part02.rar ***
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%.zip" (
    wget -q --show-progress -P C:/windows/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_%version%.zip
        ren C:/windows/temp/WineD3DForWindows_%version%.zip %installname%.zip
    copy "C:/windows/temp/%installname%.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip C:\windows\temp\syswow64\ -r -y >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
) ELSE (
    ECHO file already exists. echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip C:\windows\temp\syswow64\ -r -y >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y C:\windows\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
)
:: Repeat for other parts...
