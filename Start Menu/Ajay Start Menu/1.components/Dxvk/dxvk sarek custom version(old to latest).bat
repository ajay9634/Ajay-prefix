@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
:: Cleanup and Setup
echo *** Deleting temp files... ***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
cls

echo Fetching available DXVK-Sarek versions...
wget -q -O %drive_letter%:/Ajay_prefix/wget_files/temp/all_releases.json https://api.github.com/repos/pythonlover02/DXVK-Sarek/releases

goto show_version_list

:version_input
set /p "version=Type the version tag [e.g., v1.10.8 or async-v1.10.8]: "
echo.
echo You entered version: %version%
echo.
color 0a
echo *** Please wait... ***
echo.
echo *** Script made by Ajay ***

    set "version_tag=%version:async-=%"
    set "tarball=dxvk-sarek-%version%.tar.gz"

:: Set paths
set "tarball_path=%drive_letter%:\Ajay_prefix\wget_files\d3d\%tarball%"
set "temp_tarball_path=%drive_letter%:\Ajay_prefix\wget_files\temp\%tarball%"

echo.
echo *** Downloading %tarball% ***

IF NOT EXIST "%tarball_path%" (
    echo Attempting download from: https://github.com/pythonlover02/DXVK-Sarek/releases/download/%version_tag%/%tarball%
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega ^
    https://github.com/pythonlover02/DXVK-Sarek/releases/download/%version_tag%/%tarball%

    IF EXIST "%temp_tarball_path%" (
        copy /y "%temp_tarball_path%" "%tarball_path%" >nul
    ) ELSE (
        echo [X] Download failed or file not found.
        pause
        goto end
    )
)
:: Extract
color 1f
echo *** Extracting... ***
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x "%tarball_path%" "C:\windows\temp\" -r -y >NUL 2>&1

IF ERRORLEVEL 1 (
    echo.
    echo [WARN] WinRAR extraction failed. Trying with 7-Zip...
    C:\Windows\7z.exe x %tarball_path% -oC:\windows\temp -y
C:\Windows\7z.exe x C:\windows\temp\dxvk-sarek-%version%.tar -oC:\windows\temp -y
    IF ERRORLEVEL 1 (
        echo.
        echo [ERROR] Both WinRAR and 7-Zip failed to extract the archive.
        echo Make sure all parts exist and are not corrupted.
        timeout /t 5 >nul
        exit /b 1
    )
)

:: Find extracted folder
set "dxvk_dir="
for /d %%F in (C:\windows\temp\dxvk-*) do (
    set "dxvk_dir=%%~nxF"
    goto found_dir
)

:found_dir
if not defined dxvk_dir (
    echo [X] ERROR: Could not find extracted DXVK folder.
    pause
    goto end
)

echo *** Installing from %dxvk_dir% ***
xcopy /s /y "C:\windows\temp\%dxvk_dir%\x64\" "C:\windows\system32\" /E /H /C /I
xcopy /s /y "C:\windows\temp\%dxvk_dir%\x32\" "C:\windows\syswow64\" /E /H /C /I

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
    set /a count+=1
    echo !count!. !ver!
)
endlocal
echo.
goto version_input

:end
endlocal
