@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
del D:\Ajay_prefix\wget_files\Files\Missing_dlls.7z >NUL 2>&1
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading Missing_dlls ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Missing_dlls_v1.0.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\Missing_dlls_v1.0.7z D:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z /E /H /C /I
) ELSE (
    ECHO Missing_dlls file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\Missing_dlls_v1.0.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***
Xcopy /e /y /d D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
Xcopy /e /y /d D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I

echo.************************************************
timeout.exe 5 /nobreak
