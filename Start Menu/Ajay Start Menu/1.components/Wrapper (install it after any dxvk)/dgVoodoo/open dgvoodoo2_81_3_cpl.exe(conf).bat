@echo off
set "installname=dgVoodoo2_81_3_cpl"
:: Remove the prefix "dxvk-" and keep the part after it
color 0a
echo *** wait....***
echo *** deleting temp files and old dgvoodoo conf ...***
rmdir /S /Q "D:/Ajay_prefix/wget_files/temp"
mkdir "D:/Ajay_prefix/wget_files/temp"
del "C:\windows\system32\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodoo.conf" >NUL 2>&1
del "C:\windows\system32\dgVoodoo.conf" >NUL 2>&1
echo *** deleted temp files ***

echo.
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
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I

echo opening dgVoodoocpl.exe ...
timeout.exe 2 /nobreak >NUL 2>&1
Start C:\windows\system32\dgVoodooCpl.exe
timeout.exe /t 3 >nul
exit
