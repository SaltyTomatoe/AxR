
local warn
local function okay(code)
	if(code:sub(1,4)=="asdf")then
		warn = print
	else
	
	end
end
okay("asdfok")
warn("Hi!")