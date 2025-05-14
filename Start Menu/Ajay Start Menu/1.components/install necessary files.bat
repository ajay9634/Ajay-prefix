@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f

echo.
echo ====================================================
echo       [ Cleaning Temporary Files ]
echo ====================================================
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo Temp files cleaned successfully.
echo.

echo Script created by Ajay
echo ----------------------------------------------------

:: Download dsound dsoal
echo.
echo ====================================================
echo       [ Downloading dsound dsoal ]
echo ====================================================
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dsound.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\dsound.7z %drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z /E /H /C /I
) ELSE (
    echo dsound dsoal file already exists.
)
echo.
echo [ Extracting and Installing dsound dsoal... ]
echo.
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\dsound\dsound.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\dsound6(x64)DSOAL\ C:\windows\ /E /H /C /I
timeout.exe 2 /nobreak >NUL 2>&1

:: Repeat drive letter setting just in case
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D

:: Clean up temp again
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
del %drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls.7z >NUL 2>&1

echo.
echo ====================================================
echo       [ Downloading Missing_dlls ]
echo ====================================================
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Missing_dlls_v1.0.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Missing_dlls_v1.0.7z %drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z /E /H /C /I
) ELSE (
    echo Missing_dlls file already exists.
)

echo.
echo [ Extracting and Installing Missing_dlls... ]
echo.
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
Xcopy /e /y /d %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /e /y /d %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
timeout.exe 2 /nobreak >NUL 2>&1

:: Clean temp again
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1

echo.
echo ====================================================
echo   [ Downloading Microsoft-xaudio2_9+redist ]
echo ====================================================
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Microsoft-xaudio2_9+redist.7z
    xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Microsoft-xaudio2_9+redist.7z %drive_letter%:\Ajay_prefix\wget_files\Files\ >NUL 2>&1
) ELSE (
    echo Microsoft-xaudio2_9+redist file already exists.
)

echo.
echo [ Extracting and Installing Microsoft-xaudio2_9+redist... ]
echo.
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Microsoft-xaudio2_9+redist.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
if errorlevel 1 (
    echo Extraction failed. Exiting...
    exit /b
)

xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I 
xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I 
if errorlevel 1 (
    echo Installation failed. Check paths and permissions.
    exit /b
)

echo.
echo ====================================================
echo       [ Updating Wine Registry Overrides ]
echo ====================================================
timeout.exe 2 /nobreak >NUL 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "native,builtin" /f >nul 2>&1
timeout.exe /t 6 /nobreak >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_SZ /d "native,builtin" /f >nul 2>&1
reg add "HKCU\Software\Wine\DllOverrides" /v "xaudio2_9redist" /t REG_SZ /d "native,builtin" /f >nul 2>&1
timeout.exe /t 4 /nobreak >nul 2>&1
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo.
echo Setup complete. Press any key to exit.
pause