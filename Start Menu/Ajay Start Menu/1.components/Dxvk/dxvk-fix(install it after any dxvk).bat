@echo off
echo for dxvk 2.0 and later
echo Installing dxvk-fix ..
echo This may fix some games like far cry3 
copy /s /y C:\windows\system32\d3d10core.dll C:\windows\system32\d3d10.dll /E /H /C /I
copy /s /y C:\windows\system32\d3d10core.dll C:\windows\system32\d3d10_1.dll /E /H /C /I
copy /s /y C:\windows\syswow64\d3d10core.dll C:\windows\syswow64\d3d10.dll /E /H /C /I
copy /s /y C:\windows\syswow64\d3d10core.dll C:\windows\syswow64\d3d10_1.dll /E /H /C /I
echo installed


echo ************************************************
pause
