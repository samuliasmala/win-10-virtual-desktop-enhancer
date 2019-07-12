#Include, %A_ScriptDir%\virtual-desktop-enhancer.ahk


#§::Run, C:\Users\samul\AppData\Local\Microsoft\WindowsApps\ubuntu.exe


; Text–only paste from ClipBoard in Word, Excel and PowerPoint only
#IfWinActive ahk_class OpusApp
^v::
#IfWinActive ahk_class XLMAIN
^v::
#IfWinActive ahk_class PPTFrameClass
^v::
  Clip0 = %ClipBoardAll%
  ClipBoard = %ClipBoard%       ; Convert to text
  Send ^v                       ; For best compatibility: SendPlay
  Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
  ClipBoard = %Clip0%           ; Restore original ClipBoard
  VarSetCapacity(Clip0, 0)      ; Free memory
Return
#IfWinActive


; Find out the window class to create window-specific hotkeys
!^T::
WinGetClass, class, A
MsgBox, The active window's class is "%class%".
return