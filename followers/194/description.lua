
-- ID: 194, Name: Phylarch the Evergreen

local _, ns = ...;

ns.addFollower(
	194,
	true,
	{
		zone = 962,
		{"pos", {962, nil, nil, "Random location"}},
		{"requirements", "Lumber mill (Level 3)"},
		{"desc", {
			enUS = "In cases of trees being attacked by him. He disappears with little life. This is a few times until he surrenders.",
			deDE = "Beim fällen von Bäumen wird man von ihm angegriffen. Er verschwindet mit wenig Leben. Das geht ein paar mal so bis er sich ergibt.",
			zhTW = "在被他被追趕的情況下開始攻擊。他只剩一點血時會消失。持續好幾次，直到他投降。",
			zhCN = "在被他被追赶的情况下开始攻击。他只剩一点血时会消失。持续好几次，直到他投降。",
		}}
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};