
-- ID: 211, Name: Glirin (A) / Penny Clobberbottom (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 211;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 949;
	data = {{"quest", {36828, 85119, 949, 53, 59.4}}};

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



--[=[ questrow? ]=]
