
ns.followers[194] = { {"pos", {962}}, {"requirements", "Lumber mill (Level 3)"} }; --[[ ? ]]
ns.followers[195] = { {"pos", {962}}, {"requirements", "Lumber mill"}, {"img", "195"} }; --[[ ? ]]
ns.followers[189] = { {"quest", {34279, 78030, 949, 41.2, 91.4}} };	--[[ Blook ]]
ns.followers[168] = false;	--[[ Ziri'ak ]]
ns.followers[170] = false;	--[[ Goldmane the Skinner ]]
ns.followers[157] = false;	--[[ Lantresor of the Blade ]]

if (faction:lower()=="alliance") then

	ns.followers[ 32] = { {"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}}, {"quest", {34733, 79492, 971, 54.8, 69.4} } };	--[[ Dagg]]
	ns.followers[ 34] = { {"pos", {947}}, {"quest", {34646, 79457, 971, 44, 52.8}} };--[[ Qiana Moonshadow ]]
	ns.followers[154] = false;	--[[ Magister Serenaa ]]
	ns.followers[155] = false;	--[[ Miall ]]
	ns.followers[159] = false;	--[[ Rangani Kaalya ]]
	ns.followers[171] = { {"pos", {946, 62.9, 50.3}}, {"questrow", {34761, 79901, 946, 62.8, 50.2}, {35239, 79853, 946, 62.8, 50.4}} };	--[[ Pleasure-Bot 8000 ]]
	ns.followers[176] = { {"quest row", {34704, 0, 949, 0, 0}, {34699, 0, 949, 0, 0}, {34703, }, {35137, 0, 949, 0, 0}}};	--[[ Pitfighter Vaandaam ]]
	ns.followers[179] = { {"pos", {947}}, {"event", {33038, 74741, 947, 42.8, 40.4}} };	--[[ Artificer Romuul ]] --[=[ TODO :: image ? ]=]
	ns.followers[180] = { {"pos", {947}}, {"quest", {35014, 80727, 947, 53.6, 57.2}, {35617, 76204, 947, 53.6, 57.2}} };	--[[ Fiona ]]
	ns.followers[182] = { {"pos", {947}}, {"questrow", {34820, 80163, 971, 43.8, 53.4}, {33263, 79966, 947, 39.6, 29.6}, {33271, 73877, 947, 47, 14.4}, {35625, 76748, 947, 36.4, 19.2}} };	--[[ Shelly Hamby ]]
	ns.followers[183] = { {"pos", {947}}, {"quest", {35631, 75884, 947, 45.6, 26.2}} };	--[[ Rulkan ]]
	ns.followers[184] = { {"pos", {947}}, {"questrow", {34787, 00000, 000, nil, nil}, {35552, 80073, 947, 62.4, 26.2 }, {34791, "o233229", 947, 61, 24.5}, {34789, 80073, 946, 62.4, 26.2}, {34792, 80073, 947, 66.4, 26.2}, {34788, 80073, 947, 62.4, 26.2}} };	--[[ Apprentice Artificer Andren ]] --[=[ TODO :: missing quest id's and more... ]=]
	ns.followers[185] = ns.followers[184];	--[[ Rangari Chel ]]
	ns.followers[186] = ns.followers[184];	--[[ Vindicator Onaala ]]
	ns.followers[190] = false;	--[[ Image if Archmage Vargoth ]]
	ns.followers[192] = { {"quest", {36062, 0, 948, 61.6, 72.8}} };	--[[ Kimzee Pinchwhistle ]]
	ns.followers[193] = { {"pos", {949, 44.9, 86.6}} };	--[[ Tormmok ]]
	ns.followers[204] = false;	--[[ Admiral Taylor ]]
	ns.followers[205] = false;	--[[ Soullbidner Tuulani ]]
	ns.followers[207] = { {"pos", {946, 57.5, 51.1}}, --[[{"quest", {34777, 00000, 946, 57.5, 51.1 }, {36519, 00000, 000, nil, nil } }]] };	--[[ Defender Illona ]] --[=[ TODO :: missing data... ]=]
	ns.followers[208] = { {"pos", {946, 56.7, 26.0}}, {"quest", {36027, 78638, 946, 84.6, 31.6}} };	--[[ Ahm ]] --[=[ TODO :: missing data... ]=]
	ns.followers[209] = false;	--[[ Abu'gar ]]
	ns.followers[211] = { {"quest", {36828, 85119, 949, 53, 59.4}} };	--[[ Glirin ]] --[=[ questrow? ]=]
	ns.followers[212] = false;	--[[ Rangari Erdanii ]]
	ns.followers[216] = { {"pos", {971}}, {"quest", {36624, 00000, 000, nil, nil}, {36630, 00000, 000, nil, nil}} };	--[[ Delvar Ironfist ]]
	ns.followers[218] = false;	--[[ Talonpriest Ishaal ]]
	ns.followers[219] = { {"pos", {948, 0, 0}}, {"img", "219-1", "219-2", "219-3"} };	--[[ Leorajh ]]
	ns.followers[453] = false;	--[[ Hulda Shadowblade ]]
	ns.followers[462] = { {"pos", {1009, 49.9, 61.4}}, {"payment", {823,5000}, {"gold", 50000000} } };	--[[ Dawnseeker Rukaryx ]] --[=[ TODO :: missing data... ]=]

elseif (faction:lower()=="horde") then

	ns.followers[32] = { {"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}}, {"quest", {34733, 79492, 976, 48.8, 17.2}} };	--[[ Dagg ]]

	ns.followers[34] = { {"pos", {941}--[=[frostwall id?]=]}, {
		"questrow",
		{33868, 0, 976, 0, 0}, --[=[ unknown npc ]=]
		{33815, 76411, 976, 49.2, 50}, -- Farseeker Drek'Thar
		{34402, 78272, 941, 41.8, 69.6}, -- Durotan
		{34364, 70859, 941, 48.6, 65.2}, -- Thrall
		{34375, 78466, 976, 42, 55}, -- Gazlowe
		{34378, 78466, 976, 42, 55}, -- Gazlowe
		{34822, 78466, 976, 42, 55}, -- Gazlowe
		{34461, 78466, 976, 42, 55}, -- Gazlowe
		{34861, 78466, 976, 42, 55}, -- Gazlowe
		{34462, 79740, 976, 53.8, 54.2}, -- Warmaster Zog
	} }; --[[ Olin Umberhide ]]

	ns.followers[154] = false;	--[[ Magister Krelas ]]
	ns.followers[155] = false;	--[[ Morketh Bladehowl ]]
	ns.followers[159] = false;	--[[ Kaz the Shrieker ]]
	ns.followers[171] = false;	--[[ Pleasure-Bot 8000 ]]
	ns.followers[176] = false;	--[[ Bruto ]]
	ns.followers[179] = { {"quest", {34729, 74977, 941, 65, 39.4}} };	--[[ Weaponsmith Na'Shral ]]
	ns.followers[180] = { {"questrow", {34736, 78487, 976, 45.6, 43.2}, {34344, 78487, 976, 45.6, 43.2}, {34731, 78487, 976, 45.6, 43.2}, {34345, 78487, 976, 45.6, 43.2}, {34348, 78487, 976, 45.6, 43.2} } };	--[[ Shadow Hunter Rala ]]
	ns.followers[182] = false;	--[[ Mulverick ]]
	ns.followers[183] = false;	--[[ Gronnstalker Rokash ]]
	ns.followers[184] = false;	--[[ Kal'gor the Honorable ]]
	ns.followers[185] = false;	--[[ Lokra ]]
	ns.followers[186] = false;	--[[ Greatmother Geyah ]]
	ns.followers[190] = false;	--[[ Image of Archmage Vargoth ]]
	ns.followers[192] = false;	--[[ Kimzee Pinchwhistle ]]
	ns.followers[193] = false;	--[[ Tormmok ]]
	ns.followers[204] = false;	--[[ Benjamin Gibb ]]
	ns.followers[205] = false;	--[[ Soulbinder Tuulani ]]
	ns.followers[207] = false;	--[[ Aeda Brightdawn ]]
	ns.followers[208] = false;	--[[ Ahm ]]
	ns.followers[209] = false;	--[[ Abu'gar ]]
	ns.followers[211] = false;	--[[ Penny Clobberbottom ]]
	ns.followers[212] = false;	--[[ Spirit of Bony Xuk ]]
	ns.followers[218] = false;	--[[ Talonpriest Ishaal ]]
	ns.followers[219] = false;	--[[ Leorajh ]]
	ns.followers[453] = false;	--[[ Dark Ranger Velonara ]]


