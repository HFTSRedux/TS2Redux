@echo off & Title Homefront To TS2 Tool & color 0B

echo TS2 EXE Appearence Mods v1
echo Styles Homefront's exe to become TimeSplitters 2
echo Script and icons by Scotch
echo See README.md for more info.
echo.

timeout /t 3 >nul

GOTO start

:start
	echo Enter the path to your Homefront: The Revolution game folder (no trailing slash)
	echo Example: D:\Steam\steamapps\common\Homefront_The_Revolution
	echo.
	set /p gamepath=Enter Path to Homefront_The_Revolution:%=%
	if NOT "%gamepath%"=="" GOTO pathcheck
	echo Did not get game path. Hit ENTER to exit.
	pause
	exit /b 1

:pathcheck
	IF EXIST %gamepath%\Bin64\Homefront2_Release.exe GOTO apply_patch
	echo Invalid game path. Please try again.
	pause
	exit /b 1

:apply_patch
	echo Launching patcher. Windows may display a UAC Window. Click Yes to proceed.
	echo Click the Start button in the patcher program that appears to patch your Homefront EXE.
	
	%~dp0\App-Icons\TS2-Appearence-Patcher.exe %gamepath%\Bin64\Homefront2_Release.exe
	
	IF EXIST %gamepath%\Bin64\Homefront2_Release.exe.bak (
		ren %gamepath%\Bin64\Homefront2_Release.exe TimeSplitters2.exe
		ren %gamepath%\Bin64\Homefront2_Release.exe.bak Homefront2_Release.exe
	)
	
	mkdir %gamepath%\Bin64\tileicons
	copy %~dp0\Win-TileIcons\tileicons\*.png %gamepath%\Bin64\tileicons\ >nul
	copy %~dp0\Win-TileIcons\TimeSplitters2.VisualElementsManifest.xml %gamepath%\Bin64\TimeSplitters2.VisualElementsManifest.xml >nul
	
	echo All Done!
	
	pause
	exit /b 0