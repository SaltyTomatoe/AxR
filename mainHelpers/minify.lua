require'LuaMinify.FormatMini'
require'LuaMinify.ParseLua'
require'LuaMinify.Util'

function readax()
	local file=io.open("AXR_out.lua", "rb") -- r read mode and b binary mode
	local content=file:read "*a" -- *a or *all reads the whole file
	file:close()
	return content
end

function write(contentstuff)
  local file=io.open('AXR_out.lua','w+')
  file:write(contentstuff)
  file:close()
end

local c = readax()
local ret,needsForamt = ParseLua(c)
local formatted = Format_Mini(needsForamt)

if(ret)then
	complete = 
[[
	
--//Ty Vxck & Arisstath for original source
--//Axon Revamped v 1.1.0
--//https://discord.gg/3y7XbzR 
--//If this invite is invalid then there are no spaces left
--//Spots are limited just cuz I wanna keep it semi private, like elysian
--//Newer versions of the script will have an updated discord invite when I decide to expand the community
		


]]..formatted
	write(complete)
end