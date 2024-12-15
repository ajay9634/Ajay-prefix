@echo off
echo msgbox "Hello! Ajay Prefix components are updated successfully, Changelog and Files are saved to drive_D/Ajay_prefix/wget_files/ !" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
