@echo off
color 0a
set installname=%~n0
echo script made by Ajay
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
IF EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip" (   D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip D:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
  ren D:/Ajay_prefix/wget_files/temp/wined3d system32
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
    ECHO unpacking...
) ELSE (
    ECHO File not found, downloading....
)
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip" (
    wget -O D:/Ajay_prefix/wget_files/d3d/%installname%_64.zip https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_8.21-x86_64.zip
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%_64.zip D:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
  ren D:/Ajay_prefix/wget_files/temp/wined3d system32
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
    ECHO downloaded, unpacking...
) ELSE (
    ECHO ....
)
IF EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%.zip" (   D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip D:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
  ren D:/Ajay_prefix/wget_files/temp/wined3d syswow64
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
    ECHO unpacking...
) ELSE (
    ECHO File not found, downloading...
IF NOT EXIST "D:/Ajay_prefix/wget_files/d3d/%installname%.zip" (
    wget -O D:/Ajay_prefix/wget_files/d3d/%installname%.zip https://downloads.fdossena.com/Projects/WineD3D/Builds/WineD3DForWindows_8.21.zip
    D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.zip D:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
  ren D:/Ajay_prefix/wget_files/temp/wined3d syswow64
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
    ECHO downloaded, unpacking..
) ELSE (
    ECHO ....)
