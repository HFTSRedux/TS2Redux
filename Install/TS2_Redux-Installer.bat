@echo off & Title TS2 Redux Installer Tool & color 0B
setlocal EnableDelayedExpansion

set basepath=%~dp0
if %basepath:~-1%==\ SET basepath=%basepath:~0,-1%

set homefrontmd5=0326ea202fcd7ceb3760d14bc8d07f63

call :print_header
goto guess_path

:print_header
	cls
	echo "  _____ ___ ___   ___        _           "
	echo " |_   _/ __|_  ) | _ \___ __| |_  ___ __ "
	echo "   | | \__ \/ /  |   / -_) _` | || \ \ / "
	echo "   |_| |___/___| |_|_\___\__,_|\_,_/_\_\ "
	echo "                                         "
	echo.
	echo TS2 Redux Installer Tool v0.1
	echo Installs TS2 Redux Mod for Homefront The Revolution
	echo By The Redux Tech Team
	echo Discord: https://discord.gg/yBMxG7yT
	echo Github: https://github.com/HFTSRedux/TS2Redux
	echo.
	exit /b 0


:guess_path
	set "gamepath="
	set "installpath="
	for /F "tokens=2* skip=2" %%A In ('Reg Query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 223100" /v "InstallLocation"') Do (
		set "installpath=%%B"
	)
	
	if exist "%installpath%\Bin64\Homefront2_Release.exe" (
		set "gamepath=%installpath%"
		goto path_check
	) else (
		goto prompt_path
	)
	

:prompt_path
	set "gamepath="
	echo --------------------
	echo Enter the path to your Homefront: The Revolution game folder (no trailing slash)
	echo Example: D:\Steam\steamapps\common\Homefront_The_Revolution
	echo.
	set /p "gamepath=Enter Path to Homefront_The_Revolution: "
	if defined gamepath (
		goto path_check
	) else (
		echo Given game path was empty. Press try again.
		echo.
		pause
		goto prompt_path
	)


:path_check
	if exist "%gamepath%\Bin64\Homefront2_Release.exe" (
		goto main_menu
	) else (
		echo Invalid game path. Try again.
		echo.
		pause
		goto prompt_path
	)


:main_menu
	cls && call :print_header
	echo ---- Main Menu ----
	echo.
	echo Using game path: %gamepath%
	echo.
	echo Choose an option:
	echo.
	set "entry="
	echo  1. Install Bugfixes and Patches
	echo  2. Create TS2 Launcher
	echo  3. Install High-Resolution Textures
	echo  4. Run Homefront Ripper (reduce game size)
	echo  5. Fix NeoTokyo Cutscenes
	echo  6. Toggle Cheats and Mods
	echo  7. Change game folder path
	echo  8. Exit
	echo.
	echo Hint: if this is your first time, go through options 1 through 5 one after another.
	echo.
	set /p "entry=Enter Choice (1-8): "
	if "%entry%"=="1" goto do_install
	if "%entry%"=="2" goto do_patch
	if "%entry%"=="3" goto do_textures
	if "%entry%"=="4" goto do_rip
	if "%entry%"=="5" goto do_neopak
	if "%entry%"=="6" goto do_modsmenu
	if "%entry%"=="7" goto prompt_path
	if "%entry%"=="8" cls && exit /b 0
	if "%entry%"=="test_uninstall" goto do_uninstall
	echo.
	echo Error: Incorrect entry.
	timeout /t 5
	goto main_menu


:do_install
	cls && call :print_header
	echo ---- TS2 Redux Installer ----
	echo.
	echo You are about to install TS2 Redux. This is a collection
	echo of mods and fixes for TimeSplitters 2 in Homefront: The Revolution.
	echo.
	pause
	echo.
	if exist "%basepath%\App-DLLs\" (
		xcopy /e /y "%basepath%\App-DLLs" "%gamepath%\Bin64"
		
		if not exist "%gamepath%\Bin64\dinput8.dll" (
			echo Error: Installation failed. Could not copy one or more files to game folder.
			echo Try again. If problem persists, report it in the Discord server.
			pause
			goto main_menu
		)
	) else (
		echo Error: Could not located mod files to copy.
		echo Try again. If problem persists, report it in the Discord server.
		pause
		goto main_menu
	)
	
	if exist "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll_disabled" (
		echo Existing TS2 Remix DLL found. Removing...
		del "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll_disabled"
	)
	ren "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll" YossarianRemix.dll_disabled
	
	if exist "%gamepath%\Bin64\TS2Redux\YossariansMods.dll_disabled" (
		echo Existing TS2 Mods DLL found. Removing...
		del "%gamepath%\Bin64\TS2Redux\YossariansMods.dll_disabled"
	)
	ren "%gamepath%\Bin64\TS2Redux\YossariansMods.dll" YossariansMods.dll_disabled
	
	echo.
	echo --------------------
	echo Done. Returning to main menu.
	echo.
	
	pause
	goto main_menu


:do_patch
	cls && call :print_header
	echo ---- TS2 Launcher Creator ----
	echo.
	echo This creates a TS2-themed EXE from your Homefront game EXE.
	echo It also boots straight into TS2, skipping Homefront's menu and videos.
	echo.
	echo This uses the open-source patcher "JDiff" by Joris Heirbaut - jojodiff.sourceforge.net
	echo.
	pause
	
	if exist %gamepath%\Bin64\TimeSplitters2.exe (
		echo.
		echo It looks like you've already done this step.
		echo You can launch TS2 by using the launcher located here:
		echo %gamepath%\Bin64\TimeSplitters2.exe
		echo.
		echo Returning to main menu...
		echo.
		pause
		goto main_menu
	)
	
	if exist "%basepath%\jptch.exe" (
		"%basepath%\jptch.exe" "%gamepath%\Bin64\Homefront2_Release.exe" "%basepath%\EXE-Appearence\TS2-EXE-Appearence-Patch.pat" "%gamepath%\Bin64\TimeSplitters2.exe"
	) else (
		echo Error: Could not locate patcher program.
		echo Try again. If problem persists, report it in the Discord server.
		echo.
		echo Returning to main menu...
		echo.
		pause
		goto main_menu
	)
	
	if exist "%gamepath%\Bin64\TimeSplitters2.exe" (
		echo TS2 Launcher created successfully.
		echo.
		
		if not exist "%gamepath%\Bin64\tileicons\" (
			mkdir "%gamepath%\Bin64\tileicons"
			copy "%basepath%\EXE-Appearence\Win-TileIcons\tileicons\*.png" "%gamepath%\Bin64\tileicons\" >nul
			copy "%basepath%\EXE-Appearence\Win-TileIcons\TimeSplitters2.VisualElementsManifest.xml" "%gamepath%\Bin64\TimeSplitters2.VisualElementsManifest.xml" >nul
		)
		
		echo You can use this new launcher to load directly into TS2:
		echo %gamepath%\Bin64\TimeSplitters2.exe
	) else (
		echo Error: Launcher could not be created.
		echo Try again. If problem persists, report it in the Discord server.
	)
	
	echo.
	pause
	goto main_menu

:do_textures
	cls && call :print_header
	echo ---- TS2 HD Textures Pack ----
	echo.
	echo This copies high-definition textures to your game for
	echo a more crisp appearence while playing in HD resolutions.
	echo.
	pause
	
	if exist "%gamepath%\gamehf2\ts2_redux.pak" (
		echo It looks like you've already performed this step.
		echo.
		echo Returning to main menu...
		echo.
		pause
		goto main_menu
	)
	
	if exist "%basepath%\Texture-Mods\ts2_redux.pak" (
		copy "%basepath%\Texture-Mods\ts2_redux.pak" "%gamepath%\gamehf2\ts2_redux.pak"
	) else (
		echo Textures PAK not found.
	)
	
	if exist "%gamepath%\gamehf2\ts2_redux.pak" (
		echo Textures installed successfully.
	) else (
		echo Error: Something went wrong copying textures PAK.
	)
	
	echo.
	pause
	goto main_menu

:do_rip
	cls && call :print_header
	echo ---- Homefront Ripper ----
	echo.
	
	echo This reduces the size of your Homefront game folder from 45GB to 2.5GB
	echo leaving just enough for TimeSplitters 2 to run.
	echo.
	echo WARNING: You will not be able to play Homefront after
	echo this process is complete. You can still use Homefront's menu
	echo to adjust video settings, but that's about it.
	echo.
	pause
	
	if exist "%gamepath%\ripped\gamehf2\" (
		echo It looks like you've already performed this step.
		echo Your game folder already contains a "ripped" folder.
		echo.
		echo Returning to main menu...
		echo.
		pause
		goto main_menu
	)
	
	mkdir "%gamepath%\ripped\gamehf2\_activitycache"
	mkdir "%gamepath%\ripped\gamehf2\_levelcache"
	mkdir "%gamepath%\ripped\gamehf2\content"
	mkdir "%gamepath%\ripped\localization"
	
	move "%gamepath%\gamehf2\animations.pak" "%gamepath%\ripped\gamehf2"
	move "%gamepath%\gamehf2\core_patch_*" "%gamepath%\ripped\gamehf2"
	move "%gamepath%\gamehf2\music.pak" "%gamepath%\ripped\gamehf2"
	move "%gamepath%\gamehf2\sounds.pak" "%gamepath%\ripped\gamehf2"
	
	move "%gamepath%\gamehf2\_activitycache\*" "%gamepath%\ripped\gamehf2\_activitycache"
	move "%gamepath%\localization\*" "%gamepath%\ripped\localization"
	move "%gamepath%\ripped\localization\english_xml.pak" "%gamepath%\localization"
	move "%gamepath%\gamehf2\content\*" "%gamepath%\ripped\gamehf2\content"
	move "%gamepath%\gamehf2\_levelcache\*" "%gamepath%\ripped\gamehf2\_levelcache"

	echo.
	echo.
	echo Done.
	echo All non-essential files moved to this folder:
	echo "%gamepath%\ripped"
	echo.
	echo To undo this mod, move everything in "ripped" back into your Homefront folder.
	echo Once you've tested the game, you can delete the ripped folder.
	echo.
	pause
	goto main_menu

:do_neopak
	cls && call :print_header
	echo ---- NeoTokyo Cutscene Patcher ----
	echo.
	echo This fixes NeoTokyo's intro cutscene.
	echo Without this fix, the game will crash on NeoTokyo.
	echo.
	pause
	
	if exist "%gamepath%\gamehf2\ts2_neotokyo_fix.pak" (
		echo It looks like you've already performed this step.
		echo.
		echo Returning to main menu...
		echo.
		pause
		goto main_menu
	)
	
	if exist "%basepath%\jptch.exe" (
		"%basepath%\jptch.exe" "%gamepath%\gamehf2\lsao_cached.pak" "%basepath%\NeoTokyo-PatchV2\NeoTokyo-PatchV2.data" "%gamepath%\gamehf2\ts2_neotokyo_fix.pak"
		
		if exist "%gamepath%\gamehf2\ts2_neotokyo_fix.pak" (
			echo Files patched successfully
		) else (
			echo Error: Patch could not be generated.
			echo Check for any error messages above. See Discord server for help.
		)
	) else (
		echo Error: Could not located mod files to copy.
		echo Try again. If problem persists, report it in the Discord server.
	)
	echo.
	pause
	goto main_menu

:do_modsmenu
	cls && call :print_header
	echo ---- TS2 Mods Menu ----
	echo.
	echo This enables/disables extra mods and cheats.
	echo This is split into two sections: TS2 Mods and TS2 Remix.
	echo.
	echo The first (TS2 Mods) is a mixed collection of mods/cheats that you can toggle by
	echo pressing buttons on your keyboard while the game is running.
	echo.
	echo The second (TS2 Remix) is an overhaul mod that provides a new experience
	echo in all 10 of TS2's story mode missions. Once enabled, this mod is always-on
	echo and does not need to be triggered by keyboard buttons.
	echo.
	pause
	echo.
	
	if exist "%gamepath%\Bin64\TS2Redux\YossariansMods.dll" (
		echo --------------------
		echo TS2 Mods are currently ENABLED. Disable TS2 Mods? 
		set "disablemods="
		set /p "disablemods=Press Enter to disable or type "skip" (no quotes) to leave unchanged: "
		if not defined disablemods (
			ren "%gamepath%\Bin64\TS2Redux\YossariansMods.dll" YossariansMods.dll_disabled
			echo TS2 Mods have been DISABLED.
			echo.
		) else (
			echo TS2 Mods unchanged. Mods are still ENABLED.
			echo.
		)
	) else (
		echo --------------------
		echo TS2 Mods are currently DISABLED. Enable TS2 Mods?
		set "enablemods="
		set /p "enablemods=Press Enter to enable or type "skip" (no quotes) to leave unchanged: "
		if not defined enablemods (
			if exist "%gamepath%\Bin64\TS2Redux\YossariansMods.dll_disabled" (
				ren "%gamepath%\Bin64\TS2Redux\YossariansMods.dll_disabled" YossariansMods.dll
			) else (
				copy "%basepath%\App-DLLs\TS2Redux\YossariansMods.dll" "%gamepath%\Bin64\TS2Redux\YossariansMods.dll"
			)
			echo Done. TS2 Mods have been ENABLED.
			echo To see available mod commands while playing, switch to the console window and press Shift+1
			echo.
		) else (
			echo TS2 Mods unchanged. Mods are still DISABLED.
			echo.
		)
	)
	
	if exist "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll" (
		echo --------------------
		echo TS2 Remix is currently ENABLED. Disable TS2 Remix? 
		set "disableremix="
		set /p "disableremix=Press Enter to disable or type "skip" (no quotes) to leave unchanged: "
		if not defined disableremix (
			ren "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll" YossarianRemix.dll_disabled
			echo TS2 Remix has been DISABLED.
			echo.
		) else (
			echo TS2 Remix unchanged. Mod is still ENABLED.
			echo.
		)
	) else (
		echo --------------------
		echo TS2 Remix is currently DISABLED. Enable TS2 Remix?
		set "enableremix="
		set /p "enableremix=Press Enter to enable or type "skip" (no quotes) to leave unchanged: "
		if not defined enableremix (
			if exist "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll_disabled" (
				ren "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll_disabled" YossarianRemix.dll
			) else (
				copy "%basepath%\App-DLLs\TS2Redux\YossarianRemix.dll" "%gamepath%\Bin64\TS2Redux\YossarianRemix.dll"
			)
			echo Done. TS2 Remix has been ENABLED.
			echo.
		) else (
			echo TS2 Remix unchanged. Mod is still DISABLED.
			echo.
		)
	)
	
	echo.
	echo Returning to main menu.
	echo.
	pause
	goto main_menu

:do_uninstall
	cls && call :print_header
	echo ---- Uninstall TS2 Redux ----
	echo.
	echo Removes TS2 mod files from Homefront.
	echo.
	pause
	
	if exist "%gamepath%\Bin64\dinput8.dll" (
		del "%gamepath%\Bin64\dinput8.dll"
		rd /s /q "%gamepath%\Bin64\TS2Redux"
	)
	
	if exist "%gamepath%\Bin64\TimeSplitters2.exe" (
		del "%gamepath%\Bin64\TimeSplitters2.exe"
	)
	
	if exist "%gamepath%\tileicons\" (
		rd /s /q "%gamepath%\tileicons"
		del "%gamepath%\TimeSplitters2.VisualElementsManifest.xml"
	)
	
	if exist "%gamepath%\gamehf2\ts2_redux.pak" (
		del "%gamepath%\gamehf2\ts2_redux.pak"
	)
	
	if exist "%gamepath%\gamehf2\ts2_neotokyo_fix.pak" (
		del "%gamepath%\gamehf2\ts2_neotokyo_fix.pak"
	)
	
	if exist "%gamepath%\ripped\gamehf2\" (
		for /d %%i IN ("%gamepath%\ripped\*") DO move "%%i" %gamepath%\%%~ni
	)
	
	echo Done. TS2 Redux uninstalled.
	echo.
	
	pause
	goto main_menu
