
-- ID: 462, Name: Dawnseeker Rukaryx (A)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(462,false,{
	Alliance = {
		zone = 1009,
		ModelPosition = {1.5,0,-0.28},
		{"vendor", {1009, 49.9, 61.4}},
		{"payment", {823,5000}, {"gold", 50000000}}
	},
	Horde = {
		zone = 1011,
		ModelPosition = {1.5,0,-0.28},
		{"vendor", {1011, 64.6, 61.8}},
		{"payment", {823,5000}, {"gold", 50000000}}
	},
	Neutral = {}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};