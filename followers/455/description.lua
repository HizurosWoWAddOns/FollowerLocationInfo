
-- ID: 455, Name: Millhouse Manastorm

local _, ns = ...;
local L = ns.locale;

ns.addFollower(455,false,{
	Alliance = {
		complete=true,
		zone = 971,
		level = 100,
		quality = 4,
		modelRace = "GnomeM",
		{"requirements", "Lunarfall Inn"},
		{"quest", {37179, 88009, 971, "Lunarfall Inn"}}
	},
	Horde = {
		complete=true,
		zone = 976,
		level = 100,
		quality = 4,
		modelRace = "GnomeM",
		{"requirements", "Frostwall Tavern"},
		{"quest", {37179, 88009, 976, "Frostwall Tavern"}}
	},
	Neutral = {}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};