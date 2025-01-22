@echo off
color 0a
echo *** Installing ffdshow_beta7_rev3154 ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading codecs ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\codecs_collection.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/codecs_collection.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\codecs_collection.7z D:\Ajay_prefix\wget_files\Files\codecs_collection.7z /E /H /C /I
) ELSE (
    ECHO backup file is already exist.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\codecs_collection.7z -oD:\Ajay_prefix\wget_files\temp\ -p1 -r -y >NUL 2>&1

echo *** install ffdshow_beta7_rev3154 manually ***
Start /wait D:\Ajay_prefix\wget_files\temp\ffdshow_beta7_rev3154_20091209.exe
echo ************************************************
