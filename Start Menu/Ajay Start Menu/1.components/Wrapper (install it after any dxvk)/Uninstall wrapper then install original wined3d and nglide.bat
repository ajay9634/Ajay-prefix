@echo off
set "installname=OriginalWineD3D"
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
del "C:\windows\syswow64\d3dImm.dll" >NUL 2>&1
del "C:\windows\syswow64\dxwrapper.dll" >NUL 2>&1
del "C:\windows\syswow64\dxwrapper.ini" >NUL 2>&1

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

IF NOT EXIST "D:\Ajay_prefix\wget_files\d3d\nGlide210_setup.7z" (
    wget -q --show-progress -P D:/Ajay_prefix/wget_files/temp/ https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/nGlide210_setup.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\nGlide210_setup.7z D:\Ajay_prefix\wget_files\d3d\nGlide210_setup.7z /E /H /C /I
) ELSE (
    ECHO nGlide210_setup file already exists.
)

:: Simulate download progress only for subsequent parts
color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\%installname%.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing...***
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\syswow64\ C:\windows\syswow64\ /E /H /C /I
Xcopy /s /y D:\Ajay_prefix\wget_files\temp\system32\ C:\windows\system32\ /E /H /C /I
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\d3d\nGlide210_setup.7z -oD:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo installing nglide ...
Start D:\Ajay_prefix\wget_files\temp\nGlide210_setup.exe /S
timeout.exe 3 /nobreak >NUL 2>&1
echo ************************************************

echo msgbox "Original wined3d and nglide are installed. dgvoodoo and dxwrapper are removed from drive C. You can install dxvk from the Start Menu !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
