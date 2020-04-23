#SingleInstance force
WinActivate, ahk_exe WizardGraphicalClient.exe

InputBox, Times, Setup, Please enter number of games to play`nPress q to quit
If(ErrorLevel){
    Exit
}
WinActivate, ahk_exe WizardGraphicalClient.exe
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
WinGetPos Xpos, Ypos, , , Wizard101

Games = 1
While Games <= Times
{
   Send {x}
   Sleep, 400
   CoordMode, Screen
   
   WinGetActiveTitle, WinTitle
   BlockInput, On
   MouseGetPos, posx, posy
   WinActivate, ahk_exe WizardGraphicalClient.exe 
   
   MouseMove, % Xpos + 632, % Ypos + 491, 0
   Click
   Click
   Sleep, 400
   
   MouseGetPos, posx, posy
   MouseMove, % Xpos + 627 , % Ypos + 588 , 0
   Click
   Click
   WinActivate, %WinTitle%
   MouseMove, posx, posy, 0
   BlockInput, Off
   
   MoveArray := []
   PixelGetColor, color, % Xpos + 400 , % Ypos + 530
   While  color != 0xC2DBEB ;Wait until minigame has loaded
   {
	  PixelGetColor, color,% Xpos + 400,% Ypos + 530
	  Sleep, 20
   }
   FileAppend "Game Starting... "`n, *
   rounds = 2
   while rounds <= 6
   {
	  Moves = 0
	  ;Get Moves
	  while Moves <= rounds
	{
		 PixelSearch Px, Py, % Xpos  + 402 , %  Ypos + 545, % Xpos  + 402, %  Ypos + 545, 0x5AE7F3, 15, Fast
		 if !ErrorLevel
		{
			;Up or Down
			PixelSearch Px, Py, % Xpos + 402, % Ypos + 578, % Xpos + 402 ,% Ypos + 578, 0x085B69, 15, Fast
			if !ErrorLevel {
				FileAppend UP`n, *
				 MoveArray[Moves] := "Up"
			} else{
				FileAppend DOWN`n, *
			   MoveArray[Moves] := "Down"
			}
			Moves++
			Sleep, 200
		 }
		 
		 PixelSearch Px, Py, % Xpos + 389, % Ypos + 560,  % Xpos + 389, % Ypos + 560, 0x2Ac8d5, 15, Fast
		 if !ErrorLevel 
		{
			;Left or Right
			PixelSearch Px, Py, % Xpos + 423, % Ypos + 560, % Xpos + 423, % Ypos + 560, 0x142f34, 15, Fast
			if !ErrorLevel {
			   FileAppend Right`n, *
			   MoveArray[Moves] := "Right"
			} else {
			   FileAppend Left`n, *
			    MoveArray[Moves] := "Left"
			}
			Moves++
			Sleep, 200
		 }
	  }
	  ;Execute Moves
	  Sleep, 500
	  
	  WinGetActiveTitle, WinTitle
	  BlockInput,On
	  WinActivate, ahk_exe WizardGraphicalClient.exe
	  i = 0
	  WinGet, winid
	  While i <= Moves
	  {
		 if MoveArray[i] == "Down"
		{
			 FileAppend Sending Down`n, *
			 SendInput {s}
			 Sleep, 150
		 } else if MoveArray[i] == "Up" {
			 FileAppend Sending Up`n, *
			 SendInput {w}
			Sleep, 150
		 } else if MoveArray[i] == "Right" {
			 FileAppend Sending Right`n, *
			 SendInput {d}
			Sleep, 150
		 } else if MoveArray[i] == "Left" {
			 FileAppend Sending Left`n, *
			 SendInput {a}
			 Sleep, 150
		 }
		  i++
	 }
	 WinActivate, %WinTitle%
		BlockInput,Off
   rounds++
}

    Sleep, 2500 ;Lazy wait for loading
	
	MouseMove, % Xpos + 620 ,% Ypos + 588, 0
    Click ;Next
	Click
    Sleep, 400
	
	MouseMove, % Xpos + 174 ,% Ypos + 487, 0
    Click ;Snack Select
	Click
    Sleep, 400
	
    MouseMove, % Xpos + 620 ,% Ypos + 588, 0
    Click ;Feed Pet
	Click
    Sleep, 400
	
    MouseMove, % Xpos + 184 ,% Ypos + 588, 0
    Click ;Exit
	Click
   
   Loaded := False
   While(!Loaded){
		PixelSearch, Px, Py, % Xpos + 239, % Ypos + 537, % Xpos + 239, % Ypos + 537, 0xB576EF, 5, Fast
		If !ErrorLevel {
			Loaded := True
		}Else{
			Sleep, 50
		}
	}
   Games++
}
ExitApp

q::ExitApp