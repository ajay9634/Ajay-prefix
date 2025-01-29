@echo off
echo for dxvk 2.0 and later
set "installname=dxvk-special-fix"
:: Remove the prefix "dxvk-" and keep the part after it
set "version=%installname:dxvk-=%"
echo Version: %version%
color 0a
echo *** This will fix some games like dmc4 ***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading %installname%  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\%installname%.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\%installname%.7z D:\Ajay_prefix\wget_files\d3d\%installname%.7z /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
echo installed
echo ************************************************
pause
