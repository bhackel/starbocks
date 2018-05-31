#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text,, Toggle Hotkey:
Gui, Add, Text,, time delay:
Gui, Add, Edit, vhotkey ym  ; The ym option starts a new column of controls.
Gui, Add, Edit, vdelay
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show, w400 h225, its not hacks its just a macro
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
MsgBox, You chose the hotkey "%hotkey%"
MsgBox, The delay is "%delay%"
