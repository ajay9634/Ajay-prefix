@echo off
echo Select dx version :-
echo.
echo 1 - dx6.1_reg(win98 SE)
echo 2 - dx7_reg(directx7_redist)
echo 3 - dx8_reg(winXP)
echo 4 - dx9_reg(default)
echo.
set /p choice="Press number key: "

if /i "%choice%"=="1" (
    title dx6.1_reg
    goto dx6
)

if /i "%choice%"=="2" (
    title dx7_reg
    goto dx7
)

if /i "%choice%"=="3" (
    title dx8_reg
    goto dx8
)

if /i "%choice%"=="4" (
    title dx9_reg
    goto dx9
)

echo Invalid choice. Exiting...
pause
exit /b

:dx6
echo updating dx version registry ...
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1

timeout.exe /t 4 >nul

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.06.03.0512" /f >nul 2>&1

timeout.exe /t 3 >nul
goto end

:dx7
echo updating dx version registry ...
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1

timeout.exe /t 4 >nul

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.07.00.0700" /f >nul 2>&1

timeout.exe /t 3 >nul
goto end

:dx8
echo updating dx version registry ...
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1

timeout.exe /t 4 >nul

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.08.01.0881" /f >nul 2>&1

timeout.exe /t 3 >nul

goto end

:dx9
echo updating dx version registry ...
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1

timeout.exe /t 4 >nul

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1

reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectX" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectPlay" /v Version /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v DirectXVersion /t REG_SZ /d "4.09.00.0904" /f >nul 2>&1

timeout.exe /t 3 >nul

goto end

:end
echo Done.
exit /b