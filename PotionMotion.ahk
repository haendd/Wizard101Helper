#SingleInstance force
WinActivate, ahk_exe WizardGraphicalClient.exe
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

InputBox, Times, Setup, Please enter number of games to play`nPress q to quit
If(ErrorLevel){
    Exit
}

WinGetPos Xpos, Ypos, , , Wizard101

   Send {x}
   Sleep, 400
   
 MouseMove, % Xpos + 463 , % Ypos + 359, 0
   Sleep, 10
   Click
   Click
   Sleep, 400
   
   
Games = 1
While Games <= Times
{
   Loaded := False
   While(!Loaded){
		PixelSearch, Px, Py, % Xpos + 767 , % Ypos + 299, % Xpos + 767, % Ypos + 299, 0x70b3d4, 5, Fast
		If !ErrorLevel {
			Loaded := True
		}Else{
			Sleep, 50
		}
	}
	Sleep, 800
	MouseMove, % Xpos + 415 , % Ypos + 594, 0
    Click
    Click
	Sleep, 400
	
	 
   Loaded := False
   While(!Loaded){
		PixelSearch, Px, Py, % Xpos + 677 , % Ypos + 218, % Xpos + 677, % Ypos + 218, 0xE6be76, 5, Fast
		If !ErrorLevel {
			Loaded := True
		}Else{
			Sleep, 50
		}
	}
	
	MouseMove, % Xpos + 415 , % Ypos + 594, 0
	Sleep, 10
    Click
    Click
	Sleep, 400
   
    Loaded := False
    While(!Loaded){
		PixelSearch, Px, Py, % Xpos + 761 , % Ypos + 543, % Xpos + 761, % Ypos + 543, 0x50D7ff, 5, Fast
		If !ErrorLevel {
			Loaded := True
		}Else{
			i := 0
		    Xstart := 216
			Xchange := 61
			YChange := 61
			Ystart  := 176
		    while i <= 6
			{
				j = 1
				while j <= 5 {
					MouseClickDrag, Left,  % Xpos + Xstart + (i*Xchange) , % Ypos + Ystart, % Xpos + Xstart + (i*Xchange) , % Ypos + Ystart + (j*Ychange), 0
				j++
				}
				if i != 6
				{
				j = 1
				while j <= 6 {
					MouseClickDrag, Left,  % Xpos + Xstart, % Ypos + Ystart + (i*Ychange), % Xpos + Xstart + (j*Xchange), % Ypos + Ystart  + (i*Ychange)  , 0
				j++
				}
			}
			i++
			}
		}
	}


Sleep 5000
MouseMove, % Xpos + 403 , % Ypos + 327, 0
	Sleep, 10
    Click
    Click
	Sleep, 2000
Games++
}

q::ExitApp