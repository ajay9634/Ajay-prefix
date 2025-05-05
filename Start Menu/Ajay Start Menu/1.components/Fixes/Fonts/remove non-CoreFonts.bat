@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
echo Removing all non-CoreFonts from C:\Windows\Fonts

:: Ensure the directory exists before proceeding
if not exist C:\Windows\Fonts exit /b

cd /d C:\Windows\Fonts
timeout.exe /t 2 /nobreak >nul 2>&1

:: Silent deletion of all non-CoreFonts except Fonts.reg and Fonts.bat
for %%F in (*) do (
    echo %%F | findstr /I /V /X "arial.ttf arialbd.ttf arialbi.ttf ariali.ttf times.ttf timesbd.ttf timesbi.ttf timesi.ttf cour.ttf courbd.ttf courbi.ttf couri.ttf verdana.ttf verdanab.ttf verdanai.ttf verdanaz.ttf georgia.ttf georgiab.ttf georgiai.ttf georgiaz.ttf trebuc.ttf trebucbd.ttf trebucbi.ttf trebucit.ttf impact.ttf comic.ttf comicbd.ttf Fonts.reg Fonts.bat" >nul 2>&1 || del /f /q "%%F"
)

timeout.exe /t 2 /nobreak >nul 2>&1
