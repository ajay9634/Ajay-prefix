@echo off
color 0a
echo *** You can edit exe and dlls by ExplorerSuite ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading CFF Explorer ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\ExplorerSuite.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/ExplorerSuite.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\ExplorerSuite.7z D:\Ajay_prefix\wget_files\Files\ExplorerSuite.7z /E /H /C /I
) ELSE (
    ECHO CFF Explorer already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\ExplorerSuite.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1

echo *** Opening ExplorerSuite  ***
Start D:\Ajay_prefix\wget_files\temp\ExplorerSuite.exe
echo ************************************************
