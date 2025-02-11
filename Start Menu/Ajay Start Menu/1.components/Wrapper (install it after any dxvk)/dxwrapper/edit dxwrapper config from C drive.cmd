@echo off
if exist "C:\windows\syswow64\dxwrapper.ini" (
    notepad.exe "C:\windows\syswow64\dxwrapper.ini"
) else (
    echo Config doesn't exist, install dxwrapper first.
    pause
)
