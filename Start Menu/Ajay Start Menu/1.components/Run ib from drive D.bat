@echo off
:: Minimize the window when the script is run
start /min "" cmd /c "
    copy /Y "D:\InputBridge\installer\ib.exe" "C:\windows\ib.exe" >nul 2>&1
    copy /Y "D:\Download\InputBridge\installer\ib.exe" "C:\windows\ib.exe" >nul 2>&1
    
IF EXIST "C:\windows\ib.exe" (
    start "" "C:\windows\ib.exe"
) ELSE (
    echo ib.exe not found in drive D or download folder
pause
)
