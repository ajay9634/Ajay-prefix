@echo off
color 0a
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading AnyBurn ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\AnyBurn.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/AnyBurn.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\AnyBurn.7z D:\Ajay_prefix\wget_files\Files\AnyBurn.7z /E /H /C /I
) ELSE (
    ECHO AnyBurn already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\AnyBurn.7z -oD:\Ajay_prefix\wget_files\my_apps\ -p-q -r -y >NUL 2>&1

echo *** opening AnyBurn ***
Start "" D:\Ajay_prefix\wget_files\my_apps\AnyBurn\AnyBurn.exe
timeout.exe /t 3 >nul
echo ************************************************
