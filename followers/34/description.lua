
-- ID: 34, Name: Qiana Moonshadow (Alliance) / Olin Umberhide (Horde)

local _, ns = ...;
local L = ns.locale;

local id,data,zone = 34,{},nil;

if (ns.faction:lower()=="alliance") then

	zone = 947;
	data = {
		{"pos", {947}},
		{"quest", {34646, 79457, 971, 44, 52.8}}
	};

	if LOCALE_deDE then
		--data.desc = "";
	else -- if LOCALE_enUS then [english as fallback]
		--data.desc = "";
	end

else

	zone = 941;
	data = {
		{"pos", {976}--[=[frostwall id?]=]},
		{"questrow",
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
		}
	};

	if LOCALE_deDE then
		--data.desc = "";
	else -- if LOCALE_enUS then [english as fallback]
		--data.desc = "";
	end

end


if (id) and (#data>0) then
	ns.followers[id] = data;
	ns.followers_zones[id] = zone;
end
