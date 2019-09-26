local warn
local function okay(code)
    local _a68428 = 4
    
    while _a68428 ~= 6 do
            if _a68428 == 3 then
        _a68428 = 4
        return 
    elseif _a68428 == 8 then
        _a68428 = 3
        if (code:sub(1, 4) == "asdf") then
            warn = print
        else
        end

    elseif _a68428 == 4 then
        if true then
            _a68428 = 8
        else
            _a68428 = 6
        end

    end

    end

end

okay("asdfok")
warn("Hi!")

