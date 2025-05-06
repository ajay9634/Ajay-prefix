@echo off
color 0a
echo *** mediafoundation-HoodedDeath Installer ***
echo.
echo *** Script by Ajay ***
echo.

:CHOICE
echo Choose an option:
echo.
echo [1] Install DLLs and apply native,builtin overrides
echo [2] Only apply builtin overrides (no DLL install)
echo.
set /p choice=Enter 1 or 2: 

if "%choice%"=="1" goto install_full
if "%choice%"=="2" goto only_builtin
echo Invalid choice. Try again.
goto CHOICE

:install_full
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

echo.
echo *** Downloading mediafoundation-HoodedDeath ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\mediafoundaion-HoodedDeath.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/mediafoundaion-HoodedDeath.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\mediafoundaion-HoodedDeath.7z %drive_letter%:\Ajay_prefix\wget_files\Files\ /E /H /C /I
) ELSE (
    ECHO Backup file already exists.
)

echo *** Extracting archive ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\mediafoundaion-HoodedDeath.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p1 -r -y >nul 2>&1

echo *** Copying DLL files ***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I

echo *** Applying registry ***
reg import %drive_letter%:\Ajay_prefix\wget_files\temp\wmf.reg

goto apply_native_builtin

:only_builtin
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

echo *** Applying DLL overrides (builtin,native) ***
for %%D in (colorcnv mf mferror mfplat mfplay mfreadwrite msmpeg2adec msmpeg2vdec sqmapi) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%D /d builtin,native /f >nul 2>&1
)

timeout /t 5 >nul

for %%D in (colorcnv mf mferror mfplat mfplay mfreadwrite msmpeg2adec msmpeg2vdec sqmapi) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%D /d builtin,native /f >nul 2>&1
)

timeout /t 3 >nul
echo Done.
exit

:apply_native_builtin
echo *** Applying DLL overrides (native,builtin) ***
for %%D in (colorcnv mf mferror mfplat mfplay mfreadwrite msmpeg2adec msmpeg2vdec sqmapi) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%D /d native,builtin /f >nul 2>&1
)

timeout /t 5 >nul

for %%D in (colorcnv mf mferror mfplat mfplay mfreadwrite msmpeg2adec msmpeg2vdec sqmapi) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%D /d native,builtin /f >nul 2>&1
)

reg import %drive_letter%:\Ajay_prefix\wget_files\temp\wmf.reg
timeout /t 3 >nul
echo Done.
exit