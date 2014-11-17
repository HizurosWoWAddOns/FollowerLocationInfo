
-- ID: 460, Name: Felbast

local _, ns = ...;
local L = ns.locale;

ns.addFollower(460,false,{
	Alliance = {
		complete=true,
		zone = 976,
		modelRace = "DraeneiF",
		{"vendor", {85427, 971, "Trading Post"}},
		{"requirements", "Trading Post 2"},
		{"reputation", {1710, 7}},
		{"payment", {"gold", 50000000}},
	},
	Horde = {
		complete=true,
		zone = 976,
		--modelRace = "",
		{"vendor", {88493, 976, "Trading Post"}},
		{"requirements", "Trading Post 2"},
		{"reputation", {1708, 7}},
		{"payment", {"gold", 50000000}},
	},
	Neutral = {}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};