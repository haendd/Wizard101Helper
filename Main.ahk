#SingleInstance Force
#Persistent
#NoEnv
SetWorkingDir %A_ScriptDir%

IniRead, DanceHkey, settings.ini, Application, DanceHkey
if (DanceHkey <> "ERROR") or (DanceHkey <> "")
	Hotkey, % DanceHkey, Dance, UseErrorLevel ON
IniRead, AFKHkey, settings.ini, Application, AFKHkey
if (AFKHkey <> "ERROR") or (AFKHkey <> "")
	Hotkey, % AFKHkey, AFK, UseErrorLevel 
IniRead, PotionHkey, settings.ini, Application, PotionHkey
if (PotionHkey <> "ERROR") or (PotionHkey <> "")
	Hotkey, % PotionHkey, Potion, UseErrorLevel 
IniRead, BattleOneHkey, settings.ini, Application, BattleOneHkey
if (BattleOneHkey <> "ERROR") or (BattleOneHkey <> "")
	Hotkey, % BattleOneHkey, BattleOne, UseErrorLevel ON


DanceHkeyOldest := DanceHkey
AFKHKeyOldest := AFKHkey
PotionHKeyOldest := 
BattleOneHKeyOldest := BattleOneHkey



AFKState := false


Gui, Margin, 8, 8
Gui, Add,Text,,Dance Game Bot:
Gui, Add, Hotkey, w100 gDanceHKey VDanceHkey, % DanceHkey
Gui, Add,Text,,AFK Mode:
Gui, Add, Hotkey, w100 gAFKHKey VAFKHkey, % AFKHkey
Gui, Add,Text,,Potion Motion Game Bot:
Gui, Add, Hotkey, w100 gPotionHKey VPotionHkey, % PotionHkey
Gui, Add,Text,,Auto-Battle One:
Gui, Add, Hotkey, w100 gBattleOneHKey VBattleOneHkey, % BattleOneHkey
Gui, Add, Button, gSave, Save
return

F9::
Gui,Show,Autosize,Options
return

Save:
IniWrite, % DanceHkey, settings.ini, Application, DanceHkey
IniWrite, % AFKHkey, settings.ini, Application, AFKHkey
IniWrite, % PotionHkey, settings.ini, Application, PotionHkey
IniWrite, % BattleOneHkey, settings.ini, Application, BattleOneHkey

Gui,Hide
return

F10::
ExitApp
return

DanceHKey:
HClear := DanceHkey
If (StateDanceHkey == "On") {
	DanceHkeyOldest := HClear
	StateDanceHkey := "Off"
	Hotkey, %DanceHkeyOldmost%, OFF, UseErrorLevel OFF
} Else {
	DanceHkeyOldmost := HClear
	StateDanceHkey := "On"
	Hotkey, %DanceHkeyOldest%, OFF, UseErrorLevel OFF
}
Hotkey, %DanceHkey%, Dance, UseErrorLevel ON
return

Dance:
Msgbox, Please set the game resolution to 800X600 and the UI size to HUGE before clicking Ok
RunWait, DanceBot.ahk
return

AFKHKey:
HClear := AFKHkey
If (StateAFKHkey == "On") {
	AFKHKeyOldest := HClear
	StateAFKHkey := "Off"
	Hotkey, %AFKHKeyOldmost%, OFF, UseErrorLevel OFF
} Else {
	AFKHKeyOldmost := HClear
	StateAFKHkey := "On"
	Hotkey, %AFKHKeyOldest%, OFF, UseErrorLevel OFF
}
Hotkey, %AFKHkey%, AFK, UseErrorLevel ON
return

AFK:
AFKState := !AFKState
if(AFKState){
	SetTimer, AFKSend, 100
}
Else {
	SetTimer, AFKSend, Off
}
return

AFKSend:
Send, {d down}
sleep, 10
Send, {d up}
return

PotionHKey:
HClear := PotionHkey
If (StatePotionHkey == "On") {
	PotionHKeyOldest := HClear
	StatePotionHkey := "Off"
	Hotkey, %PotionHKeyOldmost%, OFF, UseErrorLevel OFF
} Else {
	PotionHKeyOldmost := HClear
	StatePotionHkey := "On"
	Hotkey, %PotionHKeyOldest%, OFF, UseErrorLevel OFF
}
Hotkey, %PotionHkey%, Potion, UseErrorLevel ON
return

Potion:
RunWait, PotionMotion.ahk
return


BattleOneHKey:
HClear := BattleOneHkey
If (StateBattleOneHkey == "On") {
	BattleOneHKeyOldest := HClear
	StateBattleOneHkey := "Off"
	Hotkey, %BattleOneHKeyOldmost%, OFF, UseErrorLevel OFF
} Else {
	BattleOneHKeyOldmost := HClear
	StateBattleOneHkey := "On"
	Hotkey, %BattleOneHKeyOldest%, OFF, UseErrorLevel OFF
}
Hotkey, %BattleOneHkey%, BattleOne, UseErrorLevel ON
return

BattleOne:
AutoBattleOne.ahk
return