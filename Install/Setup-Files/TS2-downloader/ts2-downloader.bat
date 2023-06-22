@echo off

if "%~1"=="" echo Missing install path && exit /b 1
set "installpath=%~1"
if "%~2"=="" echo Missing Steam username && exit /b 1
set "steamuser=%~2"

"%~dp0DepotDownloader.exe" -app 223100 -depot 223101 223102 223106 -username %steamuser% -remember-password -dir "%installpath%"
"%~dp0DepotDownloader.exe" -app 223100 -depot 223103 -username %steamuser% -dir "%installpath%" -filelist %~dp0223103-content.txt

echo Done!
pause
exit /b 0
