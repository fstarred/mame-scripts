@echo off
set url=https://github.com/mamedev/mame/releases/download
set outdir=D:\Emulators
set curdir=d:\emulators\mame
set zipcmd=7za.exe
set luadir=d:\lua
set luaexe=lua54.exe

if "%~1"=="" goto errparam

set url=%url%/mame%1
set file=mame%1b_64bit.exe

powershell.exe -command "& Invoke-WebRequest -Uri %url%/%file% -O %outdir%\%file% -UseBasicParsing"

echo "extracting..."

%zipcmd% x %outdir%\%file% -o%outdir%\mame%1 -r

echo creating link to public desktop

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%PUBLIC%\Desktop\mame.lnk');$s.WorkingDirectory='%outdir%\mame%1';$s.TargetPath='%outdir%\mame%1%\mame.exe';$s.Save()"

echo creating link to current dir

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%curdir%\mame.lnk');$s.WorkingDirectory='%outdir%\mame%1';$s.TargetPath='%outdir%\mame%1%\mame.exe';$s.Save()"

echo generating mame ini files

start /D %outdir%\mame%1 /WAIT /B mame.exe -cc

echo modifying mame ini values

%luadir%\%luaexe% %curdir%\set_ini.lua %1

:exitprog
exit /B 0

:errparam
echo "usage: %~n0 <newversion> (ex. %~n0 0232)"
exit /B 1