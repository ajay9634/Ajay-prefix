@echo off
echo Removing temp folders and files...
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
rmdir /S /Q "C:/windows/temp" >NUL 2>&1
mkdir "C:/windows/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo done !
echo [INFO] If the process appears stuck, you may safely cancel it.
set "baseDir=%drive_letter%:\Ajay_prefix\.Resources"

:: Whitelist of exact filenames to keep
set "keepList=7z.din 7z.exe Resources.7z Start_Menu.7z timeout.exe update.7z WinRAR.din WinRAR.exe"

:: Step 1: Delete all non-whitelisted files
for /r "%baseDir%" %%F in (*) do (
    set "delete=1"
    set "fname=%%~nxF"
    for %%K in (%keepList%) do (
        if /i "!fname!"=="%%K" set "delete=0"
    )
    if !delete! equ 1 del "%%F" >nul 2>&1
)

:: Step 2: Delete all folders (bottom-up, multiple passes)
for /l %%I in (1,1,5) do (
    for /f "delims=" %%D in ('dir "%baseDir%" /ad /s /b') do (
        if /i not "%%D"=="%baseDir%" rd "%%D" >nul 2>&1
    )
)

echo done !
timeout.exe /t 3 >nul
