@echo off
echo Configuring dmusic,dplay,dshow DLLs overrides as builtin,native ....
timeout.exe /t 2 /nobreak >nul 2>&1

for %%d in (
    amstream dmime dmloader dmscript dmstyle dmsynth dmusic dmusic32 dplay dplayx dpmodemx dpnet dpnhpast dpnhupnp dpwsockx dsound dswave qasf qcap qdvd qedit quartz
) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%d /t REG_SZ /d "builtin,native" /f >nul 2>&1
)

timeout.exe /t 6 /nobreak >nul 2>&1

for %%d in (
    amstream dmime dmloader dmscript dmstyle dmsynth dmusic dmusic32 dplay dplayx dpmodemx dpnet dpnhpast dpnhupnp dpwsockx dsound dswave qasf qcap qdvd qedit quartz
) do (
    reg add "HKCU\Software\Wine\DllOverrides" /v %%d /t REG_SZ /d "builtin,native" /f >nul 2>&1
)
timeout.exe /t 4 /nobreak >nul 2>&1
echo dmusic,dplay,dshow DLLs overrides configured successfully.
