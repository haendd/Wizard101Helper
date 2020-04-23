#SingleInstance force
WinActivate, Wizard101
InputBox, Times, Setup, Please enter number of games to play`nPress q to quit
If(ErrorLevel){
    Exit
}
WinActivate, Wizard101
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
WinGetPos Xpos, Ypos, , , Wizard101 ; 796, 150
ClientPos := Array(Xpos, Ypos)
FileAppend %Ypos%`n, *
Games = 1
While Games <= Times
{
   Send {x}
   Sleep, 400
   CoordMode, Screen
   
   WinGet, winid
   BlockInput, MouseMove
   MouseGetPos, posx, posy
   WinActivate Wizard101
   x := Xpos + 632
   y := Ypos + 491   
   MouseMove, %x% ,%y%, 0
   Click
   Click
   MouseMove, posx, posy, 0
   BlockInput, MouseMoveOff
   WinActivate, winid
   Sleep, 200
   WinGet, winid
   BlockInput, MouseMove
   MouseGetPos, posx, posy
   x := Xpos + 627
   y := Ypos + 588
   WinActivate Wizard101
    MouseMove, %x%, %y%, 0
   Click
   Click
   WinActivate, %winid%
   MouseMove, posx, posy, 0
   BlockInput, MouseMoveOff
   

   MoveArray := []
   x := Xpos + 400
   y := Ypos + 530
   PixelGetColor, color,  x, y
   While  color != 0xC2DBEB ;Wait until minigame has loaded
   {
	  PixelGetColor, color, x, y
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
		 x := Xpos  + 402
		 y := Ypos + 545
		 PixelSearch Px, Py, x , y, x, y, 0x5AE7F3, 15, Fast
		 if !ErrorLevel
		{
			;Up or Down
			x := Xpos + 402
		    y := Ypos + 578
			PixelSearch Px, Py, x, y, x ,y , 0x085B69, 15, Fast
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
		 x := Xpos + 389
		 y := Ypos + 560
		 PixelSearch Px, Py, x, y, x, y, 0x2Ac8d5, 15, Fast
		 if !ErrorLevel 
		{
			;Left or Right
			 x := Xpos + 423
		     y := Ypos + 560
			PixelSearch Px, Py, x, y, x, y, 0x142f34, 15, Fast
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
	  BlockInput,On
	  WinGetActiveTitle, WinTitle
	  WinActivate, Wizard101
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
    x := Xpos + 620
    y := Ypos + 588
	MouseMove, %x% ,%y%, 0
   Click ;Next
   Click
   Sleep, 200
	x := Xpos + 174
    y := Ypos + 487
	MouseMove, %x% ,%y%, 0
    Click ;Snack Select
	Click
   Sleep, 200
   x := Xpos + 620
   y := Ypos + 588
   MouseMove, %x% ,%y%, 0
   Click ;Feed Pet
   Click
   Sleep, 200
   x := Xpos + 184
   y := Ypos + 588
   MouseMove, %x% ,%y%, 0
   Click ;Exit
   Click
   
   Loaded := False
   While(!Loaded){
	     x := Xpos + 720
		 y := Ypos + 590
		PixelGetColor, color,  x, y
		PixelSearch, Px, Py, x, y, x, y, 0x332b64, 3, Fast
		If !ErrorLevel {
			Loaded := True
		}Else{
			Sleep, 50
		}
	}
   Games++
}
q::ExitApp