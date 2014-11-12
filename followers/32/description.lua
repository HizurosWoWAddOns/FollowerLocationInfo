
-- ID: 32, Name: Dagg

local _, ns = ...;
local L = ns.locale;
local fID = ns.factionID;
local data,zone = {},nil;

local id = 32;

if (fID==1) then

	zone = 941;
	data = {
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 971, 54.8, 69.4}}
	};

elseif (fID==2) then

	zone = 941;
	data = {
		{"pos", {941, 65.9, 60.8}, {941, 39.6, 28.0}},
		{"quest", {34733, 79492, 976, 48.8, 17.2}}
	};

end

if LOCALE_deDE then
	tinsert(data,{"desc","Befreie ihn zweimal aus Gefangenschaft. Dann kehre zu deiner Garnison zurück und du wirst ihn ausserhalb der Festungsmauern finden."});
else -- if LOCALE_enUS then [english as fallback]
	tinsert(data,{"desc","Liberate him twice from captivity. Then return to your garrison and you'll find him outside the fortress walls."});
end

if (id) and (#data>0) then
	ns.followers[id] = data;
	ns.followers_zones[id] = zone;
end

