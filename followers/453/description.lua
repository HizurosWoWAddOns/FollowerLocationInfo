
-- ID: 453, Name: Hulda Shadowblade (A) / Dark Ranger Velonara (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(453,false,{
	Alliance = {
		complete=-1,
		zone=948,
		modelRace = "DwarfF",
		{"quest", {37281, 88195, 948, 39.6, 60.8}}
	},
	Horde = {
		complete=-1,
		zone=948,
		modelRace = "BloodElfF",
		{"quest", {37276, 88179, 948, 40, 43.2}}
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};