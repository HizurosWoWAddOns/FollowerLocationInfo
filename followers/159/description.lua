
-- ID: 159, Name: Rangani Kaalya (A) / Kaz the Shrieker (H)

local _, ns = ...;
local L = ns.locale;

ns.addFollower(159,false,{
	Alliance = {
		complete=-1,
		zone = 949,
		modelRace = "DraeneiF",
		{"questrow",
			{35225, 81588, 949, 46.0, 76.8},
			{35234, 75710, 949, 47.6, 94.0},
			{35235, 81751, 949, 48.0, 94.2},
			{35262, 81772, 949, 47.6, 93.2},
		},
	},
	Horde = {
		complete=-2,
		zone = 949,
		modelPosition = {1.5,0,-0.49},
		{"quest",
			{35511, 82338, 949, 47.6, 93.2},
		},
	},
	Neutral = {}
});

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};