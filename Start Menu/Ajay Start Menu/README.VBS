Option Explicit

Dim message1, message2, message3

' Page 1: Ajay Prefix README
message1 = "================ AJAY PREFIX README ================" & vbCrLf & vbCrLf & _
           "Please read the following important notes carefully:" & vbCrLf & vbCrLf & _
           "- Do not install any dependencies unless required." & vbCrLf & _
           "- The Ajay prefix does NOT break any games." & vbCrLf & _
           "  -> If a game is broken, it's most likely due to user error." & vbCrLf & _
           "- If a game freezes or doesn't launch, install the Visual C++ Redistributables." & vbCrLf & _
           "- If problems continue:" & vbCrLf & _
           "  -> Create a new container if the current one is broken." & vbCrLf & _
           "  -> In the new container, install only the Start Menu." & vbCrLf & _
           "  -> Do NOT install the Ajay prefix in the new container." & vbCrLf & vbCrLf & _
           "===================================================="

MsgBox message1, vbOKOnly + vbInformation, "Ajay Prefix Notice"

' Page 2: Dependency Installation Help + Recommended DLL Overrides
message2 = "========== DEPENDENCY INSTALLATION HELP ==========" & vbCrLf & vbCrLf & _
           "General advice before installing components:" & vbCrLf & vbCrLf & _
           "- Always test the game first without extras." & vbCrLf & _
           "- Avoid unnecessary DLLs that may cause conflicts." & vbCrLf & _
           "- Load all services if the game installation fails." & vbCrLf & _
           "- Check Wine logs for missing DLLs or crash details." & vbCrLf & vbCrLf & _
           "=================================================="

MsgBox message2, vbOKOnly + vbInformation, "Ajay Dependency Help"

' Page 3: Recommended Installs
message3 = "============== RECOMMENDED INSTALLS ==============" & vbCrLf & vbCrLf & _
           "Install the following components when needed:" & vbCrLf & vbCrLf & _
           "- Direct3D (part of DirectX)" & vbCrLf & _
           "- OpenAL" & vbCrLf & _
           "- PhysX" & vbCrLf & _
           "- Wine Mono and Gecko" & vbCrLf & _
           "- Missing DLLs for older games" & vbCrLf & _
           "- 'Install all vcredist DLLs' using the VC++ 2022 registry for all versions" & vbCrLf & _
           "  or use the 'Install VC All-in-One' Redist installer" & vbCrLf & _
           "- Install dxwrapper or dgVoodoo for older PC games" & vbCrLf & vbCrLf & _
           "=================================================="

MsgBox message3, vbOKOnly + vbInformation, "Ajay Recommended Installs"