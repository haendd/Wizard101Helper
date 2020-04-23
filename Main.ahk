#SingleInstance Force
#Persistent
#NoEnv
SetWorkingDir %A_ScriptDir%

IniRead, HKey, settings.ini, Application, MyHotkey
if (HKey <> "ERROR") or (HKey <> "")
	Hotkey, % HKey, Dance, UseErrorLevel ON
IniRead, HKey2, settings.ini, Application, MyHotkey2
if (HKey2 <> "ERROR") or (HKey2 <> "")
	Hotkey, % HKey2, AFK, UseErrorLevel ON

HKeyOldest := Hkey
HKeyOldest2 := Hkey2
AFKState := false


Gui, Margin, 8, 8
Gui, Add,Text,,Dance Game Bot:
Gui, Add, Hotkey, w100 gOneHotkey VHkey, % HKey
Gui, Add,Text,,AFK Mode:
Gui, Add, Hotkey, w100 gOneHotkey2 VHkey2, % HKey2
Gui, Add, Button, gSave, Save
return

F9::
Gui,Show,Autosize,Options
return

Save:
IniWrite, % Hkey, settings.ini, Application, MyHotkey
IniWrite, % Hkey2, settings.ini, Application, MyHotkey2
Gui,Hide
return

F12::
ExitApp
return

OneHotkey:
HClear := Hkey
If (StateHKey == "On") {
	HKeyOldest := HClear
	StateHKey := "Off"
	Hotkey, %HKeyOldmost%, OFF, UseErrorLevel OFF
} Else {
	HKeyOldmost := HClear
	StateHKey := "On"
	Hotkey, %HKeyOldest%, OFF, UseErrorLevel OFF
}
Hotkey, %HKey%, Dance, UseErrorLevel ON
return

Dance:
Msgbox, Please set the game resolution to 800X600 and the UI size to HUGE before clicking Ok
RunWait, DanceBot.ahk
return

OneHotkey2:
HClear2 := Hkey2
If (StateHKey2 == "On") {
	HKeyOldest2 := HClear2
	StateHKey2 := "Off"
	Hotkey, %HKeyOldmost2%, OFF, UseErrorLevel OFF
} Else {
	HKeyOldmost2 := HClear2
	StateHKey2 := "On"
	Hotkey, %HKeyOldest2%, OFF, UseErrorLevel OFF
}
Hotkey, %HKey2%, AFK, UseErrorLevel ON
return

AFK:
AFKState := !AFKState
if(AFKState){
	SetTimer, AFKSend, 50
}
Else {
	SetTimer, AFKSend, Off
}
return

AFKSend:
Send, {d}
return