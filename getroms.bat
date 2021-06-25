@echo off
set url=https://www.mamedev.org/roms/%1
set fileext=.zip
set outdir=D:\Emulators\mame\roms

if "%~1"=="" goto errparam

powershell.exe -command "& Invoke-WebRequest -Uri %url%/%1%fileext% -O %outdir%\%1%fileext% -UseBasicParsing"

exit /B 0

:errparam
echo "usage: %~n0 <game>"
exit /B 1