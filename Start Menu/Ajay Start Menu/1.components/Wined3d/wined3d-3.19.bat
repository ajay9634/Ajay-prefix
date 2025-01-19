@echo off
color 0a
set installname=%~n0
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_3.19-x86_64.zip
    ren D:/Ajay_prefix/wget_files/temp/WineD3DForWindows_3.19-x86_64.zip %installname%_64.zip
    copy "D:/Ajay_prefix/wget_files/temp/%installname%_64.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip D:\Ajay_prefix\wget_files\temp\system32\ -r -y >NUL 2>&1
    echo installing 64bit dlls....
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
) ELSE (
    ECHO file is already exists. Extracting...
       D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip D:\Ajay_prefix\wget_files\temp\system32\ -r -y >NUL 2>&1
       echo installing 64bit dlls....
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%.zip" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_3.19.zip
        ren D:/Ajay_prefix/wget_files/temp/WineD3DForWindows_3.19.zip %installname%.zip
    copy "D:/Ajay_prefix/wget_files/temp/%installname%.zip" "D:/Ajay_prefix/wget_files/d3d/%installname%.zip"
    echo Extracting....
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip D:\Ajay_prefix\wget_files\temp\syswow64\ -r -y >NUL 2>&1
    echo installing 32bit dlls....
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
) ELSE (
    ECHO file is already exists. Extracting...
        D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip D:\Ajay_prefix\wget_files\temp\syswow64\ -r -y >NUL 2>&1
        echo installing 32bit dlls....
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
)

:: Repeat for other parts...