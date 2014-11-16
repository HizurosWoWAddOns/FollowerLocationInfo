
-- ID: 180, Name: Fiona (A) / Shadow Hunter Rala (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(180,false,{
	Alliance = {
		complete=-1,
		zone = 947,
		modelRace = "WorgenF",
		{"questrow",
			{35014, 80727, 947, 53.6, 57.2},
			{35617, 76204, 947, 53.6, 57.2}
		}
	},
	Horde = {
		complete=-1	,
		zone = 976,
		{"questrow",
			{34736, 78487, 976, 45.6, 43.2},
			{34344, 78487, 976, 45.6, 43.2},
			{34731, 78487, 976, 45.6, 43.2},
			{34345, 78487, 976, 45.6, 43.2},
			{34348, 78487, 976, 45.6, 43.2}
		}
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};