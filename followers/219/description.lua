
-- ID: 219, Name: Leorajh

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 219;
local neutral = true;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 948;
	data = {{"pos", {948, 0, 0}}, {"img", "1", "2", "3"}};

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

