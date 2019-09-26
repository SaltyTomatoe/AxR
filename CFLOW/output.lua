do
    local warn
    local function okay(code)
        local state = 7
        
        while state ~= 9 do
                        if state == 4 then
            state = 7
            return 
        elseif state == 7 then
            state = 4
            if (code:sub(1, 4) == "asdf") then
                warn = print
            else
            end

        elseif state == 7 then
            if true then
                state = 7
            else
                state = 9
            end

        end

        end

    end

    okay("asdfok")
    warn("Hi!")
end


