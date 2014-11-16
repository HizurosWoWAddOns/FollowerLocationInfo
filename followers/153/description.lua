
-- ID: 153, Name: Bruma Swiftstone (A) / Ka'la (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(153,false,{
	Alliance = {
		complete=true,
		zone = 971,
		modelRace = "DwarfF",
		{"mission", 66},
	},
	Horde = {
		complete=true,
		zone = 976,
		modelRace = "OrcF",
		{"mission", 2},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};