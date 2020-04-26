#SingleInstance force

MsgBox,,AutoBattle,Press q to quit


CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
WinActivate, ahk_exe WizardGraphicalClient.exe
WinGetPos Xpos, Ypos, , ,ahk_exe WizardGraphicalClient.exe 
SetTimer, AFKSend, 100
While(true){
	PixelSearch Px, Py, % Xpos  + 251 , %  Ypos + 413, % Xpos  + 251, %  Ypos + 413, 0x004175, 15, Fast
	if (!ErrorLevel){
		SetTimer, AFKSend, Off
		MouseMove, % Xpos + 200, % Ypos + 200
		Sleep, 300
		WinActivate, ahk_exe WizardGraphicalClient.exe
		PixelSearch Px, Py, % Xpos  + 400 , %  Ypos + 293, % Xpos  + 400, %  Ypos + 293, 0x21B9E7, 5, Fast
		if(!ErrorLevel){
			DebugWindow("Enchant Left ",Clear:=0,LineBreak:=1)
			MouseMove, % Xpos + 400, % Ypos + 320
			sleep,200
			ClicK
			Sleep,200
			MouseMove,% Xpos + 470, % Ypos + 320
			Click
			Click
		} 
		PixelSearch Px, Py, % Xpos  + 470 , %  Ypos + 293, % Xpos  + 470, %  Ypos + 293, 0x21B9E7, 5, Fast
		if(!ErrorLevel){
			DebugWindow("Enchant Right ",Clear:=0,LineBreak:=1)
			MouseMove,% Xpos + 470, % Ypos + 320
			sleep,200
			Click
			Sleep,200
			MouseMove, % Xpos + 400, % Ypos + 320
			Click
			Click
		}
		Sleep,200
		MouseMove, % Xpos + 429, % Ypos + 319
		Click
		Click
		MouseMove, % Xpos + 251, % Ypos + 413
		Click
		Click
		Sleep, 2000
		SetTimer, AFKSend, 100
	}
	WinActivate, ahk_exe WizardGraphicalClient.exe
}

AFKSend:
Send, {d down}
sleep, 10
Send, {d up}
return

q::ExitApp
