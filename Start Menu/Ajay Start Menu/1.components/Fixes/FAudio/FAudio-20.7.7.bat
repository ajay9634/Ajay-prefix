@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading faudio ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\FAudio-20.7.7z" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/FAudio-20.7.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\FAudio-20.7.7z D:\Ajay_prefix\wget_files\Files\FAudio-20.7.7z /E /H /C /I
) ELSE (
    ECHO FAudio-20.7.7 already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\FAudio-20.7.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
)
echo.
echo *** installed FAudio-20.7.7 dlls, Now install FAudio registry ***
