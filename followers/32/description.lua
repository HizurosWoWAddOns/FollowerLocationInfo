
-- ID: 32, Name: Dagg

local _, ns = ...;

local desc = {
	enUS = "Liberate him twice from captivity. Then return to your garrison and you'll find him outside the fortress walls.",
	deDE = "Befreie ihn zweimal aus Gefangenschaft. Dann kehre zu deiner Garnison zurück und du wirst ihn ausserhalb der Festungsmauern finden.",
	zhTW = "從囚禁中解放了他兩次。然後返回到您的要塞，你會發現他在堡壘城牆外。",
	zhCN = "从囚禁中解放了他两次。然后返回到您的要塞，你会发现他在堡垒城墙外。",
};

ns.addFollower(
	32,
	false,
	{
		zone = 941,
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 971, 54.8, 69.4}},
		{"desc", desc },
	},
	{
		zone = 941,
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 976, 48.8, 17.2}},
		{"desc", desc },
	}
);

--local desc = {enUS="",enGB="",deDE="",esES="",esMX="",frFR="",itIT="",koKR="",ptBR="",ruRU="",zhCN="",zhTW=""};