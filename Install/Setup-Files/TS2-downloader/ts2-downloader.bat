@echo off

if "%~1"=="" echo Missing install path && exit /b 1
set "installpath=%~1"
if "%~2"=="" echo Missing Steam username && exit /b 1
set "steamuser=%~2"
if "%~3"=="" echo Missing Steam password && exit /b 1
set "steampass=%~3"

"%~dp0DepotDownloader.exe" -app 223100 -depot 223101 -manifest 103344760119053156 -username %steamuser% -password %steampass% -dir "%installpath%"
"%~dp0DepotDownloader.exe" -app 223100 -depot 223102 -manifest 3243358074883441516 -username %steamuser% -password %steampass% -dir "%installpath%"
"%~dp0DepotDownloader.exe" -app 223100 -depot 223103 -manifest 8582653993015227315 -username %steamuser% -password %steampass% -dir "%installpath%" -filelist %~dp0223103-content.txt
"%~dp0DepotDownloader.exe" -app 223100 -depot 223106 -manifest 1385625310001200108 -username %steamuser% -password %steampass% -dir "%installpath%"

echo Done!
pause
exit /b 0
