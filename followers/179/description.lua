
-- ID: 179, Name: Artificer Romuul (A) / Weaponsmith Na'Shral (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 179;
local neutral = false;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 947;
	data = {{"pos", {947}}, {"event", {33038, 74741, 947, 42.8, 40.4}}};

	if LOCALE_deDE then
		tinsert(data,{"desc", "Romuul startet ein Ereignis, bei dem man ihn beschützen muss bis er seine Arbeit erledigt hat."});
	else -- if LOCALE_enUS then [english as fallback
		tinsert(data,{"desc", "Romuul starts an event where you have to protect him until he does his work."});
	end

else

	zone = 941;
	data = {{"quest", {34729, 74977, 941, 65, 39.4}}};

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

--[=[ TODO :: image ? ]=]
