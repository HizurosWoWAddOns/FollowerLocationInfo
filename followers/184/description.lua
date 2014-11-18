
-- ID: 184, Name: Apprentice Artificer Andren (A) / Kal'gor the Honorable (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(184,false,{
	collectGroup="184.185.186",
	Alliance = {
		complete=true,
		zone = 947,
		level = 90,
		quality = 2,
		modelRace = "DraeneiM",
		{"questrow",
			{34787, 80078, 947, 56.5, 23.5},
			{35552, 80073, 947, 62.4, 26.2 },
			{34791, "o233229", 947, 60.9, 24.5},
			{34789, 80073, 946, 62.4, 26.2},
			{34792, 80073, 947, 66.4, 26.2},
			{34788, 80073, 947, 62.4, 26.2}
		},
		{"desc", {
			enUS = "Gained afte completing the Elodor questline. You have to choose between Andren, Chel and Onaala. (Tritox/WoWHead)",
		}},
	},
	Horde = {
		ignore=true,
		complete=-1,
		zone=941,
		level = 90,
		quality = 2,
		modelRace = "OrcM",
		{"questrow", 
			{33828, 72940, 941, nil, nil},
			{33493, 72940, 941, nil, nil},
			{37291, 74163, 976, 50, 38.4},
			{34722, 74163, 976, 50, 38.4},
			{33010, 74163, 976, 50, 38.4},
			{34123, 76720, 941, 65.4, 65.6},
			{34124, 76487, 941, 73.4, 58.8},
		}
	},
	Neutral = {}
});

--[=[ TODO :: missing quest giver coords... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
