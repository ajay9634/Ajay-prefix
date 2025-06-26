' CopyMove_FolderOnly.vbs - Final version (folder only, Wine-compatible)
Option Explicit

Dim shell, fso, sourceFolder, destFolder, sourcePath, destPath
Dim operationType, confirmAction, actionName

Set shell = CreateObject("Shell.Application")
Set fso = CreateObject("Scripting.FileSystemObject")

' Step 1: Ask Copy or Move
operationType = MsgBox("Click YES to COPY a folder, NO to MOVE a folder.", vbYesNoCancel + vbQuestion, "Select Operation")
If operationType = vbCancel Then WScript.Quit
If operationType = vbYes Then
    actionName = "COPY"
Else
    actionName = "MOVE"
End If

' Step 2: Select source folder only
Set sourceFolder = shell.BrowseForFolder(0, "Select SOURCE folder to " & actionName & ":", &H0011, 17)
If sourceFolder Is Nothing Then WScript.Quit
sourcePath = sourceFolder.Self.Path

' Step 3: Select destination folder
Set destFolder = shell.BrowseForFolder(0, "Select DESTINATION folder:", &H0011, 17)
If destFolder Is Nothing Then WScript.Quit
destPath = destFolder.Self.Path

' Step 4: Confirm action (ASCII-only)
confirmAction = MsgBox("Are you sure you want to " & actionName & " this folder:" & vbCrLf & vbCrLf & _
    sourcePath & vbCrLf & "  TO" & vbCrLf & destPath & vbCrLf & vbCrLf & _
    "Click OK to start, or Cancel to stop.", vbOKCancel + vbInformation, "Confirm and Start")
If confirmAction = vbCancel Then WScript.Quit

' Step 5: Perform operation (with fallback for MOVE)
On Error Resume Next
If operationType = vbYes Then
    fso.CopyFolder sourcePath, destPath & "\", True
Else
    fso.MoveFolder sourcePath, destPath & "\", True
    If Err.Number <> 0 Then
        Err.Clear
        fso.CopyFolder sourcePath, destPath & "\", True
        fso.DeleteFolder sourcePath, True
    End If
End If
On Error GoTo 0

' Step 6: Final message
MsgBox "Copied source folder to destination folder.", vbInformation, "Done"