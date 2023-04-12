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

if not exist %snap_dir% (
	mkdir %snap_dir%
)

powershell.exe -command "& Invoke-WebRequest -Uri %snap_url%%1%fileext% -O %snap_dir%\%1%fileext% -UseBasicParsing"

echo downloading cabinets data..

if not exist %cabinets_dir% (
	mkdir %cabinets_dir%
)

powershell.exe -command "& Invoke-WebRequest -Uri %cabinets_url%%1%fileext% -O %cabinets_dir%\%1%fileext% -UseBasicParsing"

echo downloading cpanel data..

if not exist %cpanels_dir% (
	mkdir %cpanels_dir%
)

powershell.exe -command "& Invoke-WebRequest -Uri %cpanel_url%%1%fileext% -O %cpanels_dir%\%1%fileext% -UseBasicParsing"

exit /B 0

:errparam
echo "usage: %~n0 <romname>"
exit /B 1
