@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
mkdir "%drive_letter%:\Ajay_prefix\wget_files\temp" >NUL 2>&1
del /F /Q /A "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls.7z" >NUL 2>&1
del /F /Q /A "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z" >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading Missing_dlls ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Missing_dlls_v1.1.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Missing_dlls_v1.1.7z %drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z /E /H /C /I
) ELSE (
    ECHO Missing_dlls file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.1.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***
xcopy "%drive_letter%:\Ajay_prefix\wget_files\temp\system32\" "C:\Windows\System32\" /E /Y /D /H /C /I
xcopy "%drive_letter%:\Ajay_prefix\wget_files\temp\syswow64\" "C:\Windows\SysWOW64\" /E /Y /D /H /C /I

echo.************************************************
timeout.exe 5 /nobreak
