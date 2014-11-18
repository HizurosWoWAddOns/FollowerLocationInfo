
-- ID: 154, Name: Magister Serenaa (A) / Magister Krelas (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(154,false,{
	Alliance = {
		complete=-1,
		zone = 946,
		level = 94,
		quality = 2,
		modelRace = "HumanF",
		{"quest", {34993, 80672, 946, 69.6, 20.8}},
	},
	Horde = {
		complete=-1,
		zone = 946,
		level = 94,
		quality = 2,
		modelRace = "BloodElfM",
		{"quest", {34949, 80553, 946, 71.2, 29.8}},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};