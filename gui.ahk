#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Example: Tab control:

Gui, Add, Tab2,, Hotkey|Delay  ; Tab2 vs. Tab requires [v1.0.47.05+].
Gui, Margin, 50, 50
Gui, Color, 00FFFF
gui, font, s10, Verdana  ; Set 10-point Verdana
Gui, Add, Text,, Type a key to toggle on/off the script. Default is f12.
Gui, Add, Edit, vhotkeys r1
Gui, Tab, 2
Gui, Add, Text,, Enter a delay between clicks in milliseconds.
Gui, Add, Edit, vDelay r1
Gui, Tab, 3
Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.
MsgBox You entered:`n%hotkeys%`n%delay%
ExitApp