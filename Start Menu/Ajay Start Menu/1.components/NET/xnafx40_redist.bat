@echo off
color 0a
echo msgbox "Hello! This one needs mono. Please install wine mono online or offline !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
echo *** deleted temp files ***
echo.
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading xnafx40_redist  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\NET\xnafx40_redist.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/xnafx40_redist.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\xnafx40_redist.7z D:\Ajay_prefix\wget_files\NET\xnafx40_redist.7z /E /H /C /I
) ELSE (
    ECHO xnafx40_redist file already exists.
)

:: Simulate download progress only for subsequent parts

color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\NET\xnafx40_redist.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing ...***
Start D:\Ajay_prefix\wget_files\temp\xnafx40_redist.msi. )
echo.************************************************
