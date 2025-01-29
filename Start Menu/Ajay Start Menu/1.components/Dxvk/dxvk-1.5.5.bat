@echo off
set "installname=%~n0"
:: Remove the prefix "dxvk-" and keep the part after it
set "version=%installname:dxvk-=%"
echo Version: %version%
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
echo *** Downloading %installname%  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\%installname%.tar.gz" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://github.com/doitsujin/dxvk/releases/download/v%version%/%installname%.tar.gz
    copy /s /y D:\Ajay_prefix\wget_files\temp\%installname%.tar.gz D:\Ajay_prefix\wget_files\d3d\%installname%.tar.gz /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.tar.gz C:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
ren "C:\windows\temp\%installname%\x64" system32
ren "C:\windows\temp\%installname%\x32" syswow64
Xcopy /s /y C:\windows\temp\%installname%\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\%installname%\syswow64\ C:\windows\syswow64\ /E /H /C /I

pause
echo ************************************************