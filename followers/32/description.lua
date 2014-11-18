
-- ID: 32, Name: Dagg

local _, ns = ...;
local L = ns.locale;

local desc = {
	enUS = "Liberate him twice from captivity. Then return to your garrison and you'll find him outside the fortress walls.",
	deDE = "Befreie ihn zweimal aus Gefangenschaft. Dann kehre zu deiner Garnison zurück und du wirst ihn ausserhalb der Festungsmauern finden.",
};

ns.addFollower(32,false,{
	Alliance = {
		complete=true,
		zone = 941,
		level = 90,
		quality = 2,
		modelRace = "Orge",
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 971, 54.8, 69.4}},
		{"desc", desc },
	},
	Horde = {
		complete=true,
		zone = 941,
		level = 90,
		quality = 2,
		modelRace = "Orge",
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 976, 48.8, 17.2}},
		{"desc", desc },
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};