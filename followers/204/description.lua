
-- ID: 204, Name: Admiral Taylor (A) / Benjamin Gibb (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = nil;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 0;
	data = {};

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

