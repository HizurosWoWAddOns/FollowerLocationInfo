
-- ID: 463, Name: Daleera Moonfang (A) / Ulna Thresher (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(463,false,{
	Alliance = {
		complete=true,
		zone = 971,
		modelRace = "DwarfF",
		{"mission", 91},
	},
	Horde = {
		complete=true,
		zone = 976,
		modelRace = "ScourgeF",
		{"mission", 7},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};