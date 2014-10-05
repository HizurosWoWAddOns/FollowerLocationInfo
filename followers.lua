
local addon,ns = ...;
local faction = UnitFactionGroup("player");
ns.followers = false;



-- faction neutral

--[[ ? ]]
ns.followers[194] = { {"pos", {962}}, {"requirements", "Lumber mill (Level 3)"} };

--[[ ? ]]
ns.followers[195] = { {"pos", {962}}, {"requirements", "Lumber mill"}, {"img", "195"} };



if (faction:lower()=="alliance") then


	-- shadowmoon valley / 947

	--[[ Qiana Moonshadow ]]
	ns.followers[ 34] = { {"pos", {947}}, {"quest", {34646, 79457, 971, 44, 52.8}} };

	--[[ Artificer Romuul ]] --[=[ TODO :: image ? ]=]
	ns.followers[179] = { {"pos", {947}}, {"event", {33038, 74741, 947, 42.8, 40.4}} };

	--[[ Fiona ]]
	ns.followers[180] = { {"pos", {947}}, {"quest", {35014, 80727, 947, 53.6, 57.2}, {35617, 76204, 947, 53.6, 57.2}} };

	--[[ Shelly Hamby ]]
	ns.followers[182] = { {"pos", {947}}, {"questrow", {34820, 80163, 971, 43.8, 53.4}, {33263, 79966, 947, 39.6, 29.6}, {33271, 73877, 947, 47, 14.4}, {35625, 76748, 947, 36.4, 19.2}} };

	--[[ Rulkan ]]
	ns.followers[183] = { {"pos", {947}}, {"quest", {35631, 75884, 947, 45.6, 26.2}} };

	--[[ Apprentice Artificer Andren ]] --[=[ TODO :: missing quest id's and more... ]=]
	ns.followers[184] = { {"pos", {947}}, {"questrow", {34787, 00000, 000, nil, nil}, {35552, 80073, 947, 62.4, 26.2 }, {34791, "o233229", 947, 61, 24.5}, {34789, 80073, 946, 62.4, 26.2}, {34792, 80073, 947, 66.4, 26.2}, {34788, 80073, 947, 62.4, 26.2}} };

	--[[ Rangari Chel ]]
	ns.followers[185] = ns.followers[184];

	--[[ Vindicator Onaala ]]
	ns.followers[186] = ns.followers[184];


	-- gorgrond / 949

	--[[ Tormmok ]]
	ns.followers[193] = { {"pos", {949, 44.9, 86.6}} };

	--[[ Blook ]]
	ns.followers[189] = false;

	--[[ Glirin ]]
	ns.followers[211] = false;

	--[[ Pitfighter Vaandaam ]]
	ns.followers[176] = false;

	--[[ Rangari Erdanii ]]
	ns.followers[212] = false;

	--[[ Rangani Kaalya ]]
	ns.followers[159] = false;


	-- talador / 946

	--[[ Defender Illona ]] --[=[ TODO :: missing data... ]=]
	ns.followers[207] = { {"pos", {946, 57.5, 51.1}}, --[[{"quest", {34777, 00000, 946, 57.5, 51.1 }, {36519, 00000, 000, nil, nil } }]] };

	--[[ Ahm ]] --[=[ TODO :: missing data... ]=]
	ns.followers[208] = { {"pos", {946, 56.7, 26.0}}, {"quest", {36027, 78638, 946, 84.6, 31.6}} };

	--[[ Image if Archmage Vargoth ]]
	ns.followers[190] = false;

	--[[ Magister Serenaa ]]
	ns.followers[154] = false;

	--[[ Miall ]]
	ns.followers[155] = false;

	--[[ Pleasure-Bot 8000 ]]
	ns.followers[171] = { {"pos", {946, 62.9, 50.3}}, {"questrow", {34761, 79901, 946, 62.8, 50.2}, {35239, 79853, 946, 62.8, 50.4}} };

	--[[ Soullbidner Tuulani ]]
	ns.followers[205] = false;


	-- spires of arak / 948

	--[[ Leorajh ]]
	ns.followers[219] = { {"pos", {948, 0, 0}}, {"img", "219-1", "219-2", "219-3"} };

	--[[ Talonpriest Ishaal ]]
	ns.followers[218] = false;

	--[[ Admiral Taylor ]]
	ns.followers[204] = false;

	--[[ Hulda Shadowblade ]]
	ns.followers[453] = false;

	--[[ Kimzee Pinchwhistle ]]
	ns.followers[192] = false;

	--[[ Ziri'ak ]]
	ns.followers[168] = false;


	-- nagrand / 950

	--[[ Abu'gar ]]
	ns.followers[209] = false;

	--[[ Goldmane the Skinner ]]
	ns.followers[170] = false;

	--[[ Lantresor of the Blade ]]
	ns.followers[157] = false;


	-- frostfire ridge / 941

	--[[ Dagg]]
	ns.followers[32] = { {"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}}, {"quest", {34733, 79492, 971, 54.8, 69.4} } };


	-- ashran / 978 // -- stormshield / 1009

	--[[ Dawnseeker Rukaryx ]] --[=[ TODO :: missing data... ]=]
	ns.followers[462] = { {"pos", {1009, 49.9, 61.4}}, {"payment", {823,5000}, {"gold", 50000000} } };

	--[[ Delvar Ironfist ]]
	ns.followers[216] = { {"pos", {971}}, {"quest", {36624, 00000, 000, nil, nil}, {36630, 00000, 000, nil, nil}} };


elseif (faction:lower()=="horde") then


	-- Frostfire Ridge / 941

	--[[ Dagg ]]
	ns.followers[32] = { {"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}}, {"quest", {34733, 79492, 976, 48.8, 17.2}} };

	--[[ Olin Umberhide ]]
	ns.followers[34] = false;

	--[[ Weaponsmith Na'Shral ]]
	ns.followers[179] = false;

	--[[ Shadow Hunter Rala ]]
	ns.followers[180] = false;

	--[[ Mulverick ]]
	ns.followers[182] = false;

	--[[ Gronnstalker Rokash ]]
	ns.followers[183] = false;

	--[[ Kal'gor the Honorable ]]
	ns.followers[184] = false;

	--[[ Lokra ]]
	ns.followers[185] = false;

	--[[ Greatmother Geyah ]]
	ns.followers[186] = false;


	-- Gorgrond / 949

	--[[ Tormmok ]]
	ns.followers[193] = false;

	--[[ Blook ]]
	ns.followers[189] = false;

	--[[ Bruto ]]
	ns.followers[176] = false;

	--[[ Kaz the Shrieker ]]
	ns.followers[159] = false;

	--[[ Penny Clobberbottom ]]
	ns.followers[211] = false;

	--[[ Spirit of Bony Xuk ]]
	ns.followers[212] = false;


	-- Talador / 946

	--[[ Aeda Brightdawn ]]
	ns.followers[207] = false;

	--[[ Ahm ]]
	ns.followers[208] = false;

	--[[ Image of Archmage Vargoth ]]
	ns.followers[190] = false;

	--[[ Magister Krelas ]]
	ns.followers[154] = false;

	--[[ Morketh Bladehowl ]]
	ns.followers[155] = false;

	--[[ Pleasure-Bot 8000 ]]
	ns.followers[171] = false;

	--[[ Soulbinder Tuulani ]]
	ns.followers[205] = false;


	-- Spires of Arak / 948

	--[[ Leorajh ]]
	ns.followers[219] = false;

	--[[ Talonpriest Ishaal ]]
	ns.followers[218] = false;

	--[[ Benjamin Gibb ]]
	ns.followers[204] = false;

	--[[ Dark Ranger Velonara ]]
	ns.followers[453] = false;

	--[[ Kimzee Pinchwhistle ]]
	ns.followers[192] = false;

	--[[ Ziri'ak ]]
	ns.followers[168] = false;


	-- Nagrand / 950

	--[[ Abu'gar ]]
	ns.followers[209] = false;

	--[[ Goldmane the Skinner ]]
	ns.followers[170] = false;

	--[[ Lantresor of the Blade ]]
	ns.followers[157] = false;


	-- Ashran 978 // Warspear / 1011

	--[[  ]]
	--ns.followers[] = false;



end










--[[
	http://wowpedia.org/MapID
	http://wod.wowhead.com/guide=2533
]]

