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
echo ( Recommended old dxvk version :- 0.40 , 0.54 , 0.96 , 1.5.5 , 1.7.1 , 1.7.3 , 1.10 , 1.10.3 , 2.0 , 2.1 , 2.3.1 , 2.4.1 )
echo.
echo Fetching last 30 available DXVK versions...
:: Ensure temp folder exists before download
if not exist "%drive_letter%:/Ajay_prefix/wget_files/temp" mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"

:: Download the list of releases
wget -q -O %drive_letter%:/Ajay_prefix/wget_files/temp/all_releases.json https://api.github.com/repos/doitsujin/dxvk/releases

goto show_version_list

:version_input
set /p "version=Type the version [eg 2.4.1]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** wait....***
echo.
echo *** script made by Ajay ***

color 0A
echo.
echo *** Downloading dxvk-%version%  ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://github.com/doitsujin/dxvk/releases/download/v%version%/dxvk-%version%.tar.gz

    copy /y %drive_letter%:\Ajay_prefix\wget_files\temp\dxvk-%version%.tar.gz %drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz
) ELSE (
    ECHO dxvk-%version%.tar.gz file already exists.
)

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz C:\windows\temp\ -r -y >NUL 2>&1

IF ERRORLEVEL 1 (
    echo.
    echo [WARN] WinRAR extraction failed. Trying with 7-Zip...
    C:\Windows\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\dxvk-%version%.tar.gz -oC:\windows\temp -y
C:\Windows\7z.exe x C:\windows\temp\dxvk-%version%.tar -oC:\windows\temp -y
    IF ERRORLEVEL 1 (
        echo.
        echo [ERROR] Both WinRAR and 7-Zip failed to extract the archive.
        echo Make sure all parts exist and are not corrupted.
        timeout /t 5 >nul
        exit /b 1
    )
)
echo *** installing...***
if exist "C:\windows\temp\dxvk-%version%\x64" ren "C:\windows\temp\dxvk-%version%\x64" system32
if exist "C:\windows\temp\dxvk-%version%\x32" ren "C:\windows\temp\dxvk-%version%\x32" syswow64
Xcopy /s /y C:\windows\temp\dxvk-%version%\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /s /y C:\windows\temp\dxvk-%version%\syswow64\ C:\windows\syswow64\ /E /H /C /I

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
    echo !count!. dxvk-!ver!
)
endlocal
echo.
goto version_input

:end
