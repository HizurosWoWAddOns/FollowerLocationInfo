
-- ID: 462, Name: Dawnseeker Rukaryx (A)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 462;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 0;
	data = {{"pos", {1009, 49.9, 61.4}}, {"payment", {823,5000}, {"gold", 50000000} } };

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
