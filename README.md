# mame-scripts
A set of scripts to automate tasks such as download and installation of mame files

## Install mame

### Requirements

1. Powershell >=5.1
2. 7-Zip Command Line Version ([download on 7-zip.org](https://www.7-zip.org/download.html))
3. Lua ([download on Lua Binaries](https://sourceforge.net/projects/luabinaries/))

### Usage

_getmame.bat_ \<mameversion\>

### Features

1. Download mame from given url
2. Extract mame archived file to output directory
3. Generate mame executable shortcut file
4. Generate mame.ini and write entries taken from paths.lua
5. Generate ui.ini and write entries taken from paths.lua
6. Copy default.cfg (if exists) from script directory to mame dir

### Editable variables

```  
set url=https://github.com/mamedev/mame/releases/download
set outdir=
set curdir=
set zipcmd=7za.exe
set luadir=<lua installation path>
set luaexe=<lua executable filename>
```

### Notes

In case mame archived file is already present in output directory, download step is skipped

## Download roms
  
### Requirements

1. Powershell >=5.1
  
### Usage

_getroms.bat_ \<romname\>

### Features

Download _romname_ from url

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

### Features

Download _romname_ data (ex. cabinet images) from url
  
### Editable variables

```
set cabinets_url=https://archive.org/download/mamecabinets202fullset/Cabinets.zip/Cabinets%%2F
set fileext=.png
set outdir=D:\Emulators\mame\cabinets
```
  
