
local addon,ns = ...;
local faction = UnitFactionGroup("player");

ns.followers = {};

-- faction neutral
ns.followers[194] = {
	{"pos", {962}},
	{"requirements", "Lumber mill (Level 3)"},
	{"desc", "194"}
}
ns.followers[195] = {
	{"pos", {962}},
	{"requirements", "Lumber mill"},
	{"desc", "195"},
	{"img", "195"}
}

if (faction:lower()=="alliance") then

	-- shadowmoon valley / 947
	ns.followers[179] = {
		{"pos", {947}}, -- coords
		{"event", {33038, 00000, 000, nil, nil}},
	}
	ns.followers[153] = {
		--{"pos", {947}},
		{"mission", 66}
	}
	ns.followers[463] = {
		--{"pos", {947}},
		{"mission", 91}
	}
	ns.followers[180] = {
		{"pos", {947}},
		{"quest", {35617, 76204, 947, 53.6, 57.2}}
	}

	ns.followers[34] = {
		{"pos", {947}},
		{"quest", {34646, 79457, 971, nil, nil}}
	}

	ns.followers[182] = {
		{"pos", {947}},
		{"questrow",
			{34820, 80163, 971, nil, nil },
			{33263, 79966, 947, 39.6, 29.6 },
			{00000, 00000, 000, nil, nil },
			{33271, 00000, 000, nil, nil }
		}
	}
	ns.followers[183] = {
		{"pos", {947}},
		{"quest", {35631, 75884, 947, 45.6, 26.2 }}
	}
	ns.followers[184] = {
		{"pos", {947, 62.4, 26.2}},
		{"questrow",
			{34787, 00000, 000, nil, nil },
			{35552, 00000, 000, nil, nil },
			{34791, 00000, 000, nil, nil },
			{34789, 00000, 000, nil, nil },
			{34792, 00000, 000, nil, nil },
			{34788, 00000, 000, nil, nil }
		}
	}
	ns.followers[185] = ns.followers[184];
	ns.followers[186] = ns.followers[184];

	-- gorgrond / 949
	ns.followers[193] = {
		{"pos", {949, 44.9, 86.6}},
	--	{"quest", {}}
	}

	-- talador / 946
	ns.followers[171] = {
		{"pos", {946, 62.9, 50.3}},
		{"quest", {34761}},
		{"desc", "171"},
		{"img", "171"},
	}
	ns.followers[207] = { -- illona
		{"pos", {946, 57.5, 51.1}},
		{"quest",
			{34777, 00000, 946, 57.5, 51.1 },
			{36519, 00000, 000, nil, nil }
		}
	}

	ns.followers[208] = { -- ahm
		{"pos", {946, 56.7, 26.0}},
	}

	-- spires of arak / 948
	ns.followers[219] = {
		{"pos", {948, 0, 0}},
		{"img", "219-1", "219-2", "219-3"},
	}

	-- nagrand / 950
	--ns.followers[209] = { }
	--ns.followers[170] = { }
	--ns.followers[157] = { }

	-- frostfire ridge / 941
	ns.followers[32] = {
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 00000, 000, nil, nil}},
		{"desc", "32"}
	}

	-- ashran / 978

	-- stormshield / 1009
	ns.followers[462] = {
		{"pos", {1009, 49.9, 61.4}},
		{"currency",
			{823,5000},
			{"gold", 50000000}
		}
		
	}

	ns.followers[216] = {
		{"pos", {971}},
		{"quest",
			{36624, 00000, 000, nil, nil},
			{36630, 00000, 000, nil, nil}
		}
	}

else
--[[
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
	ns.followers[193] = {
		{"pos", {949, 44.9, 86.6}},
--		{"quest", {}}
	}

	-- talador / 946
	ns.followers[171] = {
		{"pos", {946, 62.9, 50.3}},
		{"quest", {34761}},
		{"desc", "171"},
		{"img", {"171"}},
	}
	ns.followers[207] = { -- illona
		{"pos", {946, 57.5, 51.1}},
		{"quest", {34777, 36519}}
	}
	ns.followers[208] = { -- ahm
		{"pos", {946, 56.7, 26.0}},
	}

	-- spires of arak / 948
	ns.followers[219] = {
		{"pos", {948, 0, 0}},
		{"img", {"219-1", "219-2", "219-3"}},
	}

	-- nagrand / 950
	ns.followers[209] = { }
	ns.followers[170] = { }
	ns.followers[157] = { }

	-- frostfire ridge / 941
	ns.followers[32] = {
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}}, -- check... has 2 positions...
		{"quest", {34733}},
		{"desc", "32"}
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
	]]
	--	ns.followers[] = {}
end










--[[

	MapID's http://wowpedia.org/MapID


	http://wod.wowhead.com/guide=2533#alliance-zones-shadowmoon-valley

]]