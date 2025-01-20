@echo off
color 0a
del %tmp%\tmp.vbs
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading msxml4  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\msxml4.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/msxml4.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\msxml4.7z D:\Ajay_prefix\wget_files\Files\msxml4.7z /E /H /C /I
) ELSE (
    ECHO msxml4 file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\msxml4.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing ...***
Start D:\Ajay_prefix\wget_files\temp\msxml4.msi )
echo ************************************************
