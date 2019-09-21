require'LuaMinify.FormatMini'
require'LuaMinify.ParseLua'
require'LuaMinify.Util'

function readax()
	local file=io.open("AXR_in.lua", "rb") -- r read mode and b binary mode
	local content=file:read "*a" -- *a or *all reads the whole file
	file:close()
	return content
end

function write(contentstuff)
  local file=io.open('AXR_in.lua','w+')
  file:write(contentstuff)
  file:close()
end

local c = readax()
local ret,needsForamt = ParseLua(c)
local formatted = Format_Mini(needsForamt)

write(formatted)