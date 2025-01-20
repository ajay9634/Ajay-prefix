@echo off
color 7c
echo *** installing Mangohud ***
echo.
echo ******* And add this environmental variable: [MANGOHUD=1] *******
echo .
echo ******* experiment with MANGOHUD_CONFIG, like: [MANGOHUD_CONFIG=fps_limit=60,ram,gpu_stats=0,engine_version,arch,background_alpha=0 ] *******
echo .
echo ******* You can create presets in the Z:/home/xuser/.config/MangoHud/ directory. If you know how to do that. *******
echo .
echo *** Mango HUD compiled by coffincolors ***
echo.
echo *** Script made by Ajay ***

:: User choice for download
echo.
echo Do you want to download and install Winlator_Cmod_MangoHud?
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
echo *** Mango hud compiled by coffincolors ***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading Winlator_Cmod_MangoHud  ***
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/Winlator_Cmod_MangoHud.7z

:: Simulate download progress only for subsequent parts

color 1f
echo *** installing ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\temp\Winlator_Cmod_MangoHud.7z -oZ:\ -r -y >NUL 2>&1

echo installed successfully

echo ************************************************

