
-- ID: 458, Name: Vindicator Heluun / Cacklebone

local _, ns = ...;
local L = ns.locale;

ns.addFollower(458,false,{
	Alliance = {
		complete=true,
		zone = 976,
		level = 100,
		quality = 3,
		modelRace = "DraeneiF",
		{"vendor", {85427, 971, "Trading Post"}},
		{"requirements", "Trading Post 2"},
		{"reputation", {1710, 7}},
		{"payment", {"gold", 50000000}},
	},
	Horde = {
		complete=true,
		zone = 976,
		level = 100,
		quality = 3,
		modelRace = "OrcM",
		{"vendor", {88493, 976, "Trading Post"}},
		{"requirements", "Trading Post 2"},
		{"reputation", {1708, 7}},
		{"payment", {"gold", 50000000}},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};