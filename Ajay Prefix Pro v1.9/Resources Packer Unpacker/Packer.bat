@echo off
set "UHARC_EXE=C:\Program Files (x86)\UHARC CMD\bin\uharc.exe"

echo ============================================
echo      AJAY PREFIX PRO - FAST PACKER
echo ============================================

:: Step 1: Input names
set /p "SRC=Enter Folder Name: "
set /p "OUT=Enter Output Name (ex: Data.pkd): "

echo.
echo [>] Searching and Packing...
echo --------------------------------------------

:: The key fix is adding "\*.*" to the end of the folder name
:: -m0 is the "Very Fast" (Store) mode
"%UHARC_EXE%" a -r+ -m0 -y "%OUT%" "%SRC%\*.*"

echo.
if exist "%OUT%" (
    echo [OK] Success! %OUT% was created.
) else (
    echo [!] Failed. UHARC couldn't find files in: %SRC%
)

pause
