
-- ID: 207, Name: Defender Illona (A) / Aeda Brightdawn (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(207,false,{
	Alliance = {
		complete=-1,
		zone=946,
		level = 95,
		quality = 3,
		modelRace = "DreaneiF",
		{"quest", {34777, 79979, 946, 57.5, 51.1 }, {36519, 79978, 946, 57.5, 51.1 }}
	},
	Horde = {
		complete=-2,
		zone=946,
		level = 95,
		quality = 3,
		modelRace = "BloodElfF",
		{"quest", {34776, 79978, 946, 58.1, 53}, {36518, 79978, 946, 58.1, 53 }}
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};

--[=[ TODO :: missing data... ]=]
