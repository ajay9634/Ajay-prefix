@echo off
color 0a
echo *** Installing VB6-Extended-Setup ***
echo .
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
mkdir "D:/Ajay_prefix/wget_files/temp" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\VB6-Extended-Setup.part1.rar" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/VB6-Extended-Setup.part1.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\VB6-Extended-Setup.part1.rar D:\Ajay_prefix\wget_files\Files\VB6-Extended-Setup.part1.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\VB6-Extended-Setup.part2.rar" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/VB6-Extended-Setup.part2.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\VB6-Extended-Setup.part2.rar D:\Ajay_prefix\wget_files\Files\VB6-Extended-Setup.part2.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)

echo .
color 1f
echo *** Extracting... ***
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\Files\VB6-Extended-Setup.part1.rar D:\Ajay_prefix\wget_files\temp\
echo.
echo *** Running the installer ***
echo ignore or skip error
Start /wait D:/Ajay_prefix/wget_files/temp/VB6-Extended-Setup.exe
