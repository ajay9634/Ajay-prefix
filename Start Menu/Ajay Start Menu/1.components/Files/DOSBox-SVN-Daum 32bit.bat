@echo off
color 0a
echo *** Enjoy Dosbox games ***
echo *** script made by Ajay ***

:: Simulating bold with color and emphasis
color 0A
echo.
echo *** Downloading DOSBox-SVN-Daum ***
IF NOT EXIST "D:\Ajay_prefix\wget_files\Files\DOSBox-SVN-Daum.7z" (
    wget -P D:/Ajay_prefix/wget_files/temp/ --progress=dot:mega https://raw.githubusercontent.com/ajay9634/Ajay-prefix/Resources/My-files/DOSBox-SVN-Daum.7z
    copy /s /y D:\Ajay_prefix\wget_files\temp\DOSBox-SVN-Daum.7z D:\Ajay_prefix\wget_files\Files\DOSBox-SVN-Daum.7z /E /H /C /I
) ELSE (
    ECHO DOSBox-SVN-Daum already exists.
)


color 1f
echo *** Extracting ...***
D:\Ajay_prefix\.Resources\7z.exe x D:\Ajay_prefix\wget_files\Files\DOSBox-SVN-Daum.7z -oD:\Ajay_prefix\wget_files\my_apps\ -r -y >NUL 2>&1

echo *** opening dosbox-32bit ***
Start D:\Ajay_prefix\wget_files\my_apps\DOSBox-SVN-Daum\dosbox.exe
echo ************************************************
