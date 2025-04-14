@echo off
setlocal enabledelayedexpansion
color 0a
title DXVK GPLAsync Version Selector
echo ( Available old dxvk gplasync version :- 2.1-4 , 2.2-4 , 2.3-1 , 2.3.1-1 , 2.4-1 , 2.4.1-1 , 2.5-1 , 2.5.1-2 , 2.5.2-1 , 2.5.3-1 , 2.6-1 )

:: Config
set "base_url=https://gitlab.com/Ph42oN/dxvk-gplasync/-/jobs/artifacts"
set "job_name=build"
set "output_dir=D:\Ajay_prefix\wget_files\d3d"
set "winrar_path=D:\Ajay_prefix\.Resources\winrar.exe"

:: Ensure output directory exists
if not exist "%output_dir%" (
    mkdir "%output_dir%"
)

:: Get version from user (without 'v')
echo.
echo ( You can check latest version from Ph42oN gitlab then Enter here )
echo.
set /p tag=Enter dxvk gplasync version to download (e.g. 2.6-1): 

:: Full version tag with 'v'
set "full_tag=v%tag%"
set "installname=dxvk-gplasync-%full_tag%"

:: Filenames and URLs
set "zipname=%installname%.zip"
set "artifact_url=%base_url%/%full_tag%/download?job=%job_name%"
set "output_path=%output_dir%\%zipname%"

echo.
echo Selected version: %full_tag%
echo Downloading: %zipname%
echo From: %artifact_url%

:: Download if not already present
if not exist "%output_path%" (
    curl --fail -L -o "%output_path%" "%artifact_url%" >nul 2>&1
    if exist "%output_path%" (
        echo [OK] Successfully downloaded: %zipname%
    ) else (
        echo [X] Failed to download %zipname%
        del "%output_path%" >nul 2>&1
        pause
        exit /b
    )
) else (
    echo [=] File already exists: %zipname%
)

:: Extraction
color 1f
echo *** Extracting... ***
"%winrar_path%" x "%output_path%" "C:\windows\temp\" -r -y >NUL 2>&1

:: Installation
echo *** Installing... ***
set "temp_path=C:\windows\temp\%installname%"

if exist "%temp_path%\x64" (
    xcopy /s /y "%temp_path%\x64\" "C:\windows\system32\" /E /H /C /I
) else (
    echo [!] Missing x64 folder.
)

if exist "%temp_path%\x32" (
    xcopy /s /y "%temp_path%\x32\" "C:\windows\syswow64\" /E /H /C /I
) else (
    echo [!] Missing x32 folder.
)

echo ************************************************
timeout.exe 5 /nobreak >NUL 2>&1