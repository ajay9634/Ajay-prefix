@echo off
color 0a
echo cmd made by Ajay
del PhysX-9.13.0604-SystemSoftware-Legacy.msi
IF EXIST "PhysX-9.13.0604-SystemSoftware-Legacy.din" (
    copy PhysX-9.13.0604-SystemSoftware-Legacy.din PhysX-9.13.0604-SystemSoftware-Legacy.msi
    ECHO copying...
) ELSE (
    ECHO File not found, downloading....
)
IF NOT EXIST "PhysX-9.13.0604-SystemSoftware-Legacy.din" (
    wget https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi
    ECHO downloaded, installing...
) ELSE (
    ECHO installing....
)
copy PhysX-9.13.0604-SystemSoftware-Legacy.msi PhysX-9.13.0604-SystemSoftware-Legacy.din
Start /wait PhysX-9.13.0604-SystemSoftware-Legacy.msi