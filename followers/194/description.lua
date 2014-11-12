
-- ID: 194, Name: Phylarch the Evergreen

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 194;
local neutral = true;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 962;
	data = {{"pos", {962}}, {"requirements", "Lumber mill (Level 3)"}};

	if LOCALE_deDE then
		tinsert(data,{"desc", "Beim fällen von Bäumen wird man von ihm angegriffen. Er verschwindet mit wenig Leben. Das geht ein paar mal so bis er sich ergibt."});
	else -- if LOCALE_enUS then [english as fallback]
		tinsert(data,{"desc", "In cases of trees being attacked by him. He disappears with little life. This is a few times until he surrenders."});
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
