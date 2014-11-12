
-- ID: ?, Name: Rulkan (A)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 183;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 947;
	data = {{"pos", {947}}, {"quest", {35631, 75884, 947, 45.6, 26.2}}};

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
