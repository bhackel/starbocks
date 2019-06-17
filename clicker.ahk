#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force


Gui, Add, Text,, Toggle Hotkey (default f12): ;labeling text
Gui, Add, Text,, Time delay (default 90):
Gui, add, text,, Left click down for delay, then waits for a delay
gui, add, text,,  
gui, add, text,, Close the script with Ctrl+Shift+C
Gui, Add, Edit, vhotkeys ym  ; adding variables with textboxes
Gui, Add, Edit, vdelay 
Gui, Add, Button, default gbutton_run w100 h30, Turn on  ;Button to click
Gui, Add, Button, w100 h30 gtoggle_sound, Toggle Sound  ;Button to click
Gui, Show, w400 h225, its not hacks its just starbucks
return

GuiClose:
   ExitApp
return

toggle_sound:
   sound = !sound
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

   Hotkey, %hotkeys%, ToggleOn ; Toggle on/off
   run := false ; toggle on/off 
   SetTimer, run_clicker, %delay%
   SetTimer, run_clicker, Off
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

#If run
~*lbutton::
   SetTimer, run_clicker, On,
return

~*lbutton Up::
   SetTimer, run_clicker, Off, 1
return
#If

run_clicker:
   click left down
   sleep 1
   click left up
return


+^c::ExitApp ;exitapp thing