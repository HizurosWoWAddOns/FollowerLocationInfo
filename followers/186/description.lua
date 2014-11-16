
-- ID: 186, Name: Vindicator Onaala (A) / Greatmother Geyah (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(186,false,{
	Alliance = {
		complete=-1,
		zone = 947,
		modelRace = "DraeneiF",
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
		}}
	},
	Horde = {
		complete=-2,
		zone=0,
	},
	Neutral = {}
});

--[=[ TODO :: missing quest id's and more... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
