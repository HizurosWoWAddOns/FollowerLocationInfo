
-- ID: 170, Name: Goldmane the Skinner

local _, ns = ...;

ns.addFollower(
	170,   -- follower id
	true, -- neutral?
	{ -- A
		zone = 950,
		{"pos", {950, 40.4, 76.2}},
		{"quest", {950, 80083, 40.4, 76.2}},
		{"desc", {
			enUS = "Kill Bolkar the Cruel and loot the key for Goldmane's cage. Than open the cage and Goldmane will offer you his followship.",
			deDE = "Töte 'Bolkar der Grausame' und erbeute den Schlüssel zu Goldmähne's Käfig. Dann öffne den Käfig und Goldmähne wird seine Gefolgschaft anbieten."
		}}
	}
);
--X
--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
