
-- ID: 195, Name: Weldon Barov (A) / Alexi Weldon (H)

local _, ns = ...;

local desc = {
	enUS = "Barov is located at a random position in Draenor under a felled tree. With the ability of the sawmill Barov you can free. Then he offers his following.",
	deDE = "Barov liegt an einer zufälligen Position in Draenor unter einem gefällten Baum. Mit der Fähigkeit des Sägewerks kannst du Barov befreien. Danach bietet er seine Gefolgschaft an.",
	zhTW = "巴羅夫位於在一個隨機的位置，在德拉諾一棵伐倒的樹之下。使用伐木的技能你可以解放巴羅夫。然後他會追隨你。",
	zhCN = "巴罗夫位于在一个随机的位置，在德拉诺一棵伐倒的树之下。使用伐木的技能你可以解放巴罗夫。然后他会追随你。",
};

ns.addFollower(
	195,
	false,
	{
		zone = 962,
		{"pos", {962, nil, nil, "Random location"}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		{"desc", desc}
	},
	{
		zone = 962,
		{"pos", {962, nil, nil, "Random location"}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		{"desc", desc }
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};