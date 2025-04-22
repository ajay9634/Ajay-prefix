@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading dsound ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\dsound\dsound.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dsound.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\dsound.7z D:\Ajay_prefix\wget_files\dsound\dsound.7z /E /H /C /I
) ELSE (
    ECHO dsound file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\dsound\dsound.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\WineSound5(515k)32bit\ C:\windows\ /E /H /C /I

echo ************************************************
timeout.exe 5 /nobreak
