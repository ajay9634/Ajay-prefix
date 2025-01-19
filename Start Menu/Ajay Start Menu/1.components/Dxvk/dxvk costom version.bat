@echo off
echo .

:version_input
:: Allow the user to type or confirm the version before proceeding
set /p "version=Type the version [eg 2.4.1]: "

echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading dxvk-%version%  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/doitsujin/dxvk/releases/download/v%version%/dxvk-%version%.tar.gz
    copy /s /y D:\Ajay_prefix\wget_files\temp\dxvk-%version%.tar.gz D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz /E /H /C /I
) ELSE (
    ECHO dxvk-%version%.tar.gz file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz D:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
ren "D:\Ajay_prefix\wget_files\temp\dxvk-%version%\x64" system32
ren "D:\Ajay_prefix\wget_files\temp\dxvk-%version%\x32" syswow64
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\dxvk-%version%\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\dxvk-%version%\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************