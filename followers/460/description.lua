
-- ID: 460, Name: Felbast

local _, ns = ...;
local L = ns.locale;

ns.addFollower(460,false,{
	Alliance = {
		complete=true,
		zone = 1009,
		level = 100,
		quality = 2,
		modelRace = "GoblinF",
		{"vendor", {88482, 1009, 43.2, 77.4}},
		{"reputation", {1711, 7}},
		{"payment", {"gold", 50000000}},
	},
	Horde = {
		complete=true,
		zone = 1011,
		level = 100,
		quality = 2,
		modelRace = "GoblinF",
		{"vendor", {88493, 1011, 53.8, 60.8}},
		{"reputation", {1711, 7}},
		{"payment", {"gold", 50000000}},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};