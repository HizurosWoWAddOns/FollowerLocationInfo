
-- ID: 195, Name: Weldon Barov (A) / Alexi Weldon (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(195,true,{
	Alliance = {},
	Horde = {},
	Neutral = {
		zone = 962,
		ModelPosition = {1.5,0,-0.59},
		{"pos", {962}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		{"desc", {
			enUS = "Barov is located at a random position in Draenor under a felled tree. With the ability of the sawmill Barov you can free. Then he offers his following.",
			deDE = "Barov liegt an einer zufälligen Position in Draenor unter einem gefällten Baum. Mit der Fähigkeit des Sägewerks kannst du Barov befreien. Danach bietet er seine Gefolgschaft an.",
		}}
	}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};