
local L, addon, ns = {}, ...;

ns.isAlliance = UnitFactionGroup("player")=="Alliance"

ns.L = setmetatable(L,{__index=function(t,k)
	local v = tostring(k);
	rawset(t,k,v);
	return v;
end});

-- Global strings; deprecated?
L["Traits"] = _G["GARRISON_TRAITS"]
L["Abilities"] = _G["ABILITIES"]
L["Achievements"] = _G["ACHIEVEMENTS"]
L["Missions"] = _G["GARRISON_MISSIONS"]
L["quest_s"] = _G["QUESTS_LABEL"]
L["Reputation"] = _G["REPUTATION"]
L["Merchant"] = _G["MERCHANT"]

-- Fetch some localizations from blizzards functions
L["Brawler's Guild"] = GetCategoryInfo(15202);
L["Classes"] = strtrim(gsub(ITEM_CLASSES_ALLOWED, (LOCALE_zhCN or LOCALE_zhTW) and "\239\188\154%%s" or ": %%s", ""));
L["Requirements"] = strtrim(gsub(QUEST_TOOLTIP_REQUIREMENTS, (LOCALE_zhCN or LOCALE_zhTW) and "\239\188\154" or ":", ""));

-- Do you want to help localize this addon?
-- https://www.curseforge.com/wow/addons/@cf-project-name@/localization

--@do-not-package@
L["AddOnLoaded"] = "AddOn loaded..."
--@end-do-not-package@


