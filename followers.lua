
local addon,ns = ...;
local faction = UnitFactionGroup("player");

ns.followers = { -- faction neutral
	[194] = {
		{"pos", {962}},
		{"requirements", {"Lumber mill (Level 3)"}},
		{"desc", "194"}
	},
	[195] = {
		{"pos", {962}},
		{"requirements", {"Lumber mill"}},
		{"desc", "195"},
		{"img", {"195"}}
	}
};

if (faction:lower()=="alliance") then

	-- shadowmoon valley / 947
	ns.followers[179] = {
		{"pos", {947}}, -- coords
		{"event", {33038}},
	}
	ns.followers[153] = {
		{"pos", {947}},
		{"mission", 66}
	}
	ns.followers[463] = {
		{"pos", {947}},
		{"mission", 91}
	}
	ns.followers[180] = {
		{"pos", {947}},
		{"quest", {35617}}
	}
	ns.followers[34] = {
		{"pos", {947}},
		{"quest", {34646}}
	}
	ns.followers[182] = {
		{"pos", {947}},
		{"questrow", {34820, 33263, 0, 33271}}
	}
	ns.followers[183] = {
		{"pos", {947}},
		{"quest", {35631}}
	}
	ns.followers[184] = {
		{"pos", {947}}, -- , 62.4, 26.2}
		{"questrow", {34787, 35552, 34791, 34789, 34792 ,34788}}
	}
	ns.followers[185] = ns.followers[184];
	ns.followers[186] = ns.followers[184];

	-- gorgrond / 949
	--ns.followers[] = {}

	-- talador / 946
	ns.followers[171] = {
		{"pos", {946, 62.9, 50.3}},
		{"quest", {34761}},
		{"desc", "171"},
		{"img", {"171"}},
	}

	-- spires of arak / 948
	--ns.followers[] = {}

	-- nagrand / 950
	ns.followers[209] = {
	}
	ns.followers[170] = {
	}
	ns.followers[157] = {
	}

	-- frostfire ridge / 941
	ns.followers[32] = {
		{"pos", {941}}, -- check... has 2 positions...
		--{"quest", {}}
	}

	-- ashran / 978

	-- stormshield / 1009
	ns.followers[462] = {
		{"pos", {1009}},
		{"currency", {823,500}}
	}

	ns.followers[216] = {
		{"pos", {971}},
		{"quest", {36624,36630}}
	}
else
--	ns.followers[] = {}
end















--[[

	Morgensucher Rukaryx
		type: buy
		from: <npcid>
		location: <mapid>-<x>-<y>


]]


--[[

	Genussbot 8000 (171)
		Type: Quest
		Map: Talandor
		Pos: 62.9, 50.3
		Torben Zischknall
			Quest: Achtung, Schock! (start: 34761)

]]


--[[

	MapID's http://wowpedia.org/MapID


	http://wod.wowhead.com/guide=2533#alliance-zones-shadowmoon-valley

]]