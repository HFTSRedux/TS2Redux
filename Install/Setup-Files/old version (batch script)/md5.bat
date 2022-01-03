@echo off
setlocal enableDelayedExpansion
if "%~1" equ "" (

	exit /b 1
)

for %%# in (-h -help /h /help) do (
	if "%~1" equ "%%~#" (
		echo generates MD5 checksum for a given file
		(echo()
		echo USAGE:
		(echo()
		echo %~nx0 file [variable]
		(echo()
		echo variable string in which the generated checksum will be stored
		(echo()
		exit /b 0
	)
)

set "md5="
for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%~f1" MD5') do (
	if not defined md5 (
		for %%Z in (%%#) do set "md5=!md5!%%Z"
	)
)

if "%~2" neq "" (
	endlocal && (
		set "%~2=%md5%"
	) 
) else (
	echo %md5%
)
endlocal
