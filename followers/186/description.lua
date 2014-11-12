
-- ID: 186, Name: Vindicator Onaala (A) / Greatmother Geyah (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 186;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 947;
	data = {{"pos", {947}}, {"questrow", {34787, 00000, 000, nil, nil}, {35552, 80073, 947, 62.4, 26.2 }, {34791, "o233229", 947, 61, 24.5}, {34789, 80073, 946, 62.4, 26.2}, {34792, 80073, 947, 66.4, 26.2}, {34788, 80073, 947, 62.4, 26.2}}};

	if LOCALE_deDE then
		--tinsert(data,{"desc", "");
	else -- if LOCALE_enUS then [english as fallback]
		--tinsert(data,{"desc", "");
	end

else

	zone = 0;
	data = {};

	if LOCALE_deDE then
		--tinsert(data,{"desc", "");
	else -- if LOCALE_enUS then [english as fallback]
		--tinsert(data,{"desc", "");
	end

end


if (id) and (#data>0) then
	ns.followers[id] = data;
	ns.followers_zones[id] = zone;
end

--[=[ TODO :: missing quest id's and more... ]=]
