
-- ID: 179, Name: Artificer Romuul (A) / Weaponsmith Na'Shral (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(179,false,{
	Alliance = {
		zone = 947,
		ModelPosition = {1.5,0,-0.62},
		{"pos", {947}},
		{"event", {33038, 74741, 947, 42.8, 40.4}},
		{"desc",
			--deDE = "Romuul startet ein Ereignis, bei dem man ihn beschützen muss bis er seine Arbeit erledigt hat.",
			--enUS = "Romuul starts an event where you have to protect him until he does his work.",
		}
	},
	Horde = {
		zone = 941,
		ModelPosition = {1.5,0,-0.62},
		{"quest", {34729, 74977, 941, 65, 39.4}}
	},
	Neutral = {}
});

--[=[ TODO :: image ? ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};