@echo off
set cabinets_url=https://archive.org/download/mame-support/Support/Cabinets/cabinets.zip/
set cpanel_url=https://archive.org/download/mame-support/Support/CPanel/cpanel.zip/
set snap_url=https://archive.org/download/mame-support/Support/Snaps/snap.zip/
set fileext=.png
set cabinets_dir=D:\Emulators\mame\cabinets
set cpanels_dir=D:\Emulators\mame\cpanels
set snap_dir=D:\Emulators\mame\snap

if "%~1"=="" goto errparam

echo downloading snap data..

call :createdir %snap_dir%

powershell.exe -command "& Invoke-WebRequest -Uri %snap_url%%1%fileext% -O %snap_dir%\%1%fileext% -UseBasicParsing"

call :checksize %snap_dir%\%1%fileext%




echo downloading cabinets data..

call :createdir %cabinets_dir%

powershell.exe -command "& Invoke-WebRequest -Uri %cabinets_url%%1%fileext% -O %cabinets_dir%\%1%fileext% -UseBasicParsing"

call :checksize %cabinets_dir%\%1%fileext%




echo downloading cpanel data..

call :createdir %cpanels_dir%

powershell.exe -command "& Invoke-WebRequest -Uri %cpanel_url%%1%fileext% -O %cpanels_dir%\%1%fileext% -UseBasicParsing"

call :checksize %cpanels_dir%\%1%fileext%

exit /B 0

:errparam
echo "usage: %~n0 <romname>"
exit /B 1

:checksize
set size=%~z1
if %size% == 0 (
	echo file non valid, removing..
	del %1
)
goto :eof

:createdir
if not exist %1 (
	mkdir %1
)
goto :eof
