
-- ID: 208, Name: Ahm

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 208;
local neutral = true;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 946;
	data = {{"pos", {946, 56.7, 26.0}}, {"quest", {36027, 78638, 946, 84.6, 31.6}}};

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

--[=[ TODO :: missing data... ]=]
