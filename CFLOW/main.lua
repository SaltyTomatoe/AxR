math.randomseed (os.time())

-- Gonzalez, J
-- Created 3-29-2017
-- control flow obfuscator for lua
-- credits: imnota4 (idea), stravant (parselua)

-- os.execute 'cls & clear'

local file_to_string = require 'CFLOW.util.file_to_string'
local create_ast     = require 'CFLOW.ParseLua'.ParseLua
local obfuscate      = require 'CFLOW.noclooo.init'
local ast_to_code    = require 'CFLOW.FormatBeautiful'

local code = arg[1]

if true and true then
	code = file_to_string(code)
	assert (code and #code > 0, "Could not read file from argument.")
end

local success, _, code = pcall (create_ast, code)
assert (success, table.concat {"Error generating AST; ", tostring(code)} )

success, code = pcall(obfuscate, code, {name = 'functions'})
assert (success, table.concat {"Error processing AST; ", tostring(code)} )

success, code, _ = pcall(ast_to_code, code)
assert (success, table.concat {"Error generating Lua; ", tostring(code)} )

local function write(contentstuff)
	local file=io.open('AXR_in.lua','w+')
	file:write(contentstuff)
	file:close()
end

write(code)