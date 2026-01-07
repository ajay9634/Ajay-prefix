; --------------------------------
; Ajay Prefix Pro v1.3 Installer - Stable Menu
; --------------------------------

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "LogicLib.nsh"

; --------------------------------
; General Settings
Name "Ajay Prefix Pro v1.3"
OutFile "Ajay Prefix Pro v1.3 Installer.exe"
RequestExecutionLevel admin
InstallDir "C:\" 

; --------------------------------
; Variables
Var Dialog
Var OptionRun
Var OptionTaskMgr
Var OptionWFM
Var OptionInstall

; --------------------------------
; Modern UI Pages
Page custom OptionsPage OptionsPageLeave 
!insertmacro MUI_PAGE_INSTFILES 

!insertmacro MUI_LANGUAGE "English"

; --------------------------------
; Custom Menu Page
Function OptionsPage
  ; Change "Cancel" button to "Exit"
  GetDlgItem $0 $HWNDPARENT 2
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Exit"

  ; Change "Next" button to "Execute"
  GetDlgItem $0 $HWNDPARENT 1
  SendMessage $0 ${WM_SETTEXT} 0 "STR:Execute"

  SendMessage $HWNDPARENT ${WM_SETTEXT} 0 "STR:Ajay Prefix Pro v1.3 Setup"

  nsDialogs::Create 1018
  Pop $Dialog

  ${If} $Dialog == error
    Abort
  ${EndIf}

  ${NSD_CreateLabel} 0 0 100% 30u "Welcome to Ajay Prefix Pro v1.3.$\r$\nSelect an action and click Execute. Select Exit when finished."
  Pop $0

  ${NSD_CreateRadioButton} 10u 40u 90% 12u "Run Ajay Start Menu Pro Viewer"
  Pop $OptionRun
  ${NSD_AddStyle} $OptionRun ${WS_GROUP}

  ${NSD_CreateRadioButton} 10u 55u 90% 12u "Run Task Manager"
  Pop $OptionTaskMgr

  ${NSD_CreateRadioButton} 10u 70u 90% 12u "Run wfm auto run"
  Pop $OptionWFM

  ${NSD_CreateRadioButton} 10u 85u 90% 12u "Install Ajay Prefix Pro"
  Pop $OptionInstall

  nsDialogs::Show
FunctionEnd

Function OptionsPageLeave
  ; 1. Run Viewer (Loop back to menu)
  ${NSD_GetState} $OptionRun $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat" 0 +3
      ExecShell "open" "C:\AJAY_PREFIX_PRO\Ajay_Scripts\AjayStartMenuPro.bat"
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "Viewer not found!"
    Abort
  ${EndIf}

  ; 2. Run Task Manager (Loop back to menu)
  ${NSD_GetState} $OptionTaskMgr $0
  ${If} $0 == ${BST_CHECKED}
    Exec "taskmgr.exe"
    Abort 
  ${EndIf}

  ; 3. Run WFM (Loop back to menu)
  ${NSD_GetState} $OptionWFM $0
  ${If} $0 == ${BST_CHECKED}
    IfFileExists "C:\Windows\wfm2_auto_run.bat" 0 +3
      ExecShell "open" "C:\Windows\wfm2_auto_run.bat"
      Abort 
    MessageBox MB_OK|MB_ICONEXCLAMATION "wfm2_auto_run.bat not found!"
    Abort
  ${EndIf}

  ; 4. Install (Proceed to Section and Exit)
  ${NSD_GetState} $OptionInstall $0
  ${If} $0 == ${BST_CHECKED}
    Return ; Moves to Section "Main"
  ${EndIf}

  Abort
FunctionEnd

; --------------------------------
; Main Execution
Section "Main"
  ; Set the status text so the user knows what's happening
  SetDetailsPrint textonly
  DetailPrint "Installing Ajay Prefix Pro..."
  
  SetOutPath "C:\"
  File /r "Setup\*.*"
  
  IfFileExists "C:\temp\Setup.bat" 0 +3
    ; ExecWait ensures the batch finishes before the installer closes
    ExecWait '"C:\windows\System32\cmd.exe" /c "C:\temp\Setup.bat"'
    Goto +2
  MessageBox MB_OK|MB_ICONEXCLAMATION "Setup.bat not found!"

  ; No SendMessage here! 
  ; This allows the installer to finish and exit naturally.
    SectionEnd
    
