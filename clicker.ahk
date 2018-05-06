#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

isruntruehaha := 1

~lbutton::scripts(isruntruehaha)
~+lbutton::scripts(isruntruehaha)
~^lbutton::scripts(isruntruehaha)
~!lbutton::scripts(isruntruehaha)
;~+^lbutton::scripts(isruntruehaha)
;~+^!lbutton::scripts(isruntruehaha)

scripts(isrun) {
	if (isrun = 1){
		while (GetKeyState("lbutton", "P")){
			sleep 40
			click left down
			sleep 40
			click left up
		}
	}
}



;toggle on/off
f12::
if (isruntruehaha) {
	isruntruehaha := 0  
} else {
	isruntruehaha := 1
}
return

;exitapp thing
+^C::ExitApp