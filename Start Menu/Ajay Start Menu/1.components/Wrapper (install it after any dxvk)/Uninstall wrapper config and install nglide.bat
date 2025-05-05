@echo off
call "C:\Windows\Ajay_drive.bat" >nul 2>&1
if not defined drive_letter set drive_letter=D
color 0a
echo *** wait....***
echo *** deleting files...***
rmdir /S /Q "%drive_letter%:/Ajay_prefix/wget_files/temp"
mkdir "%drive_letter%:/Ajay_prefix/wget_files/temp"
del "C:\windows\system32\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodooCpl.exe" >NUL 2>&1
del "C:\windows\syswow64\dgVoodoo.conf" >NUL 2>&1
del "C:\windows\system32\dgVoodoo.conf" >NUL 2>&1
del "C:\windows\syswow64\d3dImm.dll" >NUL 2>&1
del "C:\windows\syswow64\dxwrapper.dll" >NUL 2>&1
del "C:\windows\syswow64\dxwrapper.ini" >NUL 2>&1

echo *** deleted wrapper config files ***
%drive_letter%:\Ajay_prefix\.Resources\7z.exe x %drive_letter%:\Ajay_prefix\wget_files\d3d\nGlide210_setup.7z -o%drive_letter%:\Ajay_prefix\wget_files\temp\ -p-q -r -y >NUL 2>&1
echo *** installing nglide ... ***
Start %drive_letter%:\Ajay_prefix\wget_files\temp\nGlide210_setup.exe /S
timeout.exe 3 /nobreak >NUL 2>&1
echo ************************************************

echo msgbox "nglide is installed. dgvoodoo and dxwrapper config are removed from drive C. You can install any wined3d to restore ddraw, dx8, dx9 etc or install latest dxvk to fix dx8 , dx9 etc  from the Start Menu !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
