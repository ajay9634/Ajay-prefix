@echo off
color 0a
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
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Fonts.part1.rar" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts.part1.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Fonts.part1.rar D:\Ajay_prefix\wget_files\Files\Fonts.part1.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Fonts.part2.rar" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts.part2.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Fonts.part2.rar D:\Ajay_prefix\wget_files\Files\Fonts.part2.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)

color 0A
echo.
echo *** Downloading Fonts addon ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\Fonts_addon.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Fonts_addon.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\Fonts_addon.7z D:\Ajay_prefix\wget_files\Files\Fonts_addon.7z /E /H /C /I
) ELSE (
    ECHO fonts addon already exists.
)

color 1f
echo Extracting...
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\Files\Fonts.part1.rar D:\Ajay_prefix\wget_files\temp\
echo.
echo *** installing multilingual Fonts to C drive  ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\temp\Fonts.7z -oC:\windows\ -r -y >NUL 2>&1

echo *** installing multilingual Fonts to C drive  ***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\Fonts_addon.7z -oC:\windows\ -r -y >NUL 2>&1

timeout.exe 5 /nobreak
