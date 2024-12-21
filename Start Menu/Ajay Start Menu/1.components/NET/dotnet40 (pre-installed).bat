@echo off
color 1f
echo *** Note - This file is huge (almost 175 mb) ***
echo .
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
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading part01.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part01.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part01.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar /E /H /C /I
) ELSE (
    ECHO Part 01 already exists.
)

:: Simulate download progress only for subsequent parts
color 0A
echo.
echo *** Downloading part02.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part02.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part02.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part02.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part02.rar /E /H /C /I
) ELSE (
    ECHO Part 02 already exists.
)

:: Repeat for other parts...
color 0A
echo.
echo *** Downloading part03.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part03.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part03.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part03.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part03.rar /E /H /C /I
) ELSE (
    ECHO Part 03 already exists.
)

color 0A
echo.
echo *** Downloading part04.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part04.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part04.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part04.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part04.rar /E /H /C /I
) ELSE (
    ECHO Part 04 already exists.
)

color 0A
echo.
echo *** Downloading part05.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part05.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part05.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part05.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part05.rar /E /H /C /I
) ELSE (
    ECHO Part 05 already exists.
)

color 0A
echo.
echo *** Downloading part06.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part06.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part06.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part06.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part06.rar /E /H /C /I
) ELSE (
    ECHO Part 06 already exists.
)

color 0A
echo.
echo *** Downloading part07.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part07.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part07.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part07.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part07.rar /E /H /C /I
) ELSE (
    ECHO Part 07 already exists.
)

color 0A
echo.
echo *** Downloading part08.rar ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part08.rar" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/winlator-ajay/main/My-files/Net_framework_4.0.part08.rar
    copy /s /y D:\Ajay_prefix\wget_files\temp\Net_framework_4.0.part08.rar D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part08.rar /E /H /C /I
    
) ELSE (
    ECHO Part 08 already exists.

)

color 1f
echo Extracting...
D:\Ajay_prefix\.Resources\winrar.exe x D:\Ajay_prefix\wget_files\NET\Net_framework_4.0.part01.rar D:\Ajay_prefix\wget_files\temp\
echo.
echo *** Running the installer ***
Start /wait D:/Ajay_prefix/wget_files/temp/install.bat
