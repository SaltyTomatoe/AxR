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
    
    local abcdefg = {[1]=318;[2]=924;[3]=1115;[4]=184;[5]=420;[6]=187;[7]=303;[8]=493;[9]=204;[10]=372;[11]=788;[12]=322;[13]=782;[14]=1021;[15]=888;[16]=688;[17]=200;[18]=816;[19]=521;[20]=1080;[21]=254;[22]=885;[23]=511;[24]=175;[25]=1195;[26]=184;[27]=1208;[28]=226;[29]=577;[30]=695;[31]=1055;[32]=205;[33]=1176;[34]=261;[35]=1060;[36]=46;[37]=724;[38]=505;[39]=1021;[40]=296;[41]=421;[42]=625;[43]=485;[44]=157;[45]=1233;[46]=467;[47]=767;[48]=1127;[49]=987;[50]=602;[51]=1211;[52]=1133;[53]=670;[54]=1109;[55]=66;[56]=137;[57]=775;[58]=886;[59]=110;[60]=302;[61]=226;[62]=614;[63]=232;[64]=483;[65]=994;[66]=785;[67]=1208;[68]=680;[69]=272;[70]=98;[71]=557;[72]=563;[73]=178;[74]=462;[75]=736;[76]=122;[77]=280;[78]=686;[79]=852;[80]=378;[81]=1041;[82]=1116;[83]=1041;[84]=1136;[85]=197;[86]=974;[87]=268;[88]=137;[89]=60;[90]=654;[91]=847;[92]=149;[93]=925;[94]=399;[95]=210;[96]=254;[97]=968;[98]=1007;[99]=882;[100]=250;[101]=393;[102]=126;[103]=923;[104]=19;[105]=1033;[106]=144;[107]=630;[108]=648;[109]=1223;[110]=791;[111]=574;[112]=2;[113]=402;[114]=785;[115]=32;[116]=467;[117]=26;[118]=872;[119]=664;[120]=312;[121]=4;[122]=1198;[123]=998;[124]=737;[125]=382;[126]=100;[127]=520;[128]=790;[129]=419;[130]=226;[131]=43;[132]=307;[133]=866;[134]=705;[135]=620;[136]=784;[137]=1075;[138]=693;[139]=982;[140]=777;[141]=560;[142]=120;[143]=698;[144]=1059;[145]=765;[146]=692;[147]=238;[148]=1109;[149]=475;[150]=739;[151]=112;[152]=259;[153]=662;[154]=145;[155]=1140;[156]=1012;[157]=767;[158]=1101;[159]=960;[160]=526;[161]=793;[162]=544;[163]=209;[164]=1099;[165]=520;[166]=847;[167]=970;[168]=283;[169]=975;[170]=581;[171]=733;[172]=613;[173]=938;[174]=517;[175]=321;[176]=1188;[177]=1;[178]=951;[179]=418;[180]=10;[181]=400;[182]=957;[183]=678;[184]=365;[185]=1117;[186]=1150;[187]=770;[188]=896;[189]=625;[190]=764;[191]=757;[192]=314;[193]=1026;[194]=123;[195]=555;[196]=204;[197]=839;[198]=222;[199]=361;[200]=437;[201]=28;[202]=1141;[203]=275;[204]=340;[205]=1179;[206]=241;[207]=994;[208]=395;[209]=769;[210]=672;[211]=1032;[212]=206;[213]=125;[214]=534;[215]=860;[216]=750;[217]=244;[218]=32;[219]=222;[220]=818;[221]=668;[222]=8;[223]=825;[224]=190;[225]=1036;[226]=767;[227]=831;[228]=1040;[229]=1095;[230]=678;[231]=662;[232]=240;[233]=206;[234]=849;[235]=904;[236]=507;}
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
    plain = (jsddshsuidsjkds({dddddddd(205,24);dddddddd(1230,25);dddddddd(204,26);dddddddd(1228,27);dddddddd(135,28);dddddddd(563,29);dddddddd(663,30);dddddddd(1131,31);dddddddd(165,32);dddddddd(1273,33);dddddddd(363,34);dddddddd(1028,35);dddddddd(66,36);dddddddd(673,37);dddddddd(395,38);dddddddd(924,39);dddddddd(344,40);dddddddd(461,41);dddddddd(593,42);dddddddd(393,43);dddddddd(240,44);dddddddd(1207,45);dddddddd(434,46);dddddddd(656,47);}) == jsddshsuidsjkds({dddddddd(205,24);dddddddd(1230,25);dddddddd(204,26);dddddddd(1228,27);dddddddd(135,28);dddddddd(563,29);dddddddd(663,30);dddddddd(1131,31);dddddddd(165,32);dddddddd(1273,33);dddddddd(363,34);dddddddd(1028,35);dddddddd(66,36);dddddddd(673,37);dddddddd(395,38);dddddddd(924,39);dddddddd(344,40);dddddddd(461,41);dddddddd(593,42);dddddddd(393,43);dddddddd(240,44);dddddddd(1207,45);dddddddd(434,46);dddddddd(656,47);}))
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
    plain = (jsddshsuidsjkds({dddddddd(947,49);dddddddd(575,50);dddddddd(1239,51);dddddddd(1025,52);dddddddd(753,53);dddddddd(1141,54);dddddddd(49,55);dddddddd(226,56);dddddddd(878,57);dddddddd(786,58);dddddddd(66,59);dddddddd(270,60);dddddddd(146,61);dddddddd(531,62);dddddddd(156,63);dddddddd(451,64);dddddddd(918,65);dddddddd(889,66);dddddddd(1233,67);dddddddd(731,68);dddddddd(304,69);dddddddd(21,70);dddddddd(581,71);dddddddd(604,72);dddddddd(222,73);dddddddd(427,74);dddddddd(704,75);dddddddd(14,76);dddddddd(368,77);dddddddd(711,78);dddddddd(826,79);dddddddd(285,80);dddddddd(1073,81);dddddddd(1077,82);dddddddd(1151,83);dddddddd(1104,84);dddddddd(164,85);dddddddd(1006,86);dddddddd(366,87);dddddddd(232,88);dddddddd(79,89);dddddddd(747,90);dddddddd(889,91);dddddddd(161,92);dddddddd(957,93);dddddddd(491,94);dddddddd(183,95);dddddddd(157,96);dddddddd(935,97);dddddddd(907,98);dddddddd(791,99);dddddddd(136,100);}) == jsddshsuidsjkds({dddddddd(947,49);dddddddd(575,50);dddddddd(1239,51);dddddddd(1025,52);dddddddd(753,53);dddddddd(1141,54);dddddddd(49,55);dddddddd(226,56);dddddddd(878,57);dddddddd(786,58);dddddddd(66,59);dddddddd(270,60);dddddddd(146,61);dddddddd(531,62);dddddddd(156,63);dddddddd(451,64);dddddddd(918,65);dddddddd(889,66);dddddddd(1233,67);dddddddd(731,68);dddddddd(304,69);dddddddd(21,70);dddddddd(581,71);dddddddd(604,72);dddddddd(222,73);dddddddd(427,74);dddddddd(704,75);dddddddd(14,76);dddddddd(368,77);dddddddd(711,78);dddddddd(826,79);dddddddd(285,80);dddddddd(1073,81);dddddddd(1077,82);dddddddd(1151,83);dddddddd(1104,84);dddddddd(164,85);dddddddd(1006,86);dddddddd(366,87);dddddddd(232,88);dddddddd(79,89);dddddddd(747,90);dddddddd(889,91);dddddddd(161,92);dddddddd(957,93);dddddddd(491,94);dddddddd(183,95);dddddddd(157,96);dddddddd(935,97);dddddddd(907,98);dddddddd(791,99);dddddddd(136,100);}))
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
			return "1B41585251G11!4!4!4!8!G22!G7G5G5G4G6G6G6G2G2G17!G7G6G1G617G1G8G625G8G8G55B40G5G4F!40G11!2!G7G32!5BC0G5G29BG01!G0DB401!G11B811!G6C!40G22!1A80G8G125C01!G56580G7G8F!G21!1!2480G280651!G7G5991!G72!4F41G51!A!80G0G22480FE7F25G6G8G65BG12!G0F!40G31!6!G280G4G2G8G3G7G1G6F03F4!3!G8G0G26966G84!5!G3G6G4656C7365G14!4!G5G1G6656E64G24!4!G3G4G3666F72G64!6!G1G7G56C6F63616CG5C!G4G3G64!B!G1G2G863654061786E40766167G34!1EG0G0G37576206775766620766620724061786E40637670206772666720796279G04!7!G3G6G74061786E4070G64!8!G8G8G4754061786E4076G24!A!G7G5G867754061786E407666G84!7!G6G7G24061786E406EG44!B!G1G3G6676E4061786E406F7972G04!B!G2G3G1636E4061786E40766566G04!2EG8G0G7667A72796776617420677572207665626120676E4061786E40787266206662207A6870752067767A7221212121G0G6G8G3G5G2G3G4G6G1G7G4G7G6G2G8G6"
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
    
	    local Opcode = {[25] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[27] = jsddshsuidsjkds({dddddddd(189,17);dddddddd(784,18);dddddddd(565,19);dddddddd(1035,20);dddddddd(222,21);dddddddd(792,22);dddddddd(410,23);}),[28] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[32] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[8] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[37] = jsddshsuidsjkds({dddddddd(189,17);dddddddd(784,18);dddddddd(565,19);dddddddd(1035,20);dddddddd(222,21);dddddddd(792,22);dddddddd(410,23);}),[14] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[26] = jsddshsuidsjkds({dddddddd(189,17);dddddddd(784,18);dddddddd(565,19);dddddddd(1035,20);dddddddd(222,21);dddddddd(792,22);dddddddd(410,23);}),[16] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[33] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[2] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[20] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[35] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[3] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[11] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[23] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[31] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[29] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[9] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[17] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[5] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[1] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[36] = jsddshsuidsjkds({dddddddd(343,1);dddddddd(956,2);dddddddd(1127,3);dddddddd(139,4);dddddddd(388,5);dddddddd(206,6);}),[18] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[7] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[24] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[13] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[0] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[15] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[34] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[6] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[4] = jsddshsuidsjkds({dddddddd(343,1);dddddddd(956,2);dddddddd(1127,3);dddddddd(139,4);dddddddd(388,5);dddddddd(206,6);}),[30] = jsddshsuidsjkds({dddddddd(343,1);dddddddd(956,2);dddddddd(1127,3);dddddddd(139,4);dddddddd(388,5);dddddddd(206,6);}),[10] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[12] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[21] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),[19] = jsddshsuidsjkds({dddddddd(189,17);dddddddd(784,18);dddddddd(565,19);dddddddd(1035,20);dddddddd(222,21);dddddddd(792,22);dddddddd(410,23);}),[22] = jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);}),}
    
	    local function ChunkDecode()
		    local Instr	= {};
		    local Const	= {};
		    local Proto	= {};
		    local Chunk	= {
			    Instr	= Instr; -- Instructions
			    Const	= Const; -- Constants
			    Proto	= Proto; -- Prototypes
			    Lines	= {}; -- Lines
			    Vargs = gBits8();
Args = gBits8();
LastL = gInt();
Upvals = gBits8();
Name = gString();
Stack    = gBits8();
FirstL = gInt();

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
				    l1I1ii1li1lIl1Il11li	= Opco;
				    gBit(Data, 7, 14); -- Register A.
			    };
    
			    if (Type == jsddshsuidsjkds({dddddddd(344,7);dddddddd(386,8);dddddddd(187,9);dddddddd(340,10);dddddddd(865,11);dddddddd(304,12);dddddddd(814,13);dddddddd(927,14);dddddddd(793,15);dddddddd(724,16);})) then -- Most common, basic instruction type.
				Inst[2]	= gBit(Data, 24, 32);
				Inst[3]	= gBit(Data, 15, 23);
			elseif (Type == jsddshsuidsjkds({dddddddd(189,17);dddddddd(784,18);dddddddd(565,19);dddddddd(1035,20);dddddddd(222,21);dddddddd(792,22);dddddddd(410,23);})) then
				Inst[2]	= gBit(Data, 15, 32);
			elseif (Type == jsddshsuidsjkds({dddddddd(343,1);dddddddd(956,2);dddddddd(1127,3);dddddddd(139,4);dddddddd(388,5);dddddddd(206,6);})) then
				Inst[2]	= gBit(Data, 15, 32) - 131071;
			end;
    
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
		    assert(gString(4) == "\27AXR", jsddshsuidsjkds({dddddddd(782,166);dddddddd(914,167);dddddddd(340,168);dddddddd(897,169);dddddddd(613,170);dddddddd(703,171);dddddddd(540,172);dddddddd(990,173);dddddddd(608,174);dddddddd(290,175);dddddddd(1227,176);dddddddd(101,177);dddddddd(978,178);dddddddd(386,179);dddddddd(111,180);dddddddd(488,181);dddddddd(973,182);dddddddd(707,183);dddddddd(270,184);dddddddd(1065,185);dddddddd(1051,186);dddddddd(870,187);dddddddd(942,188);}));
    
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
			    error(jsddshsuidsjkds({dddddddd(832,140);dddddddd(606,141);dddddddd(12,142);dddddddd(735,143);dddddddd(1092,144);dddddddd(664,145);dddddddd(710,146);dddddddd(206,147);dddddddd(1062,148);dddddddd(434,149);dddddddd(665,150);dddddddd(21,151);dddddddd(291,152);dddddddd(760,153);dddddddd(254,154);dddddddd(1024,155);dddddddd(980,156);dddddddd(652,157);dddddddd(1080,158);dddddddd(944,159);dddddddd(638,160);dddddddd(886,161);dddddddd(594,162);dddddddd(165,163);dddddddd(1070,164);dddddddd(620,165);}), 2);
		    end;
    
		    if (Sizet == 4) then
			    gSizet	= gBits32;
		    elseif (Sizet == 8) then
			    gSizet	= gBits64;
		    else
			    error(jsddshsuidsjkds({dddddddd(384,116);dddddddd(115,117);dddddddd(786,118);dddddddd(765,119);dddddddd(332,120);dddddddd(36,121);dddddddd(1245,122);dddddddd(911,123);dddddddd(667,124);dddddddd(283,125);dddddddd(68,126);dddddddd(614,127);dddddddd(889,128);dddddddd(471,129);dddddddd(194,130);dddddddd(88,131);dddddddd(326,132);dddddddd(786,133);dddddddd(689,134);dddddddd(515,135);dddddddd(866,136);dddddddd(1095,137);dddddddd(720,138);dddddddd(946,139);}), 2);
		    end;
    
		    assert(gString(3) == "\4\8\0", jsddshsuidsjkds({dddddddd(73,201);dddddddd(1051,202);dddddddd(352,203);dddddddd(289,204);dddddddd(1259,205);dddddddd(129,206);dddddddd(909,207);dddddddd(505,208);dddddddd(885,209);dddddddd(709,210);dddddddd(1132,211);dddddddd(238,212);dddddddd(31,213);dddddddd(623,214);dddddddd(808,215);dddddddd(651,216);dddddddd(151,217);dddddddd(79,218);dddddddd(186,219);dddddddd(855,220);dddddddd(700,221);dddddddd(124,222);dddddddd(856,223);dddddddd(204,224);dddddddd(1131,225);dddddddd(666,226);dddddddd(843,227);dddddddd(1072,228);dddddddd(1079,229);dddddddd(714,230);dddddddd(759,231);dddddddd(132,232);dddddddd(168,233);dddddddd(830,234);dddddddd(1018,235);dddddddd(406,236);}));
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
	    return Select(jsddshsuidsjkds({dddddddd(426,101);}), ...), {...};
    end;
    
    local function Wrap(Chunk, Env, Upvalues)
	    local Instr	= Chunk.Instr;
	    local Const	= Chunk.Const;
	    local Proto	= Chunk.Proto;
    
	    local function OnError(Err, Position) -- Handle your errors in whatever way.
		    local Name	= Chunk.Name or jsddshsuidsjkds({dddddddd(65,112);dddddddd(509,113);dddddddd(885,114);dddddddd(69,115);});
		    local Line	= Chunk.Lines[Position] or jsddshsuidsjkds({dddddddd(65,102);});
    
		    error(string.format(jsddshsuidsjkds({dddddddd(958,103);dddddddd(96,104);dddddddd(1075,105);dddddddd(181,106);dddddddd(517,107);dddddddd(690,108);dddddddd(1255,109);dddddddd(818,110);dddddddd(589,111);}), Name, Line, tostring(Err)), 0);
	    end;
    
	    return function(...)
		    local InstrPoint, Top	= 1, -1;
		    local Vararg, Varargsz	= {}, Select(jsddshsuidsjkds({dddddddd(426,101);}), ...) - 1;
    
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
			    local Inst, l1I1ii1li1lIl1Il11li;
    
			    while true do
				    Inst		= Instr[InstrPoint];
				    l1I1ii1li1lIl1Il11li		= Inst.l1I1ii1li1lIl1Il11li;
				    InstrPoint	= InstrPoint + 1;
    
				    if (l1I1ii1li1lIl1Il11li == 12) then -- SETLIST
					local A		= Inst[1];
					local B		= Inst[2];
					local C		= Inst[3];
					local Stk	= Stack;

					if (C == 0) then
						InstrPoint	= InstrPoint + 1;
						C			= Instr[InstrPoint].Value;
					end;

					local Offset	= (C - 1) * 50;
					local T			= Stk[A]; -- Assuming T is the newly created table.

					if (B == 0) then
						B	= Top - A;
					end;

					for Idx = 1, B do
						T[Offset + Idx] = Stk[A + Idx];
					end; end
if (l1I1ii1li1lIl1Il11li == 10) then -- TFORLOOP
					local A		= Inst[1];
					local C		= Inst[3];
					local Stk	= Stack;

					local Offset	= A + 2;
					local Result	= {Stk[A](Stk[A + 1], Stk[A + 2])};

					for Idx = 1, C do
						Stack[Offset + Idx] = Result[Idx];
					end;

					if (Stk[A + 3] ~= nil) then
						Stk[A + 2]	= Stk[A + 3];
					else
						InstrPoint	= InstrPoint + 1;
					end; end
 if aaabbb(aaa(s,3,3)) ~= 114 then  l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li^ 3  end if (l1I1ii1li1lIl1Il11li == 0) then local B	= Stack[Inst[2]];

					if (not not B) == (Inst[3] == 0) then
						InstrPoint	= InstrPoint + 1;
					else
						Stack[Inst[1]] = B;
					end; end
 if aaabbb(aaa(s,3,3)) ~= 114 then  l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li^ 3  end if (l1I1ii1li1lIl1Il11li == 15) then -- CALL
					local A	= Inst[1];
					local B	= Inst[2];
					local C	= Inst[3];
					local Stk	= Stack;
					local Args, Results;
					local Limit, Edx;

					Args	= {};

					if (B ~= 1) then
						if (B ~= 0) then
							Limit = A + B - 1;
						else
							Limit = Top;
						end;

						Edx	= 0;

						for Idx = A + 1, Limit do
							Edx = Edx + 1;

							Args[Edx] = Stk[Idx];
						end;

						Limit, Results = _Returns(Stk[A](unpack(Args, 1, Limit - A)));
					else
						Limit, Results = _Returns(Stk[A]());
					end;

					Top = A - 1;

					if (C ~= 1) then
						if (C ~= 0) then
							Limit = A + C - 2;
						else
							Limit = Limit + A - 1;
						end;

						Edx	= 0;

						for Idx = A, Limit do
							Edx = Edx + 1;

							Stk[Idx] = Results[Edx];
						end;
					end; end;
 if aaabbb(aaa(s2,#s2/2,#s2/2)) ~= 104 then l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li/ 2 end if (l1I1ii1li1lIl1Il11li == 2) then -- NEWTABLE
					Stack[Inst[1]]	= {}; end
 if aaabbb(aaa(s2,#s2/2,#s2/2)) ~= 104 then l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li/ 2 end if (l1I1ii1li1lIl1Il11li == 6) then -- RETURN
					local A	= Inst[1];
					local B	= Inst[2];
					local Stk	= Stack;
					local Edx, Output;
					local Limit;

					if (B == 1) then
						return;
					elseif (B == 0) then
						Limit	= Top;
					else
						Limit	= A + B - 2;
					end;

					Output = {};
					Edx = 0;

					for Idx = A, Limit do
						Edx	= Edx + 1;

						Output[Edx] = Stk[Idx];
					end;

					return Output, Edx; end
if (l1I1ii1li1lIl1Il11li == 36) then -- JMP
					InstrPoint	= InstrPoint + Inst[2]; end
 if aaabbb(aaa(s,3,3)) ~= 114 then  l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li^ 3  end if (l1I1ii1li1lIl1Il11li == 25) then -- MOVE

                        					Stack[Inst[1]]	= Stack[Inst[2]]; end
if (l1I1ii1li1lIl1Il11li == 27) then -- LOADK
                        
                        					Stack[Inst[1]]	= Const[Inst[2]]; end
 if aaabbb(aaa(s2,#s2/2,#s2/2)) ~= 104 then l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li/ 2 end if (l1I1ii1li1lIl1Il11li == 26) then -- SETGLOBAL
					Env[Const[Inst[2]]]	= Stack[Inst[1]]; end
 if aaabbb(aaa(s2,#s2/2,#s2/2)) ~= 104 then l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li/ 2 end if (l1I1ii1li1lIl1Il11li == 37) then -- GETGLOBAL
                        					Stack[Inst[1]]	= Env[Const[Inst[2]]]; end
 if aaabbb(aaa(s,3,3)) ~= 114 then  l1I1ii1li1lIl1Il11li = l1I1ii1li1lIl1Il11li^ 3  end 
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
