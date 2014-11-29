
-- ID: 171, Name: Pleasure-Bot 8000

local _, ns = ...;

local desc = {
	enUS = "After the quest, you get him as a quest reward. The charging process takes a while so you should not run away after completing the quest...",
	deDE = "Nach der Quest bekommt man ihn als Belohnung. Der Ladevorgang dauert etwas, daher sollte man nach Abschluss des Quests nicht weglaufen...",
	zhTW = "在此任務之後，您會得到他作為任務獎勵。裝載的過程需要一會兒，所以你不應該在完成任務後跑開...",
	zhCN = "在此任务之后，您会得到他作为任务奖励。装载的过程需要一会儿，所以你不应该在完成任务后跑开...",
};

ns.addFollower(
	171,
	false,
	{ -- A
		zone = 946,
		{"pos", {946, 62.9, 50.3}},
		{"questrow",
			{34761, 79901, 946, 62.8, 50.2},
			{35239, 79853, 946, 62.8, 50.4}
		},
		{"desc", desc },
	},
	{ -- H
		zone = 946,
		{"pos", {946}},
		{"questrow",
			{34751, 79870, 946, 64.2, 47.8},
			{35238, 79853, 946, 64.2, 47.8}
		},
		{"desc", desc }
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};
