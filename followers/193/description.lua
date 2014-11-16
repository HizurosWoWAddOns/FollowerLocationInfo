
-- ID: 193, Name: Tormmok

local _, ns = ...;
local L = ns.locale;

ns.addFollower(193,true,{
	Alliance = {},
	Horde = {},
	Neutral = {
		complete=true,
		zone = 949,
		modelRace = "OrgeM",
		{"pos", {949, 44.9, 86.6}},
		{"desc", {
			enUS = "Help him to defend himself. Then he is friendly and can be recruited.",
			deDE = "Helft ihm sich zu verteidigen. Danach wird er freundlich und kann rekrutiert werden.",
		}}
	}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
