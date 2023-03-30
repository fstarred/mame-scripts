@echo off
set url=https://github.com/mamedev/mame/releases/download
set mamebasedir=d:\Emulators
set downloaddir=%mamebasedir%\downloads
set mameworkdir=d:\emulators\mame
set zipcmd=7zr.exe
set luadir=d:\lua
set luaexe=lua54.exe
set workingdir=%~dp0

if "%~1"=="" goto errparam

set url=%url%/mame%1
set file=mame%1b_64bit.exe

if not exist %downloaddir% (
	mkdir %downloaddir%
)

if not exist %downloaddir%\%file% (
	echo downloading mame %1...
	powershell.exe -command "& Invoke-WebRequest -Uri %url%/%file% -O %downloaddir%\%file% -UseBasicParsing"
)

echo extracting...

%zipcmd% x %downloaddir%\%file% -o%mamebasedir%\mame%1 -r -aos

echo creating link to public desktop

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%PUBLIC%\Desktop\mame.lnk');$s.WorkingDirectory='%mamebasedir%\mame%1';$s.TargetPath='%mamebasedir%\mame%1%\mame.exe';$s.Save()"

echo creating link to mame work directory

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%mameworkdir%\mame.lnk');$s.WorkingDirectory='%mamebasedir%\mame%1';$s.TargetPath='%mamebasedir%\mame%1%\mame.exe';$s.Save()"

echo creating link to current directory

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%workingdir%mame.lnk');$s.WorkingDirectory='%mamebasedir%\mame%1';$s.TargetPath='%mamebasedir%\mame%1%\mame.exe';$s.Save()"


echo generating mame ini files

start /D %mamebasedir%\mame%1 /WAIT /B mame.exe -cc

echo modifying mame ini values

%luadir%\%luaexe% %workingdir%set_ini.lua %1

:exitprog
exit /B 0

:errparam
echo "usage: %~n0 <newversion> (ex. %~n0 0232)"
exit /B 1

