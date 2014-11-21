
-- ID: 455, Name: Millhouse Manastorm

local _, ns = ...;

ns.addFollower(
	455,
	false,
	{
		zone = 971,
		{"requirements", "Lunarfall Inn"},
		{"quest", {37179, 88009, 971, "Lunarfall Inn"}}
	},
	{
		zone = 976,
		{"requirements", "Frostwall Tavern"},
		{"quest", {37179, 88009, 976, "Frostwall Tavern"}}
	}
);



--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};