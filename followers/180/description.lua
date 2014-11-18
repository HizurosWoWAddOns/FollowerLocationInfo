
-- ID: 180, Name: Fiona (A) / Shadow Hunter Rala (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(180,false,{
	Alliance = {
		complete=true,
		zone = 947,
		level = 90,
		quality = 2,
		modelRace = "WorgenF",
		{"questrow",
			{33786, 76200, 947, 57, 57.4},
			{33787, 76204, 947, 53.6, 57.2},
			{33808, 76204, 947, 53.6, 57.2},
			{33788, 76204, 947, 53.6, 57.2},
			{35617, 76204, 947, 53.6, 57.2}
		}
	},
	Horde = {
		complete=true,
		zone = 976,
		level = 90,
		quality = 2,
		modelRace = "TrollM",
		{"questrow",
			{34736, 78487, 976, 48.8, 65},
			{34344, 78208, 941, 52.6, 40.4},
			{34345, 78208, 941, 52.6, 40.4},
			{34348, 78208, 941, 52.6, 40.4},
			{34731, 78208, 941, 52.6, 40.4}
		}
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};