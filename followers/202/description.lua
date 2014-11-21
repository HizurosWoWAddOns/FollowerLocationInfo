--X
-- ID: 202, Name: Nat Pagle

local _, ns = ...;

ns.addFollower(
	202,
	false,
	{
		zone = 971,
		{"requirements", "Fishing Shack 3", "Fishing skill 700"},
		{"questrow",
			{36611, nil, 971, "Fishing Shack"},
			{36616, nil, 971, "Fishing Shack"}
		}
	},
	{
		zone = 976,
		{"requirements", "Fishing Shack 3", "Fishing skill 700"},
		{"questrow",
			{36611, nil, 976, "Fishing Shack"},
			{36616, nil, 976, "Fishing Shack"}
		}
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};