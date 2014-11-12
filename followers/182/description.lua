
-- ID: 182, Name: Shelly Hamby (A)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 182;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 947;
	data = {{"pos", {947}}, {"questrow", {34820, 80163, 971, 43.8, 53.4}, {33263, 79966, 947, 39.6, 29.6}, {33271, 73877, 947, 47, 14.4}, {35625, 76748, 947, 36.4, 19.2}}};

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

