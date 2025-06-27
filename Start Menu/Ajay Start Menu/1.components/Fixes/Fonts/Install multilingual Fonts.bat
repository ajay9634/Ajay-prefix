@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
setlocal EnableDelayedExpansion

set "winrar=%drive_letter%:\Ajay_prefix\.Resources\winrar.exe"
set "sevenzip=C:\Windows\7z.exe"
set "tempdir=%drive_letter%:\Ajay_prefix\wget_files\temp"

color 0a
echo *** deleting temp files...***
rmdir /S /Q "%tempdir%" >nul 2>&1
mkdir "%tempdir%" >nul 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: =======================
:: Download RAR Parts
:: =======================
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts.part1.rar" (
    wget -q --show-progress -P "%tempdir%" --progress=dot:mega ^
        https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts.part1.rar
    copy /s /y "%tempdir%\Fonts.part1.rar" "%drive_letter%:\Ajay_prefix\wget_files\Files\" /E /H /C /I
) ELSE (
    echo Part 01 already exists.
)

echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts.part2.rar" (
    wget -q --show-progress -P "%tempdir%" --progress=dot:mega ^
        https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts.part2.rar
    copy /s /y "%tempdir%\Fonts.part2.rar" "%drive_letter%:\Ajay_prefix\wget_files\Files\" /E /H /C /I
) ELSE (
    echo Part 02 already exists.
)

echo.
echo *** Downloading Fonts addon ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts_addon.7z" (
    wget -q --show-progress -P "%tempdir%" --progress=dot:mega ^
        https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts_addon.7z
    copy /s /y "%tempdir%\Fonts_addon.7z" "%drive_letter%:\Ajay_prefix\wget_files\Files\" /E /H /C /I
) ELSE (
    echo Fonts addon already exists.
)

:: =======================
:: Extraction & Install
:: =======================
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo.
echo Extracting RAR archive...

%winrar% x -r -y "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts.part1.rar" "%tempdir%\" >nul 2>&1
IF EXIST "%tempdir%\Fonts.7z" (
    echo [OK] Extracted Fonts.7z from RAR
) ELSE (
    echo [!] WinRAR failed, trying 7z...
    %sevenzip% x "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts.part1.rar" -o"%tempdir%" -y >nul 2>&1
    IF NOT EXIST "%tempdir%\Fonts.7z" (
        echo [X] Failed to extract Fonts.7z
        pause
        exit /b
    )
)

echo.
echo *** Installing multilingual Fonts ***
%sevenzip% x "%tempdir%\Fonts.7z" -oC:\windows\ -r -y >nul 2>&1

echo.
echo *** Installing Fonts addon ***
%sevenzip% x "%drive_letter%:\Ajay_prefix\wget_files\Files\Fonts_addon.7z" -oC:\windows\ -r -y >nul 2>&1
echo.
echo *** Installed ***
timeout.exe 5 /nobreak
endlocal
