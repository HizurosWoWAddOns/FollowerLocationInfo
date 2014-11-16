
-- ID: 216, Name: Delvar Ironfist (A only)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(216,false,{
	Alliance = {
		complete=-2,
		zone = 1009,
		modelRace = "DwarfM",
		{"questrow",
			{36624, 00000, 971, nil, nil},
			{36630, 00000, 1009, nil, nil}
		}
	},
	Horde = {
		ignore=true
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
