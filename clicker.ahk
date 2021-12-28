#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force


Gui, Add, Text,, Toggle Hotkey (default f12): ;labeling text
Gui, Add, Text,, Time delay (default 90):
Gui, add, text,, Delay after click before macro starts (default 200):
Gui, add, text,, Left click down for delay, then waits for a delay
gui, add, text,,  
gui, add, text,, Close the script with Ctrl+Shift+C
Gui, Add, Edit, vhotkeys ym  ; adding variables with textboxes
Gui, Add, Edit, vdelay 
Gui, Add, Edit, vstartupDelay
Gui, Add, Checkbox, vleftClick, Left click
Gui, Add, Checkbox, vrightClick, Right click
Gui, Add, Button, default gbutton_run w100 h30, Start  ;Button to click
Gui, Add, Button, w100 h30 gtoggle_sound, Toggle Sound  ;Button to click
Gui, Show, w400 h225, its not hacks its just starbucks
return

GuiClose:
   ExitApp
return

sound = true

toggle_sound:
   if (sound = true) {
      sound := false
   } else { 
      sound := true
   }
   Msgbox, Sound %sound%
return

button_run:
   Gui, Submit  ; Save the input from the user to each control's associated variable.
   if (sound = "") {
      sound := true
   }

   if (hotkeys = "") { ; Settings defaults
      hotkeys := "f12"
   } 
   if (delay = "") { 
      delay := 90
   }
   if (startupDelay = "") {
      startupDelay := 200
   }
   
   ;// Set up a hotkey to change state of run
   Hotkey, %hotkeys%, ToggleOn
   run := false
return

ToggleOn:
   if (run) {
      run := false
      if (sound) {
         SoundPlay, offShort.mp3,
      }
   } else {
      run := true
      if (sound) {
      SoundPlay, onShort.mp3,
      }
   }
return

$*~LButton::
    sleep %startupDelay%
    if (GetKeyState("LButton", "P") and run) {
        GoSub, AutoClick
    }
return

; Label for auto clicking
AutoClick:
	;// Click stuff with small delays
    if (leftClick = 1) {
        Click, Left, Down
        sleep 1
        Click, Left, Up
        sleep 1
    }
    if (rightClick = 1) {
        Click, Right, Down
        sleep 1
        Click, Right, Up
        sleep 1
    }
	; Run self again if mouse is still held down
	if GetKeyState("LButton", "P")
		SetTimer, AutoClick, -%delay%
return

+^C::ExitApp
