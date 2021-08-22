![TS2 Redux head logo](https://i.imgur.com/IhwzsuM.png)
# Introduction
### What Is TS2 Redux?
This project aims to fix and enhance the port of **TimeSplitters 2** (TS2) contained within the 2016 game **Homefront: The Revolution**, hidden away as an easter-egg. Normally, the version of TS2 included in Homefront is limited to just 2 playable story missions: Siberia and Chicago. This project unlocks the rest of TS2 in its entirety and adds multiple enhancements to make the game more stable and enjoyable beyond what was originally included.

Normally, players would have to play through Homefront's campaign for several hours until they reach an arcade cabinet in the game. The player can then walk up to the cabinet and interact with it, which triggers TS2 to load and take over their screen until they exit and resume playing Homefront's campaign. After this, TS2 is made available to launch from Homefront's "Extras" menu.

This version of TS2 is rendered natively on PC/console in full HD, including up to 4K, with native widescreen and mouse/keyboard/gamepad support. It uses high-quality assets and lossless audio for music and sound-effects. This port of TS2 inside of Homefront is the only publicly available "HD remaster" of TS2 currently in existence.

*For more information on the history and evolution of this TimeSplitters port, see the Backstory section below.*


# Features

 - **Full Game Permanently Unlocked**
	 - All story missions
	 - Arcade - both Custom and League modes
	 - Challenge mode
	 - Cheats menu & all minigames unlocked by default
 - **Game-Breaking Bugs Fixed**
	 - NeoTokyo cutscene crash fixed. NeoTokyo can now be played!
	 - Reaper spawn crash issue fixed. Return To Planet X can now be played!
	 - Rain-on-camera glitch fixed. No more black squares flickering on screen while playing rainy maps like NeoTokyo and Compound.
 - **UI and Menu Fixes**
	 - Menus adjusted to fit on screen properly. Stretched elements (character images, icons, etc) also fixed.
	 - New high-resolution textures for menus added. Logos, header images, and more.
	 - Options menu restored and working. Can now access player profile statistics screen and custom controller layouts.
 - **Custom TS2 Launcher**
	 - Load straight into TS2, skipping Homefront's intro animations and menus entirely.
 - **Homefront Ripper**
	 - Deletes any of Homefront's game files not needed to play TS2. Reduxes game size from ~46GB to ~4GB.
 - **Save/load Player Profile**.
	 - Normally the game doesn't keep track of your achievements in Arcade League and Challenge modes. This fixes that, allowing you to save and load your progress and stats.
 - **2 Hidden Levels Unlocked**
	 - Dam and Western are playable in Arcade Custom mode. These are multiplayer versions of the maps Siberia and Wild West from story mode.
 - **Chemical Plant (TS1) Map Added**
	 - The developers [inadvertently](https://twitter.com/olynative/status/1417815379997466624) included a half-working version of the TimeSplitters 1 map "Chemical Plant" in the game's files. It is now fixed and playable in Arcade. This classic TS1 map was never available in the console ports of TS2.
 - **New Mods and Cheats Available**
	 - Infinite health (invincibility) + infinite ammo
	 - Bodies don't disappear after dying (story mode only)
	 - Disable auto-lookahead (camera doesn't return to center when moving)
	 - Static crosshair aiming for controller users. This makes the crosshair stay fixed in the center of the screen when using a gamepad (Xbox controller, etc), just like every other first person shooter.
 - **New High-Resolution Textures**
	 - Many in-game textures have been recreated in higher resolutions to helps this almost 20 year old game look a bit less pixelated on HD displays.

# Screenshots + Images

[Main menu](https://i.imgur.com/xv2sGYb.png). New menu items, high-res logo, modern gamepad icons
![TS2 main menu](https://i.imgur.com/xv2sGYbl.png)
*Note: the Network menu doesn't work and isn't visible in public releases of the mod*


[TS2 on Xbox](https://i.imgur.com/1e2hVYd.jpg) (emulated), for reference
![Screenshot from Xbox - Mexican Mission](https://i.imgur.com/1e2hVYdl.jpg)

[TS2 Redux on PC](https://i.imgur.com/4ZzOnN1.jpg) (at 1080p)
![Screenshot From PC - Mexican Mission](https://i.imgur.com/4ZzOnN1h.jpg)

[Texture example: Diamondplate](https://i.imgur.com/c2qwANw.jpg) - *Top: new / Bottom: old*
![Screenshot showing high-res texture example of diamondplate texture](https://i.imgur.com/c2qwANwl.jpg)


[Texture example: Crate](https://i.imgur.com/ZOhobU0.jpg) - *Left: old / Right: new*
![Screenshot showing high-res texture example of a crate texture](https://i.imgur.com/ZOhobU0l.jpg)

[Texture example: Game mode icons](https://i.imgur.com/XtNGhH7.jpg) - *Left: old / Right: new*
![Comparison of old and new textures - game mode icons](https://i.imgur.com/XtNGhH7l.jpg)

[Weapon crosshairs](https://i.imgur.com/XaT3CBH.jpg) - *Left: old / Right: new*
![Comparison of old and new textures - weapon crosshairs](https://i.imgur.com/XaT3CBHl.jpg)

[Chemical Plant](https://i.imgur.com/iEzkM8k.jpg) map (from TimeSplitters 1)
![Chemical Plant map 1](https://i.imgur.com/iEzkM8kl.jpg)

[Chemical Plant](https://i.imgur.com/rFTp0cX.jpg) map (from TimeSplitters 1)
![Chemical Plant map 2](https://i.imgur.com/rFTp0cXl.jpg)

# Installing and Uninstalling

### How To Install
To install, follow these steps:

 1. Acquire and install Homefront: The Revolution on your PC. Take note of where you installed the game to on your hard drive, usually similar to *C:\Steam\steamapps\common\Homefront_The_Revolution*).
 2. Download the latest version of TS2 Redux from the project's GitHub page. Direct link: https://github.com/HFTSRedux/TS2Redux/releases
 3. Extract the ZIP file you just downloaded into your Homefront game folder.

That's it! The mod will automatically be loaded by the Homefront app the next time you start it.

### Optional: Custom TS2 Launcher
![TimeSpliiters 2 themed exe](https://i.imgur.com/4oyG4Qu.png)
Want to have a fancy TS2 launcher that skips Homefront's menu and boots right into TS2? Simply run the *Homefront_To_TS2.bat* batch script included as part of this project (download links [here](https://github.com/HFTSRedux/TS2Redux/releases)) and follow the on-screen instructions.

It will ask where your Homefront game folder is located. Copy and paste the path to your game folder into the command prompt window and press enter. The script will create a new copy of your Homefront executable called "TimeSplitters2.exe". You can then use this new executable to load up directly into TS2, bypassing Homefront's menus entirely.

### Optional: Reduce Homefront's Size

A batch script is included which removes any Homefront game files that aren't needed to play TS2. This reduces the game's size from ~46GB down to ~5GB. Homefront's main menu will still work, which is useful for changing video settings, but you won't be able to play any missions/levels in Homefront.

Simply double-click the batch file named "Homefront_Ripper.bat" included as part of this project (download links [here](https://github.com/HFTSRedux/TS2Redux/releases)) and follow the on-screen instructions. This script moves files into a folder called "ripped" in your Homefront game folder, which you can then delete or backup somewhere.

To reverse the process and restore Homefront, just drag and drop everything in the "ripped" folder back into your Homefront game folder.

### Removing TS2 Redux
To remove this mod, do the following:

 1. Open a file explorer window and browse to your Homefront game folder.
 2. Delete these files and folders:
	 - Bin64/dinput8.dll
	 - Bin64/TS2Redux/
	 - gamehf2/ts2_redux.pak

And if you made a TS2 launcher, delete the EXE file manually.

If something goes wrong and you want to start completely over, you can use Steam's "[Verify integrity](https://help.steampowered.com/en/faqs/view/0C48-FCBD-DA71-93EB)" feature to re-download Homefront and restore it back to its original state.


# To-Do / Known-Bugs
There are several features that are either not present in TS2 Redux or are still being worked on.

 - Multiplayer / networking support. LAN and online multiplayer is not currently available. This is a very complex feature to add and our team is still working on this.
	 - Are you a networking guru? Join our team! Message any member of the Redux-Tech group in the TimeSplitters Online Discord server: [https://discord.gg/fBnFZBYht5](https://discord.gg/fBnFZBYht5 "https://discord.gg/fBnFZBYht5").
 - Preferences menu crashes the game.
 - Restore rain-on-camera effect.
 - Restore NeoTokyo cutscene objects.
 - Flashes from gunfire light up large surfaces of the map.

# Reporting Bugs / Feedback
Did you find a new bug? Let us know!

Join our the [TimeSplitters Online Discord server ](https://discord.gg/fBnFZBYht5) and leave a message describing the issue you experienced under the **redux-bugs** channel.

# Frequently Asked Questions

 1. **I have a copy of Homefront: The Revolution for Xbox/PlayStation. Can I use this mod?**
	 - No. This mod is for the PC version of Homefront only. It is not possible to add custom files to the console ports of Homefront. Console players can still use the unlock codes to unlock the full game.
 2. **Do I need to buy Homefront even if I'm only interested in playing TS2?**
	 - Yes. The TS2 Redux project only tweaks your existing copy of Homefront. This project does not contain the core game files to play TS2.
 3. **Where can I get a copy of Homefront?**
	 - Directly from [the Steam store](https://store.steampowered.com/app/223100/) OR buy a Steam key from [GamesPlanet.com](https://us.gamesplanet.com/game/homefront-the-revolution-steam-key--2983-1) (usually cheaper)
 4. **Does the Steam version work for this?**
	 - Yes.
 5. **I'm only interested in playing TS2. Do I need to keep Homefront's game files on my computer?**
	 - Yes and no. The port of TS2 within Homefront is not a standalone program. It's embedded inside of the Homefront game executable. In order to run TS2, Homefront must be able to run. You can, however, delete most of Homefront's game files reducing the total size of the game from ~46GB down to just ~4GB. A batch script is provided as part of this project which removes any non-essential Homefront files not needed to play TS2.
 6. **How do I change my video display settings?**
	 - Use Homefront's settings menus to change video output settings, among other settings (including mouse sensitivity).
 7. **Do I play through TS2 in order to unlock characters and levels like in the console ports?**
	 - No. Everything is unlocked by default. This includes all characters, story missions, arcade levels, challenge modes, cheats, and minigames (playable from the Temporal Uplink weapon).
 8. **I want to help!**
	 - Join us on the TSO Discord server ([click here](https://discord.gg/fBnFZBYht5)) and message a member of the Redux Tech Team to inquire further.
 9. **Is this any different than playing TS2 in an emulator?**
	 - There are a advantages and disadvantages to this port compared to playing TS2 using an emulator in Xemu (Xbox), Dolphin (GameCube), or PCXS2 (PS2). People have created mods for some of the console ports of TS2 that increase texture resolution, inject mouse/keyboard input, among other things. The overall experience of playing TS2 Redux on PC compared to playing in an emulator is very similar, except TS2 Redux (PC) does all this natively. TS2 on PC also includes high-quality audio, the TS1 map *Chemical Plant*, proper widescreen support, and more.

It's worth noting that this PC port of TS2 was not finished by the original developer, so there are a few rough edges that we're still working on smoothing out (see To-Do / Known-Bugs section).

# Disclaimer
This is a fan-made project made by a small group of TimeSplitters fans over the course of several months. This project is not related to or endorsed by Free Radical Design, Eidos Interactive, Dambuster Studios, Deep Silver, or any other companies related to the development or publishing of TimeSplitters and/or Homefront: The Revolution.

Great effort was made during the development of this project to respect the intellectual property rights of the game developers and publishers behind these two games. This project intentionally avoids distributing game files from Homefront and does allow people to play Homefront/TS2 without owning the game.

For more information about *Homefront: The Revolution*, visit its official website here:
https://www.deepsilver.com/en/games/homefront-the-revolution/


# Backstory
### Origins

The TS2 port found in Homefront was originally destined to be its own game as part of a project to port the game to PC, with work beginning as far back as 2008. The development studio behind TimeSplitters, Free Radical, was focused on other games at the time, including [Haze](https://www.ign.com/games/haze) and [Star Wars Battlefront III](https://en.wikipedia.org/wiki/Star_Wars:_Battlefront#Star_Wars:_Battlefront_III). Free Radical shut down in late 2008 and was bought by Crytek to become Crytek UK. In 2014, Crytek UK shut down and the the game they were working on at the time, Homefront: The Revolution, was transferred to a new development company, Dambuster Studios, who would continue development of the game.

The entirety of TS2 was included because it was faster to include the whole thing instead of taking the time to create a bespoke version just for this minor easter-egg. So, the menus in TS2 were altered to only show 2 story mode levels and all of the other parts of the menu were hidden or removed.

*"Started as an office joke, like they all do."* - Matt Phillips [via Twitter](https://twitter.com/bigevilboss/status/1378689574759714819)

### The Hunt to Unlock TS2

After Homefront: The Revolution was released in 2016, dataminers discovered that even though only 2 campaign missions in TimeSplitters 2 were playable, [the entirety of TS2's game files were present](https://www.reddit.com/r/Games/comments/62f9va/could_the_timesplitters_2_demo_in_homefront_tr_be/) in Homefront's files. This discovery sparked a multi-year long easter-egg hunt to try to unlock the rest of the game.

[Theories were crafted](https://www.reddit.com/r/oddheader/comments/go8vz0/homefront_the_revolution_undiscovered_easter_egg/) and ideas were tested in-game for countless hours as players tried to crack this elusive easter-egg. Some players experimented in-game while others inspected Homefront's game executable looking for any clues as to how to trigger the full game to become unlocked. There was even an alternate reality game (ARG) conducted by a supposed employee at Dambuster Studios (the studio behind Homefront) which gave players a series of cryptic and obscure clues with the idea that once solved the unlock codes would be revealed.

Unfortunately, this combined effort didn't lead to any significant progress towards unlocking the full game. There were numerous moments of hope along the way, but ultimately the actual unlock codes were never discovered by the small but dedicated community of easter-egg hunters. There was some success in hacking the game's memory to force it load into different story missions beyond Siberia and Chicago, but the vast majority of progress was made only ***after*** the unlock codes were revealed.

### Unlock Codes Revealed
The unlock codes were eventually revealed in April 2021 in a Twitter thread started by the developer who worked on the TS2 port, Matt Philips. Philips said that [the entirety of the game was unlockable](https://twitter.com/bigevilboss/status/1378771776595976195) through a series of button presses (with basic multiplayer support too), but he had since lost the unlock codes. A few days later, another Twitter user, Xbox principal software engineer Spencer Perreault, [replied in the thread](https://twitter.com/SpencerTheDean/status/1380066334063484935?ref_src=twsrc%5Etfw) and shared the game's unlock codes for the first time to the public *(technically the codes were shared a day or two priot to that, but Twitter hid this tweet as spam)*.

This sparked a frenzy of activity as word about the unlock codes spread through the TimeSplitters fanbase. Suddenly, people who had no interest in Homefront were buying copies of this 5-year old [mediocre](https://www.metacritic.com/game/pc/homefront-the-revolution) military shooter just to play an HD remaster of a 2-decade old shooter game from 2002. For the first time in TimeSplitters' history, the game could be played natively on PC in HD with proper mouse/keyboard support.

### Redux Tech Team Forms
The port of TS2 in Homefront was never actually finished. Since only the first two levels were intended to be playable, many major bugs were left in. Work began by the TS2 modding community to fix these game-breaking bugs so that this unique version of the game could be played properly. A small group joined to form the *Redux Tech Team*, the team behind this project.

### News Articles

 - Polygon: [TimeSplitters 2’s 4K port has been locked inside the Homefront sequel for years](https://www.polygon.com/22375774/timesplitters-2-homefront-the-revolution-easter-egg-cheat-code-unlock-how-to) - April 9th 2021
 - Kotaku: [Someone Recovered The Code To Unlock A Full Version Of Timesplitters 2 In Homefront: The Revolution](https://kotaku.com/someone-recovered-the-code-to-unlock-a-full-version-of-1846655103) - April 9th 2021
 - Eurogamer: [Homefront's missing unlock code to make TimeSplitters 2 fully playable has been found](https://www.eurogamer.net/articles/2021-04-09-homefront-the-revolutions-missing-timesplitters-2-unlock-code-has-now-been-found) - April 9th 2021

# PlayStation & Xbox TS2 Unlock Codes
Consoles players cannot install TS2 Redux to their consoles, but they can still unlock and enjoy TS2 in its entirety by entering in codes using their controller.

### Instructions
1.  Play through Homefront 2 until you reach the Restricted Zone, the final chapter of the storyline. This may take several hours to do.
2.  Locate the arcade cabinet easter egg, walk up to it, and activate it. If you don't know where the arcade cabinet is, watch one of the guides on YouTube to see how to find it. Once you interact with the arcade cabinet for the first time, a new menu option will appear on Homefront 2's main menu under Extras titled "TimeSplitters 2" where you can easily launch TS2 from then on.
3.  Start TimeSplitters 2. The game's title will appear and you will then see the main menu with "Story" and "Quit".
4.  Enter one of the codes below (from the Codes section) while on the main menu.

### Codes
![TS2 Unlock Codes](https://i.imgur.com/Ua06oHY.png)*Reminder- if you're on PC and using TS2 Redux, you don't need these codes.*

### Tips

-   You can enter multiple codes in a row (you're not limited to just one at a time).
-   You do not have to enter the codes fast. The game does not seem to have a time limit on how fast codes must be entered.
-   The game does not accept code presses while on the TS2 "Loading" screen. When switching from the main menu to the story mode missions screen, there is a loading screen in between. While this loading screen is present, make sure you don't press any buttons until it's done loading.
-   Switching between different menus does not interrupt a code. The same code can be performed across different menu screens without the code resetting. In other words, you can start entering a code on the TS2 main menu, then go into story mode menu and back and the code will still work. If a code causes you to exit out to the Homefront 2 menu, that is okay. Just go back into TS2 and your code should still be accepted.

# Credits
This project was made possible by the hard work and enthusiasm of several TimeSplitters fans.

### Redux Tech Team
 - DevilDwarf - Numerous patches (menus, bugfixes) and research
 - Fanoto - Technical insight and numerous patches (menus, bugfixes) and research
 - RyanUKAus - Modding efforts, research, and technical insight
 - Scotch - Textures, appearance mods, scripts, and documentation
 - Skibbles - Networking and community leader
 - Yossarian The Assyrian - Mods development, including porting several of his mods from console TS2 ports to TS2 Redux on PC


### Special Thanks
- [Matt Phillips](https://twitter.com/bigevilboss) for his work on the Homefront TS2 port
- Jalex
- LastLight - Admin of the [TimeSplitters Online](https://discord.gg/fBnFZBYht5) Discord community
- Spencer Perreault for revealing the TS2 unlock codes
- TanFlo1997 for creating the Dambuster Studios Easter-Egg Hunt Discord server
- [XeNTaX Game Research Forum](https://forum.xentax.com) for technical information about Homefront
