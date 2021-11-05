@echo off & Title TS2 PAK Creator & color 0B

echo TS2 PAK Creator v1
echo Packages TS2 files into Homefront-friendly PAK file.
echo To use, make a folder in gamehf2 called ts2_redux
echo and put your overriding TS2 files in this folder.
echo Game exe must have AnyPAK patch for this to work.
echo Script By Scotch
echo https://discord.gg/yBMxG7yT
echo.
echo.

IF EXIST %cd%\Bin64\Homefront2_Release.exe (
	set gamepath=%cd%
	GOTO make_pak
)

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
	IF EXIST %gamepath%\Bin64\Homefront2_Release.exe GOTO make_pak
	echo Invalid game path. Please try again.
	pause
	exit /b 1

:make_pak
	IF EXIST %gamepath%\gamehf2\ts2_redux.pak (
		echo Existing Redux PAK file found. Deleting...
		del %gamepath%\gamehf2\ts2_redux.pak
	)
	
	echo Creating New ts2_redux.pak file...
	7z u -tzip -r -mx0 %gamepath%\gamehf2\ts2_redux.pak %gamepath%\gamehf2\ts2_redux\*
	
	echo Done!
	pause
	exit /b 0