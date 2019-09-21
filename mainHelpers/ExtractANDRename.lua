require 'LuaMinify.ParseLua'
require 'LuaMinify.FormatMini'
superRandom = require 'others.random'
--tamper = require 'others.TamperDetection'
--Vars
local mrandom = math.random
local randomseed = math.randomseed
local floor = math.floor
local char = string.char
local dump = string.dump
local len = string.len
local byte = string.byte
local insert = table.insert
local concat = table.concat
--
--require 'LAT'
keys = 0
XFuscator = { }
XFuscator.DumpString = function(x) 
    return x:gsub(".", function(d) 
        return d
    end)
end
function generateKey()
    -- Reseed the generator.
    randomseed(superRandom(1000,1000000))
    local characters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                        'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                        'u', 'v', 'w', 'x', 'y', 'z'
                       }
    local key = ""
    for index = 1, 5 do
            key = key .. mrandom(0, 9) .. characters[mrandom(1, 26)]
    end
    return key
end
function encrypt_stringsOP(text, key)
    text = tostring(text)
    local encryptedText = ""
    local randomSeed = 0
    for index = 1, key:len() do
        if tonumber(key:sub(index, index)) then
            randomSeed = randomSeed + tonumber(key:sub(index, index)) * index
        end
    end
    randomseed(randomSeed)
    
    randomNumber = math.random(1, 20) * 5
    keys = randomNumber
	for index = 1, text:len() do
			encryptedText = encryptedText..char(floor(text:byte(index) + randomNumber))
    end
    if string.find(encryptedText,"\\") then 
        encryptedText = string.gsub(encryptedText,"\\","\\\\")
    end
    randomseed(mrandom(1, 100000000))
    return encryptedText
end
XFuscator.EncryptStrings = function(ast)
    local constantPoolAstNode = ast.Body[1].InitList[1]
	local _, node = ParseLua(
        [[local decrypt = function(text, key)
            local text = tostring(text)
            local decryptedText = ""
            local randomSeed = 0
            
            for index = 1, key:len() do
                    if tonumber(key:sub(index, index)) then
                            randomSeed = randomSeed + tonumber(key:sub(index, index)) * index
                    end
            end
            math.randomseed(randomSeed)
            
            local randomNumber = math.random(1, 20) * 5
            for index = 1, text:len() do
                    decryptedText = decryptedText .. string.char(text:byte(index) - keys)
            end
            
            -- Reseed the generator.
            math.randomseed(math.random(1, 100000000))
            return decryptedText
        end]])
    
    insert(ast.Body, 1, node.Body[1])
    for k, v in pairs(constantPoolAstNode.EntryList) do
    --for k=1, #constantPoolAstNode.EntryList do local v = constantPoolAstNode.EntryList[k]
        if v.Value then
            if v.Value.AstType == 'StringExpr' then
                local password = generateKey()
                local str = v.Value.Value.Constant
                local t = { }
                t[#t + 1] = encrypt_stringsOP(str,password)
                local newNode =""
                for k, v in pairs(t) do
                --for k=1, #t do local v = t[k]
                    newNode = "local _ = " .. "decrypt('"..v.."','"..password.."')"
				end
                local _, node = ParseLua(newNode)
                if not _ then error(node) end
                constantPoolAstNode.EntryList[k].Value = node.Body[1].InitList[1]
            end
        end
    end
end
XFuscator.ExtractConstants = function (code, ast)
    local dumpString = XFuscator.DumpString
    
    local CONSTANT_POOL_NAME
    base = 'CONSTANT_POOl'
    local chars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuioplkjhgfdsazxcvbnm_1234567890"
    while code:find(base, 1, true) do
        local n = mrandom(1, #chars)
        base = base .. chars:sub(n, n)
    end
    CONSTANT_POOL_NAME = base

	-- Rip constant strings out
    local function makeNode(index)
        return { 
            AstType = 'IndexExpr',
            ParentCount = 1,
            Base = { AstType = 'VarExpr', Name = CONSTANT_POOL_NAME },
            Index = { AstType = 'NumberExpr', Value = { Data = index } }
        } -- Ast Node
    end

    insert(ast.Body, 1, { 
        AstType = 'LocalStatement', 
        Scope = ast.Scope,
        LocalList = { 
            --ast.Scope:CreateLocal('CONSTANT_POOL'),
            { Scope = ast.Scope, Name = CONSTANT_POOL_NAME, CanRename = true },
        }, 
        InitList = { 
            { EntryList = { }, AstType = 'ConstructorExpr' },
        },
    })
    local constantPoolAstNode = ast.Body[1].InitList[1]

    local CONSTANT_POOL = { }
    local nilIndex
    local index = 1
    local function insertConstant(v, index, type)
        insert(constantPoolAstNode.EntryList, { 
            Type = 'Key', 
            Value = { AstType = type or 'StringExpr', Value = v }, 
            Key = { AstType = 'NumberExpr', Value = { Data = tostring(index) } }
        })
    end

    local function addConstant(const)
        if CONSTANT_POOL[const] then return CONSTANT_POOL[const] end
        if const == nil and nilIndex then return nilIndex end
        
        if type(const) == 'string' then
            const = dumpString(const)
            insertConstant({ Data = '"' .. const .. '"', Constant = const }, index, 'StringExpr')
            CONSTANT_POOL[const] = index
            index = index + 1
            return CONSTANT_POOL[const]
        elseif type(const) == 'number' then
            insertConstant({ Data = const }, index, 'NumberExpr')
            CONSTANT_POOL[const] = index
            index = index + 1
            return CONSTANT_POOL[const]
        elseif type(const) == 'nil' then
            insertConstant(const, index, 'NilExpr')
            nilIndex = index
            index = index + 1
            return nilIndex
        elseif type(const) == 'boolean' then
            insertConstant(const, index, 'BooleanExpr')
            CONSTANT_POOL[const] = index
            index = index + 1
            return CONSTANT_POOL[const]
        elseif const.AstType == 'VarExpr' then
            insert(constantPoolAstNode.EntryList, { 
                Type = 'Key', 
                Value = const,
                Key = { AstType = 'NumberExpr', Value = { Data = tostring(index) } }
            })
            CONSTANT_POOL[const] = index
            index = index + 1
            return CONSTANT_POOL[const]
        else 
            error("Unable to process constant of type '" .. const .. "'")
        end
    end

    local fixExpr, fixStatList

    fixExpr = function(expr)
        if expr.AstType == 'VarExpr' then
            if expr.Local then
                return expr
            else
                --local i = addConstant(expr)
                --return makeNode(i)
            end
        elseif expr.AstType == 'NumberExpr' then
            local i = addConstant(tonumber(expr.Value.Data))
            return makeNode(i)
        elseif expr.AstType == 'StringExpr' then
            local i = addConstant(expr.Value.Constant)
            return makeNode(i)
        elseif expr.AstType == 'BooleanExpr' then
            local i = addConstant(expr.Value)
            return makeNode(i)
        elseif expr.AstType == 'NilExpr' then
            local i = addConstant(nil)
            return makeNode(i)
        elseif expr.AstType == 'BinopExpr' then
            expr.Lhs = fixExpr(expr.Lhs)
            expr.Rhs = fixExpr(expr.Rhs)
        elseif expr.AstType == 'UnopExpr' then
            expr.Rhs = fixExpr(expr.Rhs)
        elseif expr.AstType == 'DotsExpr' then
        elseif expr.AstType == 'CallExpr' then
            expr.Base = fixExpr(expr.Base)
            for i = 1, #expr.Arguments do
                expr.Arguments[i] = fixExpr(expr.Arguments[i])
            end
        elseif expr.AstType == 'TableCallExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Arguments[1] = fixExpr(expr.Arguments[1])
        elseif expr.AstType == 'StringCallExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Arguments[1] = fixExpr(expr.Arguments[1])
        elseif expr.AstType == 'IndexExpr' then
            expr.Base = fixExpr(expr.Base)
            expr.Index = fixExpr(expr.Index)
        elseif expr.AstType == 'MemberExpr' then
            expr.Base = fixExpr(expr.Base)
        elseif expr.AstType == 'Function' then
            fixStatList(expr.Body)
        elseif expr.AstType == 'ConstructorExpr' then
            for i = 1, #expr.EntryList do
                local entry = expr.EntryList[i]
                if entry.Type == 'Key' then
                    entry.Key = fixExpr(entry.Key)
                    entry.Value = fixExpr(entry.Value)
                elseif entry.Type == 'Value' then
                    entry.Value = fixExpr(entry.Value)
                elseif entry.Type == 'KeyString' then
                    entry.Value = fixExpr(entry.Value)
                end
            end
        end
        return expr
    end

    local fixStmt = function(statement)
        if statement.AstType == 'AssignmentStatement' then
            for i = 1, #statement.Lhs do
                statement.Lhs[i] = fixExpr(statement.Lhs[i])
            end
            for i = 1, #statement.Rhs do
                statement.Rhs[i] = fixExpr(statement.Rhs[i])
            end
        elseif statement.AstType == 'CallStatement' then
            statement.Expression = fixExpr(statement.Expression)
        elseif statement.AstType == 'LocalStatement' then
            for i = 1, #statement.InitList do
                statement.InitList[i] = fixExpr(statement.InitList[i])
            end
        elseif statement.AstType == 'IfStatement' then
            statement.Clauses[1].Condition = fixExpr(statement.Clauses[1].Condition)
            fixStatList(statement.Clauses[1].Body)
            for i = 2, #statement.Clauses do
                local st = statement.Clauses[i]
                if st.Condition then
                    st.Condition = fixExpr(st.Condition)
                end
                fixStatList(st.Body)
            end
        elseif statement.AstType == 'WhileStatement' then
            statement.Condition = fixExpr(statement.Condition)
            fixStatList(statement.Body)
        elseif statement.AstType == 'DoStatement' then
            fixStatList(statement.Body)
        elseif statement.AstType == 'ReturnStatement' then
            for i = 1, #statement.Arguments do
                statement.Arguments[i] = fixExpr(statement.Arguments[i])
            end
        elseif statement.AstType == 'BreakStatement' then
        elseif statement.AstType == 'RepeatStatement' then
            fixStatList(statement.Body)
            statement.Condition = fixExpr(statement.Condition)
        elseif statement.AstType == 'Function' then
            if statement.IsLocal then
            else
                statement.Name = fixExpr(statement.Name)
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'GenericForStatement' then
            for i = 1, #statement.Generators do
                statement.Generators[i] = fixExpr(statement.Generators[i])
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'NumericForStatement' then
            statement.Start = fixExpr(statement.Start)
            statement.End = fixExpr(statement.End)
            if statement.Step then
                statement.Step = fixExpr(statement.Step)
            end
            fixStatList(statement.Body)
        elseif statement.AstType == 'LabelStatement' then
        elseif statement.AstType == 'GotoStatement' then
        else
            --print("Unknown AST Type: " .. statement.AstType)
        end
    end

    fixStatList = function(statList)
        for _, stat in pairs(statList.Body) do
            fixStmt(stat)
        end
    end
    fixStatList(ast)

	--addConstant("Skid_Protect is skidded. Ironic, isin'123t it?Skid_Protect is skid123ded. Ironic, isin't it?", index)addConstant("Skid_Prote123ct is skidded. Ironic, isin't it?Skid_Protect is skidded. Ironic, isin't it?", index)
	--addConstant("Skid_Protect is skidded. Ironic, isi123n't it?Skid_Protect is skid123ded. Ironic, isin't it?", index)addConstant("Skid_Prote123ct is skidded. Ironic, isin't it?Skid_Protect is skidded. Ironic, isin't it?", index)
	--addConstant("Skid_Protect is skidded. Ironic, isin't it?Sk123id_Protect is skid123ded. Ironic, isin't it?", index)addConstant("Skid_Prote123ct is skidded. Ironic, isin't it?Skid_Protect is skidded. Ironic, isin't it?", index)
	--addConstant("Skid_Protect is skidded123. Ironic, isi123n't it?Skid_Protect is s123kidded. Ironic, isin't it?", index)addConstant("Skid_P112321233rotect is skidded. Ironic, isin't it?Skid_Protect is skidded. Ironic, isin't it?", index)
end

_G.a = "AXR_in.lua"

local function obfuscate(code)
    local dumpString = XFuscator.DumpString
    local concat = function(...) return concat({...}, "") end
    randomseed(os and os.time() or tick())
    --print("Inital parsing ...")
    local str = ""
    local success, ast = ParseLua(code)
    if not success then
        error("Failed to compile code: " .. ast)
    end
    --print("Extracting constants ...")
    XFuscator.ExtractConstants(code, ast)
    --print("Encrypting strings...")
    XFuscator.EncryptStrings(ast)
    --print("Formatting...")
    local a = "keys = "..keys..[[

    ]]
    a = a..Format_Mini(ast)
    --print("Parsing...")
    success, ast = ParseLua(a)
    --print("Reformatting...")
    a = Format_Mini(ast)
    local function writehalf(contentstuff)
        local file=io.open('AXR-half_done.lua','w+')
        file:write(contentstuff)
        file:close()
    end

    --[[oof = tamper(a)
    success,ast = ParseLua(oof)
    --print(ast)
    ret = Format_Mini(ast)]]
	writehalf(a)
end
function read_file(path)
    local file=io.open(path, "rb") -- r read mode and b binary mode
    local content=file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end
_G.a = "AXR_in.lua"
obfuscate(read_file(_G.a))
