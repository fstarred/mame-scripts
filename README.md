# mame-scripts
A set of scripts to automate tasks such as download and install of mame files

## Install mame

### Requirements

1. Powershell >=5.1
2. 7-Zip Command Line Version ([download on 7-zip.org](https://www.7-zip.org/download.html))
3. Lua ([download on Lua Binaries](https://sourceforge.net/projects/luabinaries/))

### Usage

_getmame.bat_ <version>

### Editable variables

```  
set url=https://github.com/mamedev/mame/releases/download
set outdir=
set curdir=
set zipcmd=7za.exe
set luadir=<lua installation path>
set luaexe=<lua executable filename>
```
  
## Download roms
  
### Requirements

1. Powershell >=5.1
  
### Usage

_getroms.bat_ <romname>
  
### Editable variables

```
set url=https://www.mamedev.org/roms/%1
set fileext=.zip
set outdir=D:\Emulators\mame\roms
```  
  
## Download data (cabinets so far)

### Requirements

1. Powershell >=5.1
  
### Usage

_getdata.bat_ \<romname\>
  
### Editable variables

```
set cabinets_url=https://archive.org/download/mamecabinets202fullset/Cabinets.zip/Cabinets%%2F
set fileext=.png
set outdir=D:\Emulators\mame\cabinets
```
  
