
-- ID: 195, Name: Weldon Barov (A) / Alexi Weldon (H)

local _, ns = ...;
local L = ns.locale;

local desc = {
	enUS = "Barov is located at a random position in Draenor under a felled tree. With the ability of the sawmill Barov you can free. Then he offers his following.",
	deDE = "Barov liegt an einer zufälligen Position in Draenor unter einem gefällten Baum. Mit der Fähigkeit des Sägewerks kannst du Barov befreien. Danach bietet er seine Gefolgschaft an.",
};

ns.addFollower(195,false,{
	Alliance = {
		complete=true,
		zone = 962,
		level = 95,
		quality = 2,
		modelRace = "HumanM",
		{"pos", {962, nil, nil, "Random location"}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		{"desc", desc}
	},
	Horde = {
		complete=true,
		zone = 962,
		level = 95,
		quality = 2,
		modelRace = "ScourgeM",
		{"pos", {962, nil, nil, "Random location"}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		{"desc", desc }
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};