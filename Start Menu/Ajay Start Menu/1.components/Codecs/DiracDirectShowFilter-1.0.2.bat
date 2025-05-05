@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** Installing DiracDirectShowFilter-1.0.2 ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading codecs ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\Files\codecs_collection.7z" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/codecs_collection.7z
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\codecs_collection.7z %drive_letter%:\Ajay_prefix\wget_files\Files\codecs_collection.7z /E /H /C /I
) ELSE (
    ECHO backup file is already exist.
)


color 1f
echo *** Extracting ...***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\Files\codecs_collection.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p1 -r -y >NUL 2>&1

echo *** install DiracDirectShowFilter-1.0.2 manually ***
Start /wait %drive_letter%:\Ajay_prefix\wget_files\temp\DiracDirectShowFilter-1.0.2.exe
echo ************************************************
