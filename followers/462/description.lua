
-- ID: 462, Name: Dawnseeker Rukaryx

local _, ns = ...;
local L = ns.locale;

ns.addFollower(462,false,{
	Alliance = {
		complete=true,
		zone = 1009,
		modelPosition = {1.5,0,-0.28},
		{"vendor", {86391, 1009, 49.9, 61.4}},
		{"payment", {823,5000}, {"gold", 50000000}},
	},
	Horde = {
		complete=true,
		zone = 1011,
		modelPosition = {1.5,0,-0.28},
		{"vendor", {86382, 1011, 64.6, 61.8}},
		{"payment", {823,5000}, {"gold", 50000000}},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};