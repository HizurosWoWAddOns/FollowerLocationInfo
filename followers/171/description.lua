
-- ID: 171, Name: Pleasure-Bot 8000

local _, ns = ...;
local L = ns.locale;

local desc = {
	enUS = "After the quest, you get him as a quest reward. The charging process takes a while so you should not run away after completing the quest...",
	deDE = "Nach der Quest bekommt man ihn als Belohnung. Der Ladevorgang dauert etwas, daher sollte man nach Abschluss des Quests nicht weglaufen...",
};

ns.addFollower(171,false,{
	Alliance = {
		complete=true,
		zone = 946,
		modelRace = "Mech",
		{"pos", {946, 62.9, 50.3}},
		{"questrow",
			{34761, 79901, 946, 62.8, 50.2},
			{35239, 79853, 946, 62.8, 50.4}
		},
		{"desc", desc },
	},
	Horde = {
		complete=true,
		zone = 946,
		modelRace = "Mech",
		{"pos", {946}},
		{"questrow",
			{34751, 79870, 946, 64.2, 47.8},
			{35238, 79853, 946, 64.2, 47.8}
		},
		{"desc", desc }
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
