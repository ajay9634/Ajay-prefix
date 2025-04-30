@echo off
if exist "C:\windows\syswow64\dxwrapper.ini" (
    Start "" notepad.exe "C:\windows\syswow64\dxwrapper.ini"
timeout /t 1 >nul
echo msgbox "Hello! Edit the dxwrapper.ini file, set Dd7to9=1 and Dd8to9=1, then save it to ensure it works properly!" , vbinformation+vbSystemModal > %tmp%\tmp.vbs
cscript //nologo %tmp%\tmp.vbs
timeout /t 1 >nul
del %tmp%\tmp.vbs
) else (
    echo Config doesn't exist, install dxwrapper first.
    pause
)
timeout.exe /t 3 >nul
