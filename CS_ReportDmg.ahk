;Created By valleyman86

#Persistent

PlayerName := "MurderDev.com"
ConsolePath := "C:\Program Files (x86)\Steam\SteamApps\common\Counter-Strike Global Offensive\csgo\console.log"
ExecPath := "C:\Program Files (x86)\Steam\SteamApps\common\Counter-Strike Global Offensive\csgo\cfg\scriptexec.cfg"

AutoTrim, On

SetTimer MonitorConsoleLog, 500
EraseConsoleLog(ConsolePath)
File := FileOpen(ConsolePath, "r")
File.Seek(0, 2)
Size0 := File.Length

EraseConsoleLog(filePath)
{
    FileToErase := FileOpen(filePath, "w")
    FileToErase.Write("")
    FileToErase.Close()
}

MonitorConsoleLog:
    Size := File.Length
 
    If (Size0 >= Size) {
       Size0 := Size
       File.Seek(0, 2)
       Return
    }
 
    global Started
    global DamageString := "Damage Given To: "

    while (LastLine := File.ReadLine()) {
       	if (!Started && RegExMatch(LastLine,"i)-------------------------")) {
            Started := true
        } else if (Started && RegExMatch(LastLine,"i)-------------------------")) {
            Started := false
	    ;MsgBox %DamageString%
            if (DamageString <> "Damage Given To: ") {
                FileDelete %ExecPath%
                FileAppend bind "SEMICOLON" "say_team %DamageString%", %ExecPath%
                SendInput '
                ;Sleep, 50
                ;SendInput {;}
            }
        }

	if (Started && RegExMatch(LastLine,"i)Damage Given to ""(.*)"" - ([0-9]+).*", Damage)) {
            if ((Damage1 <> PlayerName) && (Damage2 > 50) && (Damage2 < 100)) {
	        DamageString := DamageString . Damage1 . "(" . Damage2 . ") "
            }
	}
    }
 
   Size0 := Size
Return