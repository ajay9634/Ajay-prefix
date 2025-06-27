@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
setlocal EnableDelayedExpansion
echo *** Deleting temp files... ***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
echo *** temp files deleted ***
cls

echo ( Recommended versions: 2.14.1 , 2.13 , 2.12 , 2.11 , 2.10 , 2.9 , 2.8 )
echo Fetching available VKD3D-Proton versions...
wget -q -O %drive_letter%:/Ajay_prefix/wget_files/temp/all_releases.json https://api.github.com/repos/HansKristian-Work/vkd3d-proton/releases

goto show_version_list

:version_input
set /p "version=Type the version [e.g. 2.10]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo.
echo *** script made by Ajay ***

color 0A
echo.
echo *** Downloading vkd3d-proton-%version% ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-proton-%version%.tar.zst" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/HansKristian-Work/vkd3d-proton/releases/download/v%version%/vkd3d-proton-%version%.tar.zst

    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\vkd3d-proton-%version%.tar.zst %drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-proton-%version%.tar.zst
) ELSE (
    ECHO vkd3d-proton-%version%.tar.zst already exists.
)

color 1f
echo *** Decompressing and Extracting... ***

:: rem Extract .tar.zst
"C:\windows\7z.exe" x "%drive_letter%:\Ajay_prefix\wget_files\d3d\vkd3d-proton-%version%.tar.zst" -o"C:\windows\temp"

:: rem Extract .tar
"C:\windows\7z.exe" x "C:\windows\temp\vkd3d-proton-%version%.tar" -o"C:\windows\temp"

echo *** Installing... ***
Xcopy /s /y C:\windows\temp\vkd3d-proton-%version%\x64\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\vkd3d-proton-%version%\x86\ C:\windows\syswow64\ /E /H /C /I

echo ************************************************
timeout.exe 3 /nobreak
goto end

:show_version_list
echo.
setlocal EnableDelayedExpansion
set count=0
for /f "tokens=2 delims=:" %%A in ('findstr /i "tag_name" %drive_letter%:/Ajay_prefix/wget_files/temp/all_releases.json 2^>nul') do (
    set "ver=%%A"
    set "ver=!ver:,=!"
    set "ver=!ver:"=!"
    set "ver=!ver: =!"
    set "ver=!ver:v=!"
    set /a count+=1
    echo !count!. vkd3d-proton-!ver!
)
endlocal
echo.
goto version_input

:end
pause
