
-- ID: 176, Name: Pitfighter Vaandaam (A) / Bruto (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(176,false,{
	Alliance = {
		complete=-1,
		zone = 949,
		modelRace = "DraeneiM",
		{"questrow",
			{34704, 81076, 949, 53.0, 59.6},
			{34699, 79322, 949, 42.8, 63},
			{34703, 77014, 949, 42.8, 63},
			{35137, 0, 949, 0, 0},
			--{}
		}
	},
	Horde = {
		complete=-2,
		zone = 949,
	},
	Neutral = {
	}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};