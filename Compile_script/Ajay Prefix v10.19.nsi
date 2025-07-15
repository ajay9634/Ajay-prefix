Outfile "Ajay_Prefix_v10.19_Setup.exe"
InstallDir "C:\Windows\Temp"
RequestExecutionLevel admin
Name "Ajay Prefix v10.19"

Section "Extract and Run BAT"

    SetOutPath "$INSTDIR"

    !cd "D:\New folder"
    File /r "*.*"

    ; Run VBScript using wscript.exe (better than ExecShell)
    Exec '"$SYSDIR\wscript.exe" "$INSTDIR\drive_choice.vbs"'

    ; Close installer immediately
    Quit

SectionEnd
