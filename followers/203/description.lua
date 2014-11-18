
-- ID: 203, Name: Meatball

local _, ns = ...;
local L = ns.locale;

ns.addFollower(203,true,{
	Alliance = {},
	Horde = {},
	Neutral = {
		complete=true,
		zone = 962,
		level = 100,
		quality = 4,
		modelRace = "Gnoll",
		{"requirements", "Brawler's Guild Rank 5"}
	}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};