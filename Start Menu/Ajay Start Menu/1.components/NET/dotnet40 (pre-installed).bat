@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 1f
echo *** Warning: Mono and other net framework may conflict with this. This is pre-installed and Tested in wine 8.0.2 kron4ek proot and 9.2 wow64 proot in winlator. Container may break in other wine.Set windows version to 7 in winecfg.This file is huge (almost 175 mb) ***
echo.
echo Do you want to install dotnet40 pre-installed ?
echo [1] Yes
echo [2] No (Cancel)
echo.
set /p userChoice="Enter your choice (1 or 2): "

IF "%userChoice%"=="2" (
    echo *** Cancelled by user. Exiting script. ***
    pause
    exit /b
)

IF NOT "%userChoice%"=="1" (
    echo *** Invalid input. Please enter 1 or 2. Exiting script. ***
    pause
    exit /b
)
echo *** You selected Yes. Continuing... ***

echo *** This is going to take some minutes....***
echo *** deleting temp files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part01.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part01.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part02.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part02.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part02.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part02.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)

:: Repeat for other parts...
color 0A
echo.
echo *** Downloading part03.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part03.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part03.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part03.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part03.rar /E /H /C /I
) ELSE (
    ECHO Part 03 already exists.
)

color 0A
echo.
echo *** Downloading part04.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part04.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part04.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part04.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part04.rar /E /H /C /I
) ELSE (
    ECHO Part 04 already exists.
)

color 0A
echo.
echo *** Downloading part05.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part05.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part05.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part05.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part05.rar /E /H /C /I
) ELSE (
    ECHO Part 05 already exists.
)

color 0A
echo.
echo *** Downloading part06.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part06.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part06.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part06.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part06.rar /E /H /C /I
) ELSE (
    ECHO Part 06 already exists.
)

color 0A
echo.
echo *** Downloading part07.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part07.rar" (
    wget -q --show-progress -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part07.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part07.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part07.rar /E /H /C /I
) ELSE (
    ECHO Part 07 already exists.
)

color 0A
echo.
echo *** Downloading part08.rar ***
IF NOT EXIST "%drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part08.rar" (
    wget -P %drive_letter%:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Net_framework_4.0.part08.rar
    copy /s /y %drive_letter%:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part08.rar %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part08.rar /E /H /C /I
    
) ELSE (
    ECHO Part 08 already exists.

)

color 1f
echo Extracting...
%drive_letter%:\Ajay_prefix\.Resources\winrar.exe x %drive_letter%:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar C:\
echo.
echo *** Running the installer ***
IF EXIST "C:\windows\temp\install.bat" (
    START /WAIT C:\windows\temp\install.bat
) ELSE (
    START /WAIT C:\install.bat
)
