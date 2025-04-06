@echo off
color 0a
echo *** Enjoy flash or swf games ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading flashplayer_32_sa ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/flashplayer_32_sa.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\flashplayer_32_sa.7z D:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z /E /H /C /I
) ELSE (
    ECHO flashplayer_32_sa already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\flashplayer_32_sa.7z -oD:\Ajay_prefix\wget_files\my_apps\ -r -y >NUL 2>&1

echo *** opening flashplayer_32_sa ***
Start D:\Ajay_prefix\wget_files\my_apps\flashplayer_32_sa.exe
echo ************************************************
timeout.exe /t 3 >nul
