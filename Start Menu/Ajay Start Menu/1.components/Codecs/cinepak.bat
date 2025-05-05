@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Installing cinepak ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading codecs ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\codec_dlls.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/codec_dlls.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\codec_dlls.7z %drive_letter%:\Ajay_prefix\wget_files\Files\codec_dlls.7z /E /H /C /I
) ELSE (
    ECHO backup file is already exist.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\codec_dlls.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p1 -r -y >NUL 2>&1

echo *** installing cinepak ***
Xcopy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\windows\ C:\windows\ /E /H /C /I

echo Applying registry modifications for video codecs and setting DLL override...

:: Add iccvid.dll description to drivers.desc
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\drivers.desc" /v "iccvid.dll" /t REG_SZ /d "Cinepak Codec by Radius Inc." /f >nul 2>&1

:: Add iccvid.dll to Drivers32
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.cvid" /t REG_SZ /d "iccvid.dll" /f >nul 2>&1

:: Add DLL override for iccvid.dll as native
reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "iccvid" /t REG_SZ /d "native" /f >nul 2>&1

:: Delay to ensure changes take effect
timeout /t 10 /nobreak >nul 2>&1

:: Reapply registry modifications silently
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\drivers.desc" /v "iccvid.dll" /t REG_SZ /d "Cinepak Codec by Radius Inc." /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Drivers32" /v "vidc.cvid" /t REG_SZ /d "iccvid.dll" /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "iccvid" /t REG_SZ /d "native" /f >nul 2>&1

echo Registry modifications and DLL override completed successfully.
echo ************************************************
