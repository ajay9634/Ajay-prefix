@echo off
color 0a
echo *** Enjoy flash or swf games ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading ResourceHacker ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\ResourceHacker.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/ResourceHacker.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\ResourceHacker.7z D:\Ajay_prefix\wget_files\Files\ResourceHacker.7z /E /H /C /I
) ELSE (
    ECHO ResourceHacker already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\ResourceHacker.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** opening ResourceHacker ***
Start "" D:\Ajay_prefix\wget_files\temp\ResourceHacker.exe
echo ************************************************
timeout.exe /t 3 >nul
