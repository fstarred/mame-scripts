@echo off

set url=<url_for_chdgetchd.bat>
set fileext=.chd
set outdir=D:\Emulators\mame\roms

if "%~1"=="" goto errparam

powershell.exe -command "& Invoke-WebRequest -Uri %url%/%1%fileext% -O %outdir%\%1\%1%fileext% -UseBasicParsing"

exit /B 0

:errparam
echo "usage: %~n0 <game>"
exit /B 1
