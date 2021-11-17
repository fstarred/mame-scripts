@echo off
set cabinets_url=https://archive.org/download/mamecabinets202fullset/Cabinets.zip/Cabinets%%2F
set fileext=.png
set outdir=D:\Emulators\mame\cabinets

if "%~1"=="" goto errparam

powershell.exe -command "& Invoke-WebRequest -Uri %cabinets_url%%1%fileext% -O %outdir%\%1%fileext% -UseBasicParsing"

exit /B 0

:errparam
echo "usage: %~n0 <romname>"
exit /B 1
