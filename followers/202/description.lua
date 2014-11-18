
-- ID: 202, Name: Nat Pagle

local _, ns = ...;
local L = ns.locale;

ns.addFollower(202,false,{
	Alliance = {
		complete=-1,
		zone = 971,
		level = 100,
		quality = 3,
		modelRace = "HumanM",
		{"requirements", "Fishing Shack 3", "Fishing skill 700"},
		{"questrow",
			{36611, nil, 971, "Fishing Shack"},
			{36616, nil, 971, "Fishing Shack"}
		}
	},
	Horde = {
		complete=-1,
		zone = 976,
		level = 100,
		quality = 3,
		modelRace = "HumanM",
		{"requirements", "Fishing Shack 3", "Fishing skill 700"},
		{"questrow",
			{36611, nil, 976, "Fishing Shack"},
			{36616, nil, 976, "Fishing Shack"}
		}
	},
	Neutral = {}
});

--[=[ TODO :: missing data... ]=]

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};