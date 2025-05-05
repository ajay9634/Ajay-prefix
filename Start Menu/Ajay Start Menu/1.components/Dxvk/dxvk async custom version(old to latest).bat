@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
setlocal EnableDelayedExpansion
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
cls
echo ( Example async versions: 1.10.3, 2.0, 2.1, 2.2, 2.3 )
echo.
echo Fetching available **DXVK Async** versions...
:: Ensure temp folder exists before download
if not exist "%drive_letter%:/Ajay_prefix/wget_files/temp" mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"

:: Download async releases list
wget -q -O %drive_letter%:/Ajay_prefix/wget_files/temp/all_async_releases.json https://api.github.com/repos/Sporif/dxvk-async/releases

goto show_async_version_list

:async_version_input
set /p "version=Type the async version [eg 2.0]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo.
echo *** script made by Ajay ***

color 0A
echo.
echo *** Downloading dxvk-async-%version%  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-async-%version%.tar.gz" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/Sporif/dxvk-async/releases/download/%version%/dxvk-async-%version%.tar.gz )
    
    IF EXIST "%drive_letter%:\Ajay_prefix\wget_files\temp\dxvk-async-%version%.tar.gz" (
    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\dxvk-async-%version%.tar.gz %drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-async-%version%.tar.gz )


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-async-%version%.tar.gz C:\windows\temp\ -r -y >NUL 2>&1
echo *** installing...***
if exist "C:\windows\temp\dxvk-async-%version%\x64" ren "C:\windows\temp\dxvk-async-%version%\x64" system32
if exist "C:\windows\temp\dxvk-async-%version%\x32" ren "C:\windows\temp\dxvk-async-%version%\x32" syswow64
Xcopy /s /y C:\windows\temp\dxvk-async-%version%\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\dxvk-async-%version%\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 3 /nobreak
goto end

:show_async_version_list
echo.
setlocal EnableDelayedExpansion
set count=0
for /f "tokens=2 delims=:" %%A in ('findstr /i "tag_name" %drive_letter%:/Ajay_prefix/wget_files/temp/all_async_releases.json 2^>nul') do (
    set "ver=%%A"
    set "ver=!ver:,=!"
    set "ver=!ver:"=!"
    set "ver=!ver: =!"
    set "ver=!ver:v=!"
    set /a count+=1
    echo !count!. dxvk-async-!ver!
)
endlocal
echo.
goto async_version_input

:end
