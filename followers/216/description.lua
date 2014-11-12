
-- ID: 216, Name: Delvar Ironfist (A only)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 216;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 971;
	data = {{"pos", {971}}, {"quest", {36624, 00000, 000, nil, nil}, {36630, 00000, 000, nil, nil}}};

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

