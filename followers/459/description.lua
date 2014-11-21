
-- ID: 459, Name: Cleric Maluuf (A) / Karg Bloodfury (H)

local _, ns = ...;

ns.addFollower(
	459,
	false,
	{
		zone = 1009,
		{"vendor", {85932, 1009, 46.6, 76.2}},
		{"reputation", {1731, 7}},
		{"payment", {"gold", 50000000}},
	},
	{
		zone = 1011,
		{"vendor", {86036, 1011, 53.4, 62.6}},
		{"reputation", {1445, 7}},
		{"payment", {"gold", 50000000}},

	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};