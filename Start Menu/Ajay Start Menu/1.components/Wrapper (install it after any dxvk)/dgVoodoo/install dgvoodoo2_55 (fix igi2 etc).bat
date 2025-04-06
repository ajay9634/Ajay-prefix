@echo off
set "installname=dgVoodoo2_55"
:: Remove the prefix "dxvk-" and keep the part after it
color 0a
echo *** wait....***
echo *** deleting temp files...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
del "C:\windows\system32\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodoo.conf" >NUL 2>&1
del "C:\windows\system32\dgVoodoo.conf" >NUL 2>&1
echo *** deleted temp files ***
echo .
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading %installname%  ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\%installname%.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/%installname%.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\%installname%.7z D:\Ajay_prefix\wget_files\d3d\%installname%.7z /E /H /C /I
) ELSE (
    ECHO %installname% file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.7z -oD:\Ajay_prefix\wget_files\temp\ -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
echo ************************************************
timeout.exe /t 2 >nul
Start C:\windows\syswow64\dgvoodooCpl.exe
timeout.exe /t 3 >nul
