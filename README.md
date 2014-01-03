EasyDMGReport
============

Easily report damage done in a round after you die with a set hotkey (currently defaults to semicolon [;]).

This script can be run (or compiled actually) from AutoHotKey. I am not going to release the compiled version because I do not want people thinking I hacked their computers... and I'm not sure what the rules are. If you do compile it then that means you don't need AHK installed to use the script. 

Anyhow this script does not read memory or do anything with the actual client so no reason anyone would get banned for this of course. You can edit out what you like if you want. I commented stuff a bit so you can see what to remove. 

**Requirements:**
>* [AutoHotKey](http://www.autohotkey.com/)
>* Enable console in settings
>* Add "-condebug" (without quotes) to your launch options in steam under CS:GO properties. This just outputs console to a log file (as well as the console).
>* Create a autoexec.cfg file in csgo/cfg found in your Counter-Strike Global Offensive directory.
>* Add this line to the autoexec.cfg file ```bind "'" "exec scriptexec"``` (Note if you use the single quote (apostrophe) key for anything you will have to modify this and the script to match by changing ```SendInput '``` to ```SendInput [key]```. Choose a very remote key you will never use in game.)
>* Create a scriptexec.cfg file in csgo/cfg found in your Counter-Strike Global Offensive directory.
>* Change the PlayerName value in the top of the script to your in game name. Note: The characters \\.*?+[{|()^$ must be preceded by a backslash to be seen as literal. For example, \\. is a literal period and \\\ is a literal backslash.
>* If you changed your steam directory you will need to edit the location of the console.log and the scriptexec.cfg location in the script as well. Its at the top and is called "ConsolePath" and "ExecPath" respectively.
>* To change the in game hotkey to display the report from SEMICOLON (;) to something else you will need to edit the script and change "SEMICOLON" to whatever in game hotkey you like.

Without further ado. 

1. It automatically reports the damage you did to a player in the last round (after death) with a simple hotkey. Currently this defaults to semicolon (;). The way this works is pretty simple. -condebug writes your console to a log in the cs:go directory. This script monitors that log and when it sees that you did damage after a round it updates the scriptexec.cfg file with a new bind to SEMICOLON and then reloads the scriptexec.cfg in game. The bind simply says something in team chat and looks like ```bind "SEMICOLON" "say_team Damage Given To: BOT Doraemon(68) "```. Once you hit the semicolon key in game it will print the report in the form "Damage Given To: PlayerName(DMG)".

2. The script will only print the damage done to people you did more than 50 damage and less than 100 damage too. This prevents spamming already dead people and not very lit people.

3. The one caveat is that this script does not know if you killed someone by finishing them off so if you do greater than 50 damage and kill someone they will show up in the report.

Note:
I hope this isn't too complicated and that you guys get some use out of it. I made this so that I can easily report and view myself the damage I did without having to read the console. Feel free to use it and improve on it as well.

Feel free to comment and let me know if you have any ways to improve it.