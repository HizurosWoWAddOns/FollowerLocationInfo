--X
-- ID: 179, Name: Artificer Romuul (A) / Weaponsmith Na'Shral (H)

local _, ns = ...;

ns.addFollower(
	179,
	false,
	{
		zone = 947,
		{"event", {33038, 74741, 947, 42.8, 40.4}},
		{"quest", {35614, 74741, 947, 42.8, 40.4}},
		{"desc", {
			enUS = "Romuul starts an event where you have to protect him until he does his work.",
			deDE = "Romuul startet ein Ereignis, bei dem man ihn beschützen muss bis er seine Arbeit erledigt hat.",
		}},
		{"img", "1"},
	},
	{
		zone = 941,
		{"quest", {34729, 74977, 941, 65, 39.4}}
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};