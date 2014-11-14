
-- ID: 194, Name: Phylarch the Evergreen

local _, ns = ...;
local L = ns.locale;

ns.addFollower(194,true,{
	Alliance = {},
	Horde = {},
	Neutral = {
		zone = 962,
		{"pos", {962}},
		{"requirements", "Lumber mill (Level 3)"},
		{"desc", {
			enUS = "In cases of trees being attacked by him. He disappears with little life. This is a few times until he surrenders.",
			deDE = "Beim fällen von Bäumen wird man von ihm angegriffen. Er verschwindet mit wenig Leben. Das geht ein paar mal so bis er sich ergibt.",
		}}
	}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};