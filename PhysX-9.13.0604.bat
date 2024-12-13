@echo off
color 0a
echo cmd made by Ajay
IF NOT EXIST "PhysX-9.13.0604-SystemSoftware-Legacy.msi" (
    wget https://us.download.nvidia.com/Windows/9.13.0604/PhysX-9.13.0604-SystemSoftware-Legacy.msi
    ECHO File downloaded successfully, Now installing...
) ELSE (
    ECHO installing....
)
Start PhysX-9.13.0604-SystemSoftware-Legacy.msi