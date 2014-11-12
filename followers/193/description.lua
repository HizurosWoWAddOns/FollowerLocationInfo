
-- ID: 193, Name: Tormmok

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 193;
local neutral = true;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 949;
	data = {{"pos", {949, 44.9, 86.6}}};

	if LOCALE_deDE then
		tinsert(data,{"desc", "Helft ihm sich zu verteidigen. Danach wird er freundlich und kann rekrutiert werden."});
	else -- if LOCALE_enUS then [english as fallback]
		tinsert(data,{"desc", "Help him to defend himself. Then he is friendly and can be recruited."});
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

