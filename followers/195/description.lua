
-- ID: 195, Name: Weldon Barov (A) / Alexi Weldon (H)

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = 195;
local neutral = true;

if (ns.faction:lower()=="alliance") or (neutral) then

	zone = 962;
	data = {
		{"pos", {962}},
		{"requirements", "Lumber mill"},
		{"img", "1"},
		ModelPosition = {1.5,0,-0.59}
	};

	if LOCALE_deDE then
		tinsert(data,{"desc","Barov liegt an einer zufälligen Position in Draenor unter einem gefällten Baum. Mit der Fähigkeit des Sägewerks kannst du Barov befreien. Danach bietet er seine Gefolgschaft an."});
	else -- if LOCALE_enUS then [english as fallback]
		tinsert(data,{"desc", "Barov is located at a random position in Draenor under a felled tree. With the ability of the sawmill Barov you can free. Then he offers his following."});
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
