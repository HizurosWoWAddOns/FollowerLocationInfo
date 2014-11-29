--X
-- ID: 184, Name: Apprentice Artificer Andren (A) / Kal'gor the Honorable (H)

local _, ns = ...;

ns.addFollower(
	184,
	false,
	{
		collectGroup="184.185.186",
		zone = 947,
		{"questrow",
			{34787, 80078, 947, 56.5, 23.5},
			{35552, 80073, 947, 62.4, 26.2 },
			{34791, "o233229", 947, 60.9, 24.5},
			{34789, 80073, 946, 62.4, 26.2},
			{34792, 80073, 947, 66.4, 26.2},
			{34788, 80073, 947, 62.4, 26.2}
		},
		{"desc", {
			enUS = "Gained afte completing the Elodor questline. You have to choose between Andren, Chel and Onaala. (Tritox/WoWHead)",
			zhTW = "完成埃羅多爾任務線後獲得的，你需要在三個追隨者之間做出一個選擇。",
			zhCN = "完成埃罗多尔任务线后获得的，你需要在三个追随者之间做出一个选择。",
		}},
	},
	{
		ignore=true,
		collectGroup="184.185.186",
		zone=941,
		{"questrow", 
			{33828, 72940, 941, nil, nil},
			{33493, 72940, 941, nil, nil},
			{37291, 74163, 976, 50, 38.4},
			{34722, 74163, 976, 50, 38.4},
			{33010, 74163, 976, 50, 38.4},
			{34123, 76720, 941, 65.4, 65.6},
			{34124, 76487, 941, 73.4, 58.8},
		}
	}
);



--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
