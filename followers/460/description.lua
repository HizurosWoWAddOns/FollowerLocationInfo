
-- ID: 460, Name: Felbast

local _, ns = ...;
local L = ns.locale;

ns.addFollower(460,false,{
	Alliance = {
		complete=true,
		zone = 1009,
		--modelRace = "GoblinF",
		--modelPosition = {1.5,0,-0.28},
		{"vendor", {1009, 88482, 43.2, 77.4}},
		{"reputation", {1711, 7}},
		{"payment", {"gold", 50000000}},
	},
	Horde = {
		complete=true,
		zone = 1011,
		modelPosition = {1.5,0,-0.28},
		{"vendor", {1011, 88493, 53.8, 60.8}},
		{"reputation", {1711, 7}},
		{"payment", {"gold", 50000000}},
	},
	Neutral = {}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};