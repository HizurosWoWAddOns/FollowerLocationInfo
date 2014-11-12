
-- ID: 171, Name: Pleasure-Bot 8000

local _, ns = ...;
local L = ns.locale;
local data,zone = {},nil;

local id = nil;

if (ns.faction:lower()=="alliance") then

	zone = 946;
	data = {
		{"pos", {946, 62.9, 50.3}},
		{"questrow", {34761, 79901, 946, 62.8, 50.2}, {35239, 79853, 946, 62.8, 50.4}}
	};

	if LOCALE_deDE then
		tinsert(data,{"desc", "Nach der Quest bekommt man ihn als Belohnung. Der Ladevorgang dauert etwas, daher sollte man nach der Abgabe des Quests nicht weglaufen..."});
	else -- if LOCALE_enUS then [english as fallback]
		tinsert(data,{"desc", "After the quest, you get him as a reward. The charging process takes a while so you should not run away after the release of the quest ..."});
	end

else

	zone = 946;
	data = {
		{"pos", {946}}
	};

	if LOCALE_deDE then
		tinsert(data,{"desc", "Nach der Quest bekommt man ihn als Belohnung. Der Ladevorgang dauert etwas, daher sollte man nach der Abgabe des Quests nicht weglaufen..."});
	else -- if LOCALE_enUS then [english as fallback]
		tinsert(data,{"desc", "After the quest, you get him as a reward. The charging process takes a while so you should not run away after the release of the quest ..."});
	end

end

if (id) and (#data>0) then
	ns.followers[id] = data;
	ns.followers_zones[id] = zone;
end
