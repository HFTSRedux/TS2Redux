@echo off
if "%~1"=="" exit /b 1

set "gamepath=%~1"

if not exist "%gamepath%\Bin64\Homefront2_Release.exe" exit /b 1

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
move "%gamepath%\ripped\localization\*_xml.pak" "%gamepath%\localization"
move "%gamepath%\gamehf2\content\*" "%gamepath%\ripped\gamehf2\content"
move "%gamepath%\gamehf2\_levelcache\*" "%gamepath%\ripped\gamehf2\_levelcache"

exit /b 0