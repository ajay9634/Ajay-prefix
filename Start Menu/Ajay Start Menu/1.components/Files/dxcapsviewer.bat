@echo off
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading dxcapsviewer.7z  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/dxcapsviewer.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\dxcapsviewer.7z D:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z /E /H /C /I
) ELSE (
    ECHO dxcapsviewer file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\dxcapsviewer.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** opening ...***
Start D:\Ajay_prefix\wget_files\temp\dxcapsviewer.exe
)
echo.************************************************
