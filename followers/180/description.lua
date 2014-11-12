
-- ID: 180, Name: Fiona (A) / Shadow Hunter Rala (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 180;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 947;
	data = {{"pos", {947}}, {"quest", {35014, 80727, 947, 53.6, 57.2}, {35617, 76204, 947, 53.6, 57.2}}};

	if LOCALE_deDE then
		--tinsert(data,{"desc", "");
	else -- if LOCALE_enUS then [english as fallback]
		--tinsert(data,{"desc", "");
	end

else

	zone = 976;
	data = {{"questrow", {34736, 78487, 976, 45.6, 43.2}, {34344, 78487, 976, 45.6, 43.2}, {34731, 78487, 976, 45.6, 43.2}, {34345, 78487, 976, 45.6, 43.2}, {34348, 78487, 976, 45.6, 43.2} }};

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
