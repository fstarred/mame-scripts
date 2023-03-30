--[[
    This lua script replace mame.ini entries with new ones, as declared on t table
]]

require "io"
require "os"
--require "paths"
dofile("d:\\software\\mame-scripts-main\\paths.lua")

if not arg[1] then
	print("argument version missing\nUsage:\n" .. arg[0] .. " <version>\nExample:\n" .. arg[0] .. " 0232")
	os.exit()
end

local mame_ver = arg[1]
local mame_dir = mame_basedir .. '\\mame' .. mame_ver
local workingdir = ''

local function update_ini(filename, tbl)
    local handle = io.open(filename .. '.tmp', "w+")
    for line in io.lines(filename) do
        local x = line
        for key,value in pairs(tbl) do 
            x = string.gsub(x, "(" .. key .. "%s+).*" , "%1".. value)
        end
        handle:write(x , "\n")
    end
    handle:close()
    os.remove(filename)
    os.rename(filename .. '.tmp', filename)
end

print "updating mame.ini file ..."

update_ini(mame_dir .. '\\mame.ini', tbl_mame_ini)

print "updating ui.ini file ..."

update_ini(mame_dir .. '\\ui.ini', tbl_ui_ini)
