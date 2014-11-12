
-- ID: 207, Name: Defender Illona (A) / Aeda Brightdawn (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = nil;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 0;
	data = {{"pos", {946, 57.5, 51.1}}, --[[{"quest", {34777, 00000, 946, 57.5, 51.1 }, {36519, 00000, 000, nil, nil } }]] };

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

