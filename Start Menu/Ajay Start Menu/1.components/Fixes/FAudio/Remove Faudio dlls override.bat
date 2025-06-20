@echo off
color 0c
echo ==========================================================
echo     [STEP] Removing FAudio DLL Overrides from Wine
echo ==========================================================

setlocal EnableDelayedExpansion

set KEY="HKCU\Software\Wine\DllOverrides"

for %%D in (
    x3daudio1_0 x3daudio1_1 x3daudio1_2 X3DAudio1_3 X3DAudio1_4 X3DAudio1_5 X3DAudio1_6 X3DAudio1_7
    xactengine2_0 xactengine2_1 xactengine2_2 xactengine2_3 xactengine2_4 xactengine2_5 xactengine2_6 xactengine2_7 xactengine2_8 xactengine2_9 xactengine2_10
    xactengine3_0 xactengine3_1 xactengine3_2 xactengine3_3 xactengine3_4 xactengine3_5 xactengine3_6 xactengine3_7
    XAPOFX1_0 XAPOFX1_1 XAPOFX1_2 XAPOFX1_3 XAPOFX1_4 XAPOFX1_5
    XAudio2_0 XAudio2_1 XAudio2_2 XAudio2_3 XAudio2_4 XAudio2_5 XAudio2_6 XAudio2_7
) do (
    reg delete %KEY% /v %%D /f >nul 2>&1
    if !errorlevel! == 0 (
        echo [ OK  ] Removed override for %%D
    ) else (
        echo [SKIP] Override for %%D not found
    )
)

echo.
echo ==========================================================
echo     [INFO] All FAudio DLL overrides processed.
echo ==========================================================
endlocal
pause