#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text,, Toggle Hotkey (default f12): ;labeling text
Gui, Add, Text,, Time delay (default 40):
Gui, add, text,, Left click down for delay, then waits for a delay
gui, add, text,,  
gui, add, text,, Sometimes the clicker wont stop clicking.
gui, add, text,, When this happens, click once not fast
gui, add, text,, Close the script with Ctrl+Shift+C
Gui, Add, Edit, vhotkeys ym  ; adding variables with textboxes
Gui, Add, Edit, vdelay 
Gui, Add, Button, default, OKAYSOUNDSGOOD  ;Button to click
Gui, Add, Button, default, SoundOff  ;Button to click
Gui, Show, w400 h225, its not hacks its just a macro/starbucks
return
GuiClose:
	ExitApp
ButtonSoundOff:
	sound := false
return
ButtonOKAYSOUNDSGOOD:
	Gui, Submit  ; Save the input from the user to each control's associated variable.
	if (sound = "") {
		sound := true
	}
	
;msgbox, %sound%
;hotkeys := "f12"
;msgbox, %delay%

if (hotkeys = "") { ; Settings defaults
	hotkeys := "f12"
} 
if (delay = "") { 
	delay := 40 
}

Hotkey, %hotkeys%, ToggleOn ; Toggle on/off
return

ToggleOn:
	; msgbox, yes
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

run := true ; toggle on/off variable

~*$lbutton::scripts(run, delay) 

scripts(run, delay) {
	while (GetKeyState("lbutton", "P")){
		if (run = true){
			sleep %delay%
			click left down
			sleep %delay%
			click left up
		}
	}
}


+^C::ExitApp ;exitapp thing