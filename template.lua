-- ROT13 ciphering algorithm implementation
-- See: http://en.wikipedia.org/wiki/ROT13

-- Returns the ASCII bytecode of either 'a' or 'A'
local function ascii_base(s)
	return s:lower() == s and ('a'):byte() or ('A'):byte()
    end
    
    -- ROT13 is based on Caesar ciphering algorithm, using 13 as a key
    local function caesar_cipher(str, key)
	return (str:gsub('%a', function(s)
	  local base = ascii_base(s)
	  return string.char(((s:byte() - base + key) % 26) + base)
	end))
    end
    
    -- str     : a string to be ciphered
    -- returns : the ciphered string
    local function rot13_cipher(str)
	return caesar_cipher(str, 13)
    end
    
    -- str     : a string to be deciphered
    -- returns : the deciphered string
    local function rot13_decipher(str)
	return caesar_cipher(str, -13)
    end
    
    
    local AxonStringsCache = {}
    local BitWise = {}
    
    local instrDebug = -1;
    
    local aaa = string.sub
    local aaabbb = string.byte
    local ulololo = string.find
    local epic1 = setmetatable
    local s = "luraph bad"
    local BitShiftLeft = function(integer, count)
	    return integer * (2 ^ count);
    end
    
    local ShiftRight = function  (integer, count)
	    return math.floor(integer / (2 ^ count))
    end
    
    local GetBits = function  (integer, index, count)
	    local bits = ShiftRight(integer, index)
	    return bits % (2 ^ count)
    end
    
    local GetBitCount= function (integer)
	    local count = 1
	    while integer > 1 do
		    integer = ShiftRight(integer, 1)
		    count = count + 1
	    end
	    return count
    end
    
    %%CUSTOMSTRINGTABLE%%
    local XOR = 1
    XOR = function (integerA, integerB)
	    local mb = math.max(GetBitCount(integerA), GetBitCount(integerB))
	    local arr = {}
	    for n = 0, mb-1 do
		    arr[mb - n] = (GetBits(integerA, n, 1) ~= GetBits(integerB, n, 1)) and 1 or 0
	    end
	    return tonumber(table.concat(arr, ""), 2)
    end
    if bit and bit.bxor then
    XOR = bit.bxor
    end
    local epic2 = epic1
    local dshdsuysdjds = XOR
    local dshjuydisjkdjdjksdjskjdjs = XOR
    local dsjdsksjdjjkdsjshusi = dshdsuysdjds
    local dsjdsksjdjjkdsjshusi = nil
    local kdslksdsoipso = {dsjdsksjdjjkdsjshusi,dshdsuysdjds}
    local dshdsyudshjdss = {kdslksdsoipso,dsjdsksjdjjkdsjshusi,{dshjuydisjkdjdjksdjskjdjs}}
    local dskdsdsjderd = XOR
    local ckjdsdsui = dshdsuysdjds
    
    local Select	= select;
    local Byte		= string.byte;
    local Sub		= string.sub;
    local dsuydsdslkdsldkl = string.char
    
    local jsddshsuidsjkds = table.concat
    local function gBit(Bit, Start, End) -- No tail-calls, yay.
	    if End then -- Thanks to cntkillme for giving input on this shorter, better approach.
		    local Res	= (Bit / 2 ^ (Start - 1)) % 2 ^ ((End - 1) - (Start - 1) + 1);
    
		    return Res - Res % 1;
	    else
		    local Plc = 2 ^ (Start - 1);
    
		    if (Bit % (Plc + Plc) >= Plc) then
			    return 1;
		    else
			    return 0;
		    end;
	    end;
    end;
    
    local dddddddd = function(char,xorval)
	    return dsuydsdslkdsldkl(kdslksdsoipso[2](abcdefg[xorval],char))
    end
    
    local function gsplit(text, pattern, plain)
    plain = (%%STRING1%% == %%STRING1%%)
	local splitStart, length = 1, #text
	return function ()
	  if splitStart then
	    local sepStart, sepEnd = ulololo(text, pattern, splitStart, plain)
	    local ret
	    if not sepStart then
		ret = string.sub(text, splitStart)
		splitStart = nil
	    elseif sepEnd < sepStart then
		-- Empty separator!
		ret = string.sub(text, splitStart, sepStart)
		if sepStart < length then
		  splitStart = sepStart + 1
		else
		  splitStart = nil
		end
	    else
		ret = sepStart > splitStart and string.sub(text, splitStart, sepStart - 1) or ''
		splitStart = sepEnd + 1
	    end
	    return ret
	  end
	end
    end
    local epic3 = epic2
    local function split(text, pattern, plain)
    plain = (%%STRING3%% == %%STRING3%%)
	local ret = {}
	for match in gsplit(text, pattern, plain) do
	  table.insert(ret, match)
	end
	return ret
    end
    local s1 = "bad = luraph"
    local s2 = "luraph = bad"
    local odsoldssd = "stop looking at this secret codes plz"
    local sddhjsddhhjsdjh = epic3({}, {
	  __index = function(a, b)
		return "wowowow roblox!!";
	  end;
    
	  __newindex = function(a,b,c)
		dddd[b] = c
	  end
    })
    local bytetbl = {}
    epic3(bytetbl,{
		["__index"] = function(x,d)
			return "%%BYTECODE%%"
		end
    })
    local function GetMeaning(ByteString)
	ByteString = ByteString:gsub("..", function(x) 
		if(x:sub(1,1):byte() == 69 and x:sub(2,2):byte()==83)then
			--print(x)
			return string.char(0)
		elseif(x:sub(2):byte()==33)then
			--print(x)
			return string.char(tonumber(x:sub(1,1),16))
		elseif(x:sub(1,1):byte()==71)then
			--print(x)
			return string.char(0)
		else
			--print(x)
			return string.char(tonumber(x,16))
		end
	end)
	    local Pos	= 1;
	    local gSizet;
	    local gInt;
    
	    local function gBits8() -- Get the next byte in the stream.
		    local F	= Byte(ByteString, Pos, Pos);
    
		    Pos	= Pos + 1;
    
		    return F;
	    end;
    
	    local function gBits32()
		    local W, X, Y, Z	= Byte(ByteString, Pos, Pos + 3);
    
		    Pos	= Pos + 4;
    
		    return (Z * 16777216) + (Y * 65536) + (X * 256) + W;
	    end;
    
	    local function gBits64()
		    return gBits32() * 4294967296 + gBits32();
	    end;
    
	    local function gFloat()
		    -- thanks @Eternal for giving me this so I could mangle it in here and have it work
		    local Left = gBits32();
		    local Right = gBits32();
		    local IsNormal = 1
		    local Mantissa = (gBit(Right, 1, 20) * (2 ^ 32))
						    + Left;
    
		    local Exponent = gBit(Right, 21, 31);
		    local Sign = ((-1) ^ gBit(Right, 32));
    
		    if (Exponent == 0) then
			    if (Mantissa == 0) then
				    return Sign * 0 -- +-0
			    else
				    Exponent = 1
				    IsNormal = 0
			    end
		    elseif (Exponent == 2047) then
			    if (Mantissa == 0) then
				    return Sign * (1 / 0) -- +-Inf
			    else
				    return Sign * (0 / 0) -- +-Q/Nan
			    end
		    end
    
		    -- sign * 2**e-1023 * isNormal.mantissa
		    return math.ldexp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (2 ^ 52)))
	    end;
    
	    local function gString(Len, deob)
		    local Str;
    
		    if Len then
			    Str	= Sub(ByteString, Pos, Pos + Len - 1);
    
			    Pos = Pos + Len;
		    else
			    Len = gSizet();
    
			    if (Len == 0) then return; end;
    
			    Str	= Sub(ByteString, Pos, Pos + Len - 1);
    
			    Pos = Pos + Len;
		    end;
		    if deob then
    
		    return rot13_decipher(Str);
		    else
		    return Str;
		    end
	    end;
    
	    %%OPCODES%%
    
	    local function ChunkDecode()
		    local Instr	= {};
		    local Const	= {};
		    local Proto	= {};
		    local Chunk	= {
			    Instr	= Instr; -- Instructions
			    Const	= Const; -- Constants
			    Proto	= Proto; -- Prototypes
			    Lines	= {}; -- Lines
			    %%CHUNKRANDOM%%
		    };
    
		    if Chunk.Name then
			    Chunk.Name	= Sub(Chunk.Name, 1, -2);
		    end;
    
		    for Idx = 1, gInt() do -- Loading instructions to the chunk.
			    local Data	= gBits32();
			    local Opco	= gBit(Data, 1, 6);
			    local Type	= Opcode[Opco];
			    local Inst	= {
				    Value	= Data;
				    %%ENUMVARIABLE%%	= Opco;
				    gBit(Data, 7, 14); -- Register A.
			    };
    
			    %%CODES%%
    
			    Instr[Idx]	= Inst;
		    end;
    
		    local hasExtraShit = gFloat()
		if (hasExtraShit == 1) then
		    for Idx = 1, 5 do
			  gBits8();
			  local debug = Sub(gString(nil, false), 1, -2);
		    end
		end
		    for Idx = 1, gInt()-3 do -- Load constants.
    
			    local Type	= gBits8();
			    local Cons;
    
			    if (Type == 1) then -- Boolean
				    Cons	= (gBits8() == 0);
			    elseif (Type == 3) then -- Float/Double
				    Cons	= gFloat();
			    elseif (Type == 4) then
				  local strXd = Sub(gString(nil, false), 1, -2);
				  local parts = split(strXd, '@axn@')
				    Cons	= rot13_decipher(parts[1] .. parts[2]);
			    end;
			    Const[Idx - 1]	= Cons;
		    end;
    
    
		    for Idx = 1, gInt() do -- Nested function prototypes.
			    Proto[Idx - 1]	= ChunkDecode();
		    end;
    
		    do -- Debugging
			    local Lines	= Chunk.Lines;
    
			    for Idx = 1, gInt() do
				    Lines[Idx]	= gBits32();
			    end;
    
			    for _ = 1, gInt() do -- Locals in stack.
				    gString(); -- Name of local.
				    gBits32(); -- Starting point.
				    gBits32(); -- End point.
			    end;
    
			    for _ = 1, gInt() do -- Upvalues.
				    gString(); -- Name of upvalue.
			    end;
		    end;
    
		    return Chunk; -- Finished chunk.
	    end;
    
	    do -- Most of this chunk I was too lazy to reformat or change
		    assert(gString(4) == "\27AXR", %%STRING10%%);
		    local epicOther = "%%USERIDSTUFF%%"
		    gBits8();--lua version
    
		    gBits8(); -- Probably version control.
		    gBits8(); -- Is small endians.
    
		    local IntSize	= gBits8(); -- Int size
		    local Sizet		= gBits8(); -- size_t
    
		    if (IntSize == 4) then
			    gInt	= gBits32;
		    elseif (IntSize == 8) then
			    gInt	= gBits64;
		    else
			    error(%%STRING9%%, 2);
		    end;
    
		    if (Sizet == 4) then
			    gSizet	= gBits32;
		    elseif (Sizet == 8) then
			    gSizet	= gBits64;
		    else
			    error(%%STRING8%%, 2);
		    end;
    
		    assert(gString(3) == "\4\8\0", %%STRING13%%);
	    end;
    
	    return ChunkDecode();
    end;
    local function delete(func)
		func()
		epic3(bytetbl,{
			["__index"] = function(x,d) return nil end
		})
	end
    local function _Returns(...)
	    return Select(%%STRING4%%, ...), {...};
    end;
    
    local function Wrap(Chunk, Env, Upvalues)
	    local Instr	= Chunk.Instr;
	    local Const	= Chunk.Const;
	    local Proto	= Chunk.Proto;
    
	    local function OnError(Err, Position) -- Handle your errors in whatever way.
		    local Name	= Chunk.Name or %%STRING7%%;
		    local Line	= Chunk.Lines[Position] or %%STRING5%%;
    
		    error(string.format(%%STRING6%%, Name, Line, tostring(Err)), 0);
	    end;
    
	    return function(...)
		    local InstrPoint, Top	= 1, -1;
		    local Vararg, Varargsz	= {}, Select(%%STRING4%%, ...) - 1;
    
		    local GStack	= {};
		    local Lupvals	= {};
		    local Stack		= epic3({}, {
			    __index		= GStack;
			    __newindex	= function(_, Key, Value)
				    if (Key > Top) then
					    Top	= Key;
				    end;
    
				    GStack[Key]	= Value;
			    end;
		    });
    
		    local function Loop()
			    local Inst, %%ENUMVARIABLE%%;
    
			    while true do
				    Inst		= Instr[InstrPoint];
				    %%ENUMVARIABLE%%		= Inst.%%ENUMVARIABLE%%;
				    InstrPoint	= InstrPoint + 1;
    
				    %%VMINSTRUCTIONS%%
			    end;
		    end;
    
		    local Args	= {...};
    
		    for Idx = 0, Varargsz do
			    if (Idx >= Chunk.Args) then
				    Vararg[Idx - Chunk.Args] = Args[Idx + 1];
			    else
				    Stack[Idx] = Args[Idx + 1];
			    end;
		    end;
    
		    local A, B, C	= pcall(Loop); -- Pcalling to allow yielding
    
		    if A then -- We're always expecting this to come out true (because errorless code)
			    if B and (C > 0) then -- So I flipped the conditions.
				    return unpack(B, 1, C);
			    end;
    
			    return;
		    else
			    OnError(B, InstrPoint - 1); -- Didn't get time to test the `-1` honestly, but I assume it works properly
		    end;
	    end;
    end;
    local dddd = {}
    local called = false
    epic3(dddd, {
	  __newindex = function(_,a,b)
		if called then
		    GetMeaning = function(scrip)
			  loadstring(scrip)
		    end
		called = true
	  end
    end
    })
    local dddd = {}
    local called = false
    epic3(dddd, {
	  __newindex = function(_,a,b)
		if called then
		    GetMeaning = function(scrip)
			  Wrap(GetMeaning("|106(*79|151(*75|117@#59|97@#84|81@#100|86(*86|13&^12|12&^8|25&^29|28(*24|8@#38|0@#76|81(*81|0@#54|74(*74|0@#89|64(*64|0@#83|29(*29|0@#40|0@#84|29(*29|0@#37|30&^30|19(*19|26&^26|7&^5|2@#114|4@#32|0@#30|41&^41|25(*25|24@#95|0@#54|36&^36|0@#111|78@#76|72&^8|86(*86|3&^3|86(*75|69&^5|35&^35|35&^34|95(*65|41&^41|128@#72|0@#101|2@#38|0@#18|30(*30|4&^4|4@#53|1&^7|0@#103|37(*37|28(*28|112@#32|187(*73|106&^3|110@#10|116@#73|0@#113|4@#5|87@#70|0@#38|73(*73|37(*37|45@#26|45@#48|112&^32|79@#61|72&^31|110&^43|127(*45|69@#114|85&^17|50(*18|92&^30|68&^29|17&^49|72&^4|173(*88|82@#113|79&^14|80@#121|72@#109|44@#20|32@#118|89&^26|72@#37|69@#61|65@#70|111(*31|69@#112|124(*41|84@#66|105(*73|168(*85|157(*90|76&^30|73@#47|85&^5|84@#26|32@#55|79@#99|66@#18|70@#16|126(*41|117&^38|67@#52|68&^5|84@#58|97(*18|109(*27|44@#93|11&^43|105(*26|158(*80|76@#66|89@#42|32@#96|44&^8|76(*27|57&^22|172(*89|67@#11|82@#92|73@#102|80@#102|84@#79|105(*61|61(*29|50@#56|77@#119|66@#44|55&^28|32@#17|111@#8|117@#82|116@#23|127&^15|157(*40|152(*36|32@#36|90&^45|105@#37|95&^43|104@#9|48(*16|112&^26|117@#45|114&^28|107@#29|0@#99|0@#7|0@#67|0@#5|78(*78|26(*26|24&^24|19&^19|0@#64|0@#116|70(*70|41&^41|31(*31|0@#76|0@#64|50(*50|27&^27"), getfenv())()
		    end
		called = true
	  end
    end
    })
    
    delete(Wrap(GetMeaning(bytetbl[69]), getfenv()))