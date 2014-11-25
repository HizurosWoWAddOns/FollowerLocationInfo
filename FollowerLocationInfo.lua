
local addon,ns = ...;
local L = ns.locale;

ns.faction, ns.factionLocale = UnitFactionGroup("player"); L[ns.faction] = ns.factionLocale;
ns.factionID = ((ns.faction=="Alliance") and 1) or ((ns.faction=="Horde") and 2) or 0;
ns.followers = {};

FollowerLocationInfo_Toggle, FollowerLocationInfo_ToggleCollected, FollowerLocationInfo_ToggleIDs, FollowerLocationInfo_ResetConfig,FollowerLocationInfo_MinimapButton,FollowerLocationInfo_ToggleList=nil,nil,nil,nil,nil,nil;
local configMenu, List_Update, FollowerLocationInfoFrame_OnEvent,ExternalURL;

local followers, zoneNames, classes, collectGroups, classNames1, classNames2, abilityNames = {},{},{},{},{},{},{};
local numHidden,numRealFollowers, numKnownFollowers, numCollectedFollowers = (292-48),0,0,0;
local qualities = {nil,_G.UnitPopupButtons.ITEM_QUALITY2_DESC,_G.UnitPopupButtons.ITEM_QUALITY3_DESC,_G.UnitPopupButtons.ITEM_QUALITY4_DESC};
local initState,doRefresh={minimap=false},false;
local ClassFilterLabel, AbilityFilterLabel = L["Classes & Class speccs"], L["Abilities & Traits"];
local ListButtonOffsetX, ListButtonOffsetY = 0,1;
local ListEntrySelected, ListEntries = false,{};
local SearchStr,ClassFilter,AbilityFilter = "","","";
local GetFollowersOnUpdate,GetFollowersOnUpdateCount = false,0;
local DisabledByLevel,DisabledByBlizzardBug=false,false;
local factionZoneOrder = (ns.faction:lower()=="alliance") and {962,947,971,949,946,948,950,941,978,1009,964,969,984,987,988,989,993,994,995,1008,-1,0}
														   or {962,941,976,949,946,948,950,947,978,1011,964,969,984,987,988,989,993,994,995,1008,-1,0};
for i,v in ipairs(factionZoneOrder) do if (v>0) then zoneNames[v] = GetMapNameByID(v); end end
zoneNames[-1] = L["hidden followers"];
zoneNames[0] = L["No description found for..."];

local modelPositions={
	-- Alliance races ------------------------------------------
	DraeneiF	= {1.9,0,-0.7},		DraeneiM	= {1.5,0,-0.62},
	DwarfF		= {0.9,0,-0.27},	DwarfM		= {1.5,0,-0.45},
	GnomeF		= {0.5,0,-0.18},	GnomeM		= {0.5,0,-0.18},
	HumanF		= {1.2,0,-0.52},	HumanM		= {1.5,0,-0.59},
	NightElfF	= {2,0,-0.62},		NightElfM	= {2,0,-0.62},
	WorgenF		= {3,0,-0.62},		WorgenM		= {1.5,0,-0.62},
	-- Horde races ---------------------------------------------
	BloodElfF	= {1.5,0,-0.51},	BloodElfM	= {2,0,-0.62},
	GoblinF		= {0.7,0,-0.24},	GoblinM		= {0.7,0,-0.24},
	OrcF		= {1.25,0,-0.5},	OrcM		= {1.25,0,-0.5},
	ScourgeF	= {1.7,0,-0.56},	ScourgeM	= {1,0,-0.5},
	TaurenF		= {1.5,0,-0.39},	TaurenM		= {1.5,0,-0.39},
	TrollF		= {1.5,0,-0.42},	TrollM		= {1.5,0,-0.42},
	-- Neutral playable races ----------------------------------
	PandarenF	= {1.2,0,-0.62},	PandarenM	= {2,0,-0.58},
	-- Misc unplayable races -----------------------------------
	Mech		= {2,0,-2.5},		Orge		= {1.4,0,-0.67},
	Zyclope		= {8,0,-3},			Gnoll		= {0.5,0,-0.15},
	Saberon		= {1.45,0,-0.37},	Arakkoa		= {1.5,0,-0.28},
	Hozen		= {2,0,-0.62},		Jinyu		= {2,0,-0.62}
};


--[=[ Broker & Minimap ]=]
local lDB = LibStub("LibDataBroker-1.1");
local lDBI = LibStub("LibDBIcon-1.0");
local function dataBrokerInit()
	if (not lDB) then return; end
	local obj = lDB:NewDataObject(addon, {
		type          = "data source",
		label         = addon,
		icon          = "Interface\\Icons\\Achievement_GarrisonFollower_Rare",
		text          = addon,
		--OnEnter       = function(self) end,
		--OnLeave       = function(self) end,
		OnClick       = function(self,button)
			if (button=="LeftButton") then
				FollowerLocationInfo_Toggle();
			elseif (button=="RightButton") then
				configMenu(self,"TOP","BOTTOM");
			end
		end,
		--OnDoubleClick = function(self) end,
		--OnTooltipShow = function(self) end
	});

	if (GetAddOnInfo("SlideBar")) then
		if (GetAddOnEnableState(UnitName("player"),"SlideBar")>1) then
			local name = addon..".Launcher"
			local obj = lDB:NewDataObject(name, {
				type          = "launcher",
				icon          = "Interface\\Icons\\Achievement_GarrisonFollower_Rare",
				OnClick       = function(self,button) FollowerLocationInfo_Toggle(); end
			});
		end
	end
end
local function minimapInit()
	if (not lDB) or (not lDBI) and (not initState.minimap) then return; end
	local obj = lDB:GetDataObjectByName(addon);
	lDBI:Register(addon, obj, FollowerLocationInfoDB.Minimap);
	initState.minimap=true;
end


--[=[ External URL dialog ]=]
local urls = {
	WoWHead = function(t,id)
		local lang = {deDE="de",esES="es",esMX="es",frFR="fr",ptBR="pt"}
		local field = {q="quest",i="item",s="spell",o="object"}
		return ("http://%s.wowhead.com/%s=%d"):format(lang[GetLocale()] or "www",field[t],id);
	end,
	Buffed = function(t,id)
		local url = {deDE="http://wowdata.buffed.de/?%s=%d",ruRU="http://wowdata.buffed.ru/?%s=%d"}
		local field = {q="q",i="i",s="s",o="o"}
		return (url[GetLocale()] or "http://wowdata.getbuffed.com/?q=%d"):format(field[t],id);
	end,
	WoWDB = function(t,id)
		local field = {q="quests",i="items",s="spells",o="objects"}
		return ("http://www.wowdb.com/%s/%d"):format(field[t],id);
	end
}

StaticPopupDialogs["FLI_URL_DIALOG"] = {
	text = "URL", button2 = CLOSE, timeout = 0, whileDead = 1, 
	hasEditBox = 1, hideOnEscape = 1, maxLetters = 1024, editBoxWidth = 250,
	OnShow = function(f)
		local e,b = _G[f:GetName().."EditBox"],_G[f:GetName().."Button2"];
		if e then e:SetText(ExternalURL) e:SetFocus() e:HighlightText(0) end
		if b then b:ClearAllPoints() b:SetWidth(100) b:SetPoint("CENTER",e,"CENTER",0,-30) end
	end,
	EditBoxOnEscapePressed = function(f)
		f:GetParent():Hide()
	end
}


--[=[ Misc ]=]
local pairsByKeys = function(t, f)
	local a = {}
	for n in pairs(t) do
		table.insert(a, n)
	end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then
			return nil
		else
			return a[i], t[a[i]]
		end
	end
	return iter
end

local function getFollowerID(t)
	return (t.garrFollowerID) and tonumber(t.garrFollowerID) or t.followerID;
end

local function getFollowerBasics(id,key)
	if (ns.follower_basics==nil) then
		error("can't load follower basics");
	end

	if (ns.follower_basics[id]) and (ns.follower_basics[id][key]) then
		if (type(ns.follower_basics[id][key])=="table") then
			return ns.follower_basics[id][key][ns.factionID];
		else
			return ns.follower_basics[id][key];
		end
	end
	return nil;
end

local function IsQuestCompleted(QuestID)
	if (not questsCompleted) or ((questsCompleted) and ((time() - questsCompleted.last)<300)) then
		questsCompleted = {ids=GetQuestsCompleted(), last=time()};
	end
	return (questsCompleted.ids[QuestID]==true);
end

local IsMissing = {npcs={},coords={},zones={},quests={},completed={},descs={}};
IsMissing.chk=function(id,data)
	local hasQuests,hasNpcs,hasDesc = false,false,false;
	if (data.zone==nil) or (data.zone==0) then
		tinsert(IsMissing.zones,id);
	end

	if (data.complete~=true) then
		tinsert(IsMissing.completed,id);
	end

	for i,v in ipairs(data) do
		if (v[1]=="quest") or (v[1]=="questrow") or (v[1]=="event") then
			hasQuests = true;
			for I,V in ipairs(v) do
				if (I>1) and (type(V[2])=="number") and (V[2]~=0) and (ns.npcs[V[2]]==nil) then
					tinsert(IsMissing.npcs,V[2]);
				end
			end
		elseif (v[1]=="vendor") then
			for I,V in ipairs(v) do
				if (I>1) and (type(V[1])=="number") and (V[1]~=0) and (ns.npcs[V[1]]==nil) then
					tinsert(IsMissing.npcs,V[1]);
				end
			end
		elseif (v[1]=="desc") then
			hasDesc=true;
		end
	end

	if (not hasQuests) then
		tinsert(IsMissing.quests,id);
	end

	if (not hasDesc) then
		tinsert(IsMissing.descs,id);
	end
end

ns.addFollower = function(id,neutral,data1,data2,notCount)
	local Data = ((neutral) and data1) or ((ns.faction=="Alliance") and data1 or data2) or {};
	if (#Data>0) and (Data.zone~=0) and (not Data.ignore) then
		ns.followers[id] = Data;
		if (Data.collectGroup) and (collectGroups[Data.collectGroup]==nil) then
			collectGroups[Data.collectGroup]=false;
		end
		if (not notCount) then
			numKnownFollowers = numKnownFollowers + 1;
		end
	end
	if (not notCount) then
		IsMissing.chk(id,Data);
	end
end

local Collector = {data={},hLink=false};
do
	local this,tt = Collector;
	local tryouts = {};
	this.GetData = function(self)
		self:Show();
		local reg,data,line = {self:GetRegions()},{},0;
		for k, v in ipairs(reg) do
			if (v~=nil) and (v:GetObjectType()=="FontString") then
				str = v:GetText();
				if (str~=nil) and (strtrim(str)~="") then
					tinsert(data,str);
					line = line + 1;
				end
			end
		end
		self:Hide();
		if (this.hLink) then
			if (#data>0) then
				this.data[this.hLink] = data;
				this.hLink=false;
			elseif (tryouts[this.hLink]>4) then
				this.data[this.hLink] = false;
			end
		end
		return nil;
	end

	this.QueryHyperlinkData = function(hLink)
		if (not tt) then
			tt = _G.FollowerLocationInfoTooltip;
			tt:SetScript("OnTooltipSetQuest",this.GetData);
			tt:SetScript("OnTooltipSetSpell",this.GetData);
			tt:SetScript("OnTooltipSetItem",this.GetData);
		end
		if (this.hLink~=false) then
			return nil; -- single request per time...
		elseif (this.data[hLink]==false) then
			return false; -- data not collectable... maybe removed...
		elseif (this.data[hLink]==nil) then
			tt:SetOwner(UIParent,"ANCHOR_NONE");
			tt:SetPoint("RIGHT");
			tt:ClearLines();
			this.hLink = hLink;
			if (not tryouts[hLink]) then
				tryouts[hLink] = 1;
			else
				tryouts[hLink] = tryouts[hLink] + 1;
			end
			tt:SetHyperlink(hLink); -- try to request data... > gathered by Collector.GetData...
			return nil;
		else
			return unpack(this.data[hLink]);
		end
		return nil;
	end
end

local function GetQuestInfo(QuestID)
	assert(type(tonumber(QuestID))=="number","Usage: GetQuestInfo( <QuestId[number]> )");
	return Collector.QueryHyperlinkData("quest:"..QuestID);
end

local function GetUnitInfo(UnitID)
	return Collector.QueryHyperlinkData("unit:"..UnitID);
end

local function GetFollowers(self)
	if (DisabledByLevel) then return; end

	-- check on wrong faction
	local test=C_Garrison.GetFollowerInfo(34);
	if ((ns.faction=="Alliance") and (test.displayID~=55047)) or ((ns.faction=="Horde") and (test.displayID~=55046)) then -- is it save to test on displayID?
		if (GetFollowersOnUpdateCount==3) then
			GetFollowersOnUpdate = false;
			DisabledByBlizzardBug = true;
			self.Warning:SetText(L["Unable to load correct faction followers... (Blizzard Bug)"]);
			self.Warning:Show();
			return;
		end
		GetFollowersOnUpdate = true;
		FollowerLocationInfo_ToggleList(false);
		return;
	else
		GetFollowersOnUpdate = false;
		FollowerLocationInfo_ToggleList(false);
	end


	local data = {zone=-1,{"custom",{"Info","Lunarfall/Frostwall Inn follower recruitment?|nNeed help to confirm it..."}}};
	local tmp = C_Garrison.GetFollowers();
	numCollectedFollowers = 0;

	local ids = {};
	for i,v in ipairs(tmp) do
		ids[getFollowerID(v)] = true;
	end

	for i,v in pairs(ns.follower_basics) do
		if (v) and (not ids[i]) then
			local d = C_Garrison.GetFollowerInfo(i);
			if (d) and (type(d.portraitIconID)=="number") and (d.portraitIconID>0) then
				d.hidden=true;
				tinsert(tmp,d);
				ns.followers[getFollowerID(d)] = {zone=-1};
			end
		end
	end

	for _,v in ipairs(tmp) do
		-- is collected?
		v.collected = false;
		if (v.garrFollowerID~=nil) then
			v.followerID,v.garrFollowerID = tonumber(v.garrFollowerID),v.followerID; -- blizzard's stupid order change...
			numCollectedFollowers = numCollectedFollowers + 1;
			v.collected = true;
		end

		v.desc = {};
		if (ns.followers[v.followerID]) then
			-- add zone
			v.zone = ns.followers[v.followerID].zone;

			-- add descriptions without zone
			for _,d in ipairs(ns.followers[v.followerID]) do tinsert(v.desc,d); end

			-- member of a collectGroup? [only one of the group is collectable]
			if (ns.followers[v.followerID].collectGroup) then
				v.collectGroup=ns.followers[v.followerID].collectGroup;
			end
			if (v.collectGroup) and (v.collected) then
				collectGroups[v.collectGroup] = true;
			end
		end

		-- add missing basics and correct wrong level and quality. GetFollower returns current stand of all collected followers, not good for this addon.
		v.race = getFollowerBasics(v.followerID,"race");
		v.level = getFollowerBasics(v.followerID,"level");
		v.quality = getFollowerBasics(v.followerID,"quality");
		local abilities = getFollowerBasics(v.followerID,"abilities");
		local _,class = strsplit("-",v.classAtlas);
		v.class = class;
		local c = classes[v.class:upper()];
		v.classColor = c.colorStr;

		-- add class and class specc names to filter table;
		classNames1[v.className:lower()] = {v.className,v.class:lower()};
		classNames2[v.class] = {_G.LOCALIZED_CLASS_NAMES_MALE[v.class:upper()],v.class:lower()};

		-- get abilities and add it to filter table
		v.abilities = {};
		if (abilities) then
			for _,V in ipairs(abilities) do
				local d = {
					id = V,
					name = C_Garrison.GetFollowerAbilityName(V),
					description = C_Garrison.GetFollowerAbilityDescription(V),
					icon     = C_Garrison.GetFollowerAbilityIcon(V),
					isTrait  = C_Garrison.GetFollowerAbilityIsTrait(V),
					counters = {C_Garrison.GetFollowerAbilityCounterMechanicInfo(V)},
					link     = C_Garrison.GetFollowerAbilityLink(V)
				};
				abilityNames[d.name] = {d.name,d.isTrait};
				tinsert(v.abilities,d);
			end
			tinsert(v.desc,{"abilities",v.abilities});
		end
		followers[v.followerID] = v;
	end

	if (FollowerLocationInfoDB.ListOpen) then
		FollowerLocationInfo_ToggleList(true);
	end
	List_Update();
end

local function MenuEntry_AddWaypoint(menu,zone,x,y,title)
	if (TomTom) then
		tinsert(menu,{
			label = L["Add waypoint to Tom Tom"],
			func = function()
				TomTom:AddMFWaypoint(zone,0,x/100,y/100,{title=title});
			end
		});
	end
end

--[=[ menus ]=]
local function createMenu(parent,menuElements,anchorA,anchorB)
	PlaySound("igMainMenuOptionCheckBoxOn");
	ns.MenuGenerator.InitializeMenu();
	ns.MenuGenerator.addEntry(menuElements);
	ns.MenuGenerator.ShowMenu(parent, anchorA, anchorB);
end


--[=[[ Configurations ]=]
function configMenu(self,anchorA,anchorB)
	createMenu(self,{
		--{ label = SETTINGS, title = true },
		--{ separator = true },
		{ label = "DataBroker", title=true }, --childs = {
			{
				label = L["Show minimap button"], tooltip = {L["Minimap"],L["Show/Hide minimap button"]},
				checked = function() return FollowerLocationInfoDB.Minimap.enabled; end,
				--func  = function() FollowerLocationInfoDB.Minimap.enabled = not FollowerLocationInfoDB.Minimap.enabled; if (not FollowerLocationInfoDB.Minimap.enabled) then lDBI:Hide(addon); else lDBI:Show(addon); end end
				func = function() FollowerLocationInfo_MinimapButton(); end
			},
			{
				label = L["Show coordinations on broker"], --tooltip={L[""],L[""]},
				dbType="bool", keyName="BrokerTitle_Coords",
				disabled = true
			},
			{
				label = L["Show follower count on broker"], --tooltip={L[""],L[""]},
				dbType="bool", keyName="BrokerTitle_NumFollowers",
				disabled = true
			},
		--}},
		{ separator = true },
		{ label = "Follower list", title=true }, --childs = {
			{
				label = L["Show FollowerID"], tooltip={L["Follower ID"],L["Show/Hide followerID's in follower list"]},
				dbType="bool", keyName="ShowFollowerID",
				event = function() List_Update(); end
			},
			{
				label = L["Show collected followers"], tooltip = {L["Collected followers"],L["Show/Hide collected and not collectable followers in follower list"]},
				dbType="bool", keyName="ShowCollectedFollower",
				event = function() List_Update(); end,
			},
			{
				label = L["Show hidden followers"], tooltip = {L["Hidden followers"],L["Show/Hide hidden followers in follower list"]},
				dbType="bool", keyName="ShowHiddenFollowers",
				event = function() List_Update(); end,
			},
		--}},
		{ separator = true },
		{ label = "Misc.", title=true },--childs = {
			{
				label = L["Show coordination frame"], --tooltip = {L[""],L[""]},
				dbType="bool", keyName="ShowCoordsFrame",
				--event  = function() end,
				disabled = true
			},
			--[[
			{
				--name = "questIdUrl",
				label = L["Fav. website"],
				tooltip = {L["Fav. website"],L["Choose your favorite website for further informations to a quest."]},
				dbType="select", keyName="questIdUrl
				default = "WoWHead",
				values = {
					WoWHead = "WoWHead",
					WoWDB = "WoWDB (english only)",
					Buffed = "Buffed"
				}
			}
			]]
		--}}
	},anchorA,anchorB);
end


--[=[ FLI.Desc ]=]
local DescSelected = false;

local function Desc_TooltipEnter(self)
	print("?");
end

local function Desc_TooltipLeave(self)
end

local function Desc_AddInfo(self, count, objType, ...)
	local p,objs,_ = self.Child,{...};
	local obj = objs[1];

	local addLine = function(title, text, img, menu, tooltip)
		local l = nil

		count = count + 1;

		if (not self.lines[count]) then
			self.lines[count] = CreateFrame("Frame",nil --[[addon.."DescLine"..count]],p,"FollowerLocationInfoDescLineTemplate");
			l = self.lines[count];
		else
			l = self.lines[count];
		end

		l.title:SetText((strlen(title)>0) and title..":" or "");

		if (img) then
			l.img:SetTexture("Interface\\addons\\"..addon.."\\followers\\"..self.info.followerID.."\\image"..img)
			l:SetHeight(l.img:GetHeight()+6);
			l.img:Show();
		else
			l.text:SetText(text);
			l:SetHeight(l.text:GetHeight()+6);
			l.text:Show();
		end

		if (menu) and (type(menu)=="table") and (#menu>0) then
			l.Options:SetScript("OnClick",function(self) createMenu(self,menu,"TOPRIGHT","BOTTOMRIGHT") end);
			l.Options:Show();
		else
			l.Options:Hide();
		end

		--[[
		if (tooltip) then
			l.tooltip = tooltip;
		end
		]]

		l:SetParent(p);
		l:SetPoint("TOP", (count==1) and p or self.lines[count-1], (count==1) and "TOP" or "BOTTOM", 0, (count==1) and -12 or -6);
		l:SetPoint("LEFT",self,0,0);
		l:SetPoint("RIGHT",self,0,0);
		l:Show();
	end

	if (objType=="pos") then
		local title = L["Location"];
		for i,v in ipairs(objs) do
			local location,menu=nil,{};
			if (type(v[1])=="number") then
				location = GetMapNameByID(v[1]);
			end
			if (type(v[2])=="number") and (type(v[3])=="number") then
				location = ("%s%1.1f, %1.1f"):format((location) and location.." @ " or "",v[2],v[3]);
				MenuEntry_AddWaypoint(menu,v[1],v[2],v[3],((v[4]) and v[4] or self.info.name).."|n("..location..")");
			end
			if (location) and (type(v[4])=="string") then
				addLine(title, ("%s|n(%s)"):format(v[4],location),nil,menu);
			else
				addLine(title, location, nil, menu);
			end
			title = "";
		end
	elseif (objType=="quest") or (objType=="questrow") or (objType=="event") then
		local title, qState, qTitle, qTitle2, qText, qGiver, qZone, qCoord, str, qGiverData;
		if objType=="quest" then
			title = L["Quests"];
		elseif objType=="questrow" then
			title = L["Quest row"];
		elseif objType=="event" then
			title = L["Event"];
		end
		for i,v in ipairs(objs) do
			local menu = {};
			qState, qGiver, qZone, qCoord, str = 0, "", "zone?", "?.?, ?.?", "%s|n  » %s(%s @ %s)" --"%s|n    %s|n    (%s @ %s)"
			qTitle, qText = GetQuestInfo(v[1]);
			qTitle2 = qTitle;
			if (qTitle) then
				local qIndex = GetQuestLogIndexByID(v[1]);
				if (qIndex~=0) then
					qTitle2 = qTitle .. " |cffeeee00"..L["(In questlog)"].."|r";
					tinsert(menu,{ label = TRACK_QUEST, func=function() QuestMapQuestOptions_TrackQuest(v[1]); end });
					tinsert(menu,{ label = L["Open questlog"], func=function() securecall("QuestMapFrame_OpenToQuestDetails", v[1]); end });
					tinsert(menu,{ label = L["Share quest"], func=function() QuestLogPushQuest(qIndex) end, disabled=(not (GetQuestLogPushable(qIndex) and IsInGroup())) });
				elseif (IsQuestCompleted(v[1])) then
					qTitle2 = qTitle .. " |cff888888"..L["(Completed)"].."|r"
				end
				tinsert(menu,{ label = L["On WoWHead"], func=function()
					ExternalURL = urls[FollowerLocationInfoDB.ExternalURL]("q",v[1]);
					StaticPopup_Show("FLI_URL_DIALOG");
				end });

				if ((type(v[2])=="number") and (v[2]>0) and (ns.npcs[v[2]])) or ((type(v[2])=="string") and (v[2]:find("^o[0-9]+$")) and (ns.npcs[v[2]])) then
					qGiver = ns.npcs[v[2]];
				end

				if (type(v[3])=="number") and (v[3]~=0) then
					qZone = GetMapNameByID(v[3]);
				end

				if (type(v[4])=="number") and (type(v[5])=="number") then
					qCoord = ("%1.1f, %1.1f"):format(v[4],v[5]);
					local title = qTitle .. ( (qGiver~="") and ("|n%s: %s"):format(L["Quest giver"],qGiver) or "" ) .. ("|n(%s @ %s)"):format(qZone,qCoord);
					MenuEntry_AddWaypoint(menu,v[3],v[4],v[5],title);
				elseif (type(v[4])=="string") then
					qCoord = L[v[4]];
				end

				addLine(title, str:format(qTitle2, qGiver.."|n   ", qZone, qCoord),nil,menu);
			elseif v[1]==0 then
				addLine(title, L["Missing quest..."]);
			elseif (qTitle==false) then
				addLine(title, L["Error: quest name not found..."]);
			else
				addLine(title, L["Waiting for quest data..."]); -- from realm... (questid "..v[1]..")");
				doRefresh = true;
			end
			title = "";
		end
	elseif (objType=="desc") then
		local desc = false;
		local lang = GetLocale();

		if (obj[lang]) then
			desc = obj[lang];
		end

		if (not desc) and ((lang=="esES") or (lang=="esMX")) then
			desc = ( (obj.esES) and obj.esES ) or ( (obj.esMX) and obj.esMX ) or false;
		end
		if (not desc) and ((lang=="zhCN") or (lang=="zhTW")) then
			desc = ( (obj.zhCN) and obj.zhCN ) or ( (obj.zhTW) and obj.zhTW ) or false;
		end
		if (not desc) and ((lang=="enUS") or (lang=="enGB")) then
			desc = ( (obj.enUS) and obj.enUS ) or ( (obj.enGB) and obj.enGB ) or false;
		end
		if (not desc) and (obj.enUS) then -- fallback if possible?
			desc = obj.enUS;
		end

		if (desc) then
			if (type(desc)=="table") then
				desc = table.concat(desc,"|n");
			end
			addLine(L["Description"], desc:format(self.info.name));
		end
	elseif (objType=="img") then
		for i,v in ipairs(objs) do
			addLine(L["Image"] .. ((#objs>1) and " "..i or ""), nil, v);
		end
	elseif (objType=="vendor") then
		local title = L["Vendor"];
		local menu = {};
		for i,v in ipairs(objs) do
			local location, npc;
			if (type(v[1])=="number") and (ns.npcs[v[1]]~=nil) then
				npc = ns.npcs[v[1]];
			end
			if (type(v[2])=="number") then 
				location = GetMapNameByID(v[2])
			end
			if (type(v[3])=="number") and (type(v[4])=="number") then
				location = ("(%s%1.1f, %1.1f)"):format((location) and location.." @ " or "",v[3],v[4]); -- merge zone name with coordinations
				MenuEntry_AddWaypoint(menu,v[2],v[3],v[4],((npc) and npc or L["Vendor for "]..self.info.name).. "|n"..location );
			elseif (type(v[3])) then
				location = ("(%s @ %s)"):format(location,L[v[3]]); -- merge zone name with named location like buildings in garrison...
			end

			if (npc) and (location) then
				addLine(title,("%s|n    %s"):format(npc,location), nil, menu,{title,npc,location});
			elseif (npc) then
				addLine(title,npc,nil,nil,{title,npc});
			elseif (location) then
				addLine(title,location, nil, menu,{title,location});
			end
			title = "";
		end
	elseif (objType=="mission") then
		local title = L["Mission"];
		for i,v in ipairs(objs) do
			if (type(v)=="number") then
				addLine(title, C_Garrison.GetMissionName(v).."  |cff888888(MissionID: "..v..")|r");
			end
		end
	elseif (objType=="payment") then
		local str = "";
		for i,v in ipairs(objs) do
			if (strlen(str)>0) then str = str .. "|n"; end
			if v[1] == "gold" then
				str = str .. GetCoinTextureString(v[2]);
			elseif (GetCurrencyInfo(obj[1])) then
				local name,_,icon = GetCurrencyInfo(obj[1]);
				str = ("%s%s  |T%s:0|t (%s)"):format(str,obj[2],icon,name);
			else
				str = str .. obj[2] .. " ?";
			end
		end
		addLine(L["Payment"], str);
	elseif (objType=="reputation") then
		addLine(L["Reputation"], _G["FACTION_STANDING_LABEL"..obj[2]].." @ "..(ns.factions[obj[1]] or "(Oops, faction not found...)"));
	elseif (objType=="type") then
		addLine(L["Type"],L[obj]);
	elseif (objType=="requirements") then
		local req = {};
		for i,v in ipairs(objs) do
			tinsert(req,L[v]);
		end
		addLine(L["Requirements"], table.concat(req,"|n"));
	elseif (objType=="achievement") then
		local str = "";
		local IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, IsGuild, WasEarnedByMe, EarnedBy = GetAchievementInfo(obj);
		local Char=UnitName("player");
		if (IDNumber) then
			local lnk = GetAchievementLink(obj);
			str = lnk;
		else
			str = L["Can't get achievement data. %d isn't an achievement id?"]:format(obj);
		end
		addLine("Achievement", str, nil, {});
	elseif (objType=="abilities") then
		local text = {};
		for i,v in pairs(obj) do
			if (#v.counters>0) then
				tinsert(text,("|T%s:0|t %s (|T%s:0|t %s)"):format(v.icon,v.name,v.counters[3],v.counters[2]));
			else
				tinsert(text,("|T%s:0|t %s"):format(v.icon,v.name));
			end
		end
		if (#text>0) then
			addLine(L["Basic abilities"],table.concat(text,"|n"));
		end
	elseif (objType=="custom") then
		addLine(L[obj[1]], L[obj[2]]);
	end

	return count;
end

local function Desc_Update()
	local self = FollowerLocationInfoFrame.Desc;
	local DescHead = FollowerLocationInfoFrame.DescHeader;
	local InfoHead = FollowerLocationInfoFrame.InfoHeader;
	local Model = FollowerLocationInfoFrame.Model;
	local BigModel = FollowerLocationInfoFrame.BigModelViewer.Model;
	local line,count = nil,0;

	if (not self.lines) then
		self.lines = {};
	end

	-- cleanup
	for index=1, #self.lines do
		line = self.lines[index];
		line:SetParent(UIParent);
		line:SetHeight(0);
		line:ClearAllPoints();
		line:Hide();
		line.text:Hide();
		line.img:Hide();
		line.tooltip=nil;
	end

	Model:Hide();
	--FollowerLocationInfoDescLineTemplate
	if (DescSelected) then
		self.info = DescSelected;

		-- add all elements
		if (type(self.info.desc)=="table") then
			for i=1, #self.info.desc do
				count = Desc_AddInfo(self,count,unpack(self.info.desc[i]));
			end
		else
			-- custom message?
		end

		if (doRefresh) then
			doRefresh=false;
			C_Timer.After(0.7, function()
				Desc_Update();
			end);
		end

		-- 3d Models
		local pos = {2,0,-0.62};
		if (self.info.race) and (modelPositions[self.info.race]) then
			pos = modelPositions[self.info.race];
		elseif (self.info.modelPosition) then
			pos = self.info.modelPosition;
		end
		BigModel:SetDisplayInfo(self.info.displayID);
		Model:SetDisplayInfo(self.info.displayID);
		Model:SetPosition(unpack(pos));

		if (not self.info.quality) then
			self.info.quality=2;
		end
		-- DescHead data
		DescHead.Name:SetText("|c" .. self.info.classColor .. self.info.name .. "|r");
		DescHead.Class:SetText("|cffffffff" .. self.info.className .. "|r");
		DescHead.Misc:SetText(("%s: %d, %s: %s%s|r"):format(
			LEVEL,		self.info.level,
			QUALITY,	qualities[self.info.quality].color.hex, qualities[self.info.quality].text
		));

		Model:Show();
		DescHead:Show();
		InfoHead:Hide();
	else
		local count = 0;
		local descs={
			{"Usage","Select a follower to see the description..."},
			--{"Greetings","Welcome to use this addon.|nCurrently it is still incomplete."},
			{"Followers",
				#C_Garrison.GetFollowers()..L[" listed in game (depends on your faction)"] .. "|n" ..
				numHidden..L[" hidden followers (Inn recruitement?)"] .. "|n" ..
				numKnownFollowers..L[" followers with description"]  .. "|n" ..
				numCollectedFollowers..L[" collected with this character"]
			},
			{"Version",GetAddOnMetadata(addon,"Version")},
			{"Msg from Dev","|cff44eeffGreetings friends...|n|nNow TomTom support works. :)|n|nHave a nice day|r"}
		};

		if (DisabledByBlizzardBug) then
			tinsert(descs,1,{"Disabled",L["Follower listing disabled because a blizzard bug prevents loading the correct faction followers."]});
		elseif (DisabledByLevel) then
			tinsert(descs,1,{"|cffff0000Disabled|r",L["|cffffaa00Follower listing disabled. You must be level 90 or higher. The follower list will be automaticly enabled on level 90.|r"]});
		end

		for i,v in ipairs(descs) do
			count = Desc_AddInfo(self, count, "custom", v);
		end
		DescHead:Hide();
		InfoHead:Show();
	end
end

local function Desc_OnScroll(self, xrange, yrange)
	if ( not yrange ) then
		yrange = self:GetVerticalScrollRange();
	end
	local value = self.Bar:GetValue();
	if ( value > yrange ) then
		value = yrange;
	end
	self.Bar:SetMinMaxValues(0, yrange);
	self.Bar:SetValue(value);
	if ( floor(yrange) == 0 ) then
		if ( self.scrollBarHideable ) then
			self.Bar:Hide();
			self.Bar.Thumb:Hide();
		else
			if ( not self.noScrollThumb ) then
				self.Bar.Thumb:Show();
			end
		end
	else
		self.Bar:Show();
		if ( not self.noScrollThumb ) then
			self.Bar.Thumb:Show();
		end
	end
end

local function Desc_OnVScroll(self,offset)
	self.Bar:SetValue(offset);
end

local function Desc_OnMouseWheel(self,value)
	local scrollStep = self.Bar:GetHeight() / 10
	if ( value > 0 ) then
		self.Bar:SetValue(self.Bar:GetValue() - scrollStep);
	else
		self.Bar:SetValue(self.Bar:GetValue() + scrollStep);
	end
end


--[=[ FLI.List ]=]
local function List_Search(self,bool)
	SearchBoxTemplate_OnTextChanged(self);
	SearchStr = (bool) and tostring(self:GetText()) or "";
	List_Update();
end

local function List_ClassFilterClear(self)
	self:GetParent().Text:SetText(ClassFilterLabel);
	ClassFilter = "";
	List_Update();
	self:Hide();
end

local function List_AbilityFilterClear(self)
	self:GetParent().Text:SetText(AbilityFilterLabel);
	AbilityFilter = "";
	List_Update();
	self:Hide();
end

local function List_ClassFilter(self)
	local menu = {
		{ label = "Choose", title = true },
		{ separator = true },
		{ label = "Classes", childs={}},
		{ label = "Class speccs", childs={}},
	};

	for i,v in pairsByKeys(classNames2) do
		tinsert(menu[3].childs, {
			label = v[1],
			colorCode="|c"..classes[v[2]:upper()].colorStr,
			func=function()
				ClassFilter = i;
				local f = FollowerLocationInfoFrame.ClassFilter; f.Text:SetText(v[1]);
				f.Remove:Show();
				List_Update();
			end
		});
	end

	for i,v in pairsByKeys(classNames1) do
		tinsert(menu[4].childs,{
			label = v[1],
			colorCode="|c"..classes[v[2]:upper()].colorStr,
			func=function()
				ClassFilter = v[1]:lower();
				local f = FollowerLocationInfoFrame.ClassFilter;
				f.Text:SetText(v[1]);
				f.Remove:Show();
				List_Update();
			end
		});
	end

	createMenu(self,menu,"TOPLEFT","TOPRIGHT");
end

local function List_AbilityFilter(self)
	local Abs,Traits = {},{};

	local entries,cMax,page = {},20,1;
	for i,v in pairsByKeys(abilityNames) do
		if (v[2]) then
			tinsert(Traits,{
				label = v[1],
				func = function()
					AbilityFilter = v[1];
					local f = FollowerLocationInfoFrame.AbilityFilter;
					f.Text:SetText(v[1]);
					f.Remove:Show();
					List_Update();
				end
			});
		else
			if (Abs[page]==nil) then Abs[page]={}; end
			tinsert(Abs[page],{
				label = v[1],
				func = function()
					AbilityFilter = v[1];
					local f = FollowerLocationInfoFrame.AbilityFilter;
					f.Text:SetText(v[1]);
					f.Remove:Show();
					List_Update();
				end
			});
			if (#Abs[page]==cMax) then
				page = page+1;
			end
		end
	end
	
	if (#Traits>0) or (#Abs>0) then
		local menu = {
			{ label = "Choose", title = true },
			{ separator = true },
			
		};
		if (#Traits>0) then
			tinsert(menu,{ label = "Traits", childs=Traits });
		end
		if (#Abs>0) then
			for i,v in ipairs(Abs) do
				tinsert(menu,{ label = L["Abilities (page %d)"]:format(i), childs=v });
			end
		end

		createMenu(self,menu,"TOPLEFT","TOPRIGHT");
	end
end

local function ListEntries_Update()
	local zones2follower,tmp,collected,ignore,_ = {},{};
	wipe(ListEntries);

	for id,v in pairsByKeys(followers) do -- filter here!!
		ignore = false;

		-- filter 1: ShowHiddenFollowers option
		if (not FollowerLocationInfoDB.ShowHiddenFollowers) and (v.hidden) then
			ignore = true;
		end

		-- filter 2: ShowCollectedFollower option
		if (not FollowerLocationInfoDB.ShowCollectedFollower) then
			if (v.collected==true) then
				ignore = true;
			elseif (v.collectGroup) and (collectGroups[v.collectGroup]) then
				ignore = true;
			end
		end

		-- filter 3: Select class filter
		if (ClassFilter~="") and not ((v.className:lower()==ClassFilter) or (v.class==ClassFilter)) then
			ignore=true;
		end

		-- filter 4: Select traint filter
		if (AbilityFilter~="") then
			local dontIgnore=false;
			for I,V in ipairs(v.abilities) do
				if (V.name==AbilityFilter) then
					dontIgnore=true;
				end
			end
			if (not dontIgnore) then
				ignore = true;
			end
		end

		-- filter 5: Searchbox filter
		if (SearchStr~="") and (not v.name:lower():find(SearchStr:lower())) then
			ignore=true;
		end

		-- now add all if not set as ignore...
		if (ignore~=true) then
			tmp[id]=v;
			if (v.zone) and (v.zone~=0) then
				if (zones2follower[v.zone]==nil) then
					zones2follower[v.zone]={};
				end
				tinsert(zones2follower[v.zone],id);
			else
				if (zones2follower[0]==nil) then
					zones2follower[0]={};
				end
				tinsert(zones2follower[0],id);
			end
		end
	end

	for i1,v1 in ipairs(factionZoneOrder) do
		if (zones2follower[v1]) then
			-- header element
			tinsert(ListEntries,{ZoneName=zoneNames[v1]});
			--
			for i2,v2 in ipairs(zones2follower[v1]) do
				tinsert(ListEntries,tmp[v2]);
			end
		end
	end
end

local function ListEntries_OnClick(self,button)
	if (ListEntrySelected==false) or (ListEntrySelected~=self.info.followerID) then
		ListEntrySelected = self.info.followerID;
		DescSelected = self.info;
	else
		ListEntrySelected = false;
		DescSelected = false;
	end

	List_Update();
	Desc_Update();
end

local function ListEntry_Setup(self,isHeader)
	if (isHeader) and (not self.IsHeader) then
		self.IsHeader = true;
		self.Portrait:Hide();
		self.Name:Hide();
		self.Level:Hide();
		self.ZoneName:Show();
		self.highlightTex:Hide();
		self.headerBG:Show();
	elseif (not isHeader) and (self.IsHeader) then
		self.IsHeader = false;
		self.headerBG:Hide();
		self.Portrait:Show();
		self.Name:Show();
		self.Level:Show();
		self.ZoneName:Hide();
		self.highlightTex:Show();
	end
	self.collected:Hide();
	self.notCollectable:Hide();
	self.quality2:Hide();
	self.quality3:Hide();
	self.quality4:Hide();
	self.selectedTex:Hide();
	self.followerID:Hide();
	self.tooltip=nil;
	self:SetScript("OnClick",nil);
	self:Disable();
end

function List_Update()
	if (not FollowerLocationInfoFrame:IsShown()) then return; end
	ListEntries_Update();
	local scroll = FollowerLocationInfoFrame.List;
	local button, index, obj;
	local offset = HybridScrollFrame_GetOffset(scroll);
	local nButtons = #scroll.buttons;
	local nEntries = #ListEntries;

	for i=1, nButtons do
		button = scroll.buttons[i];
		index = offset + i;

		if (index<=nEntries) then
			obj = ListEntries[index];

			ListEntry_Setup(button,(obj.ZoneName~=nil));
			if (obj.ZoneName) then
				button.ZoneName:SetText(obj.ZoneName);
				--button.tooltip = obj.ZoneName;
				button.tooltip = {obj.ZoneName,L["Click to expand/collapse"]};
				--[=[ TODO: add +/- button ]=]
			else
				button.info = obj;

				GarrisonFollowerPortrait_Set(button.Portrait,obj.portraitIconID);

				button.Name:SetText(("|c%s%s|r"):format(obj.classColor,obj.name));
				button.Level:SetText(obj.level);
				button.tooltip={("%s (%d)"):format(obj.name,obj.level)};

				if (obj.quality) then
					tinsert(button.tooltip,("%s: %s%s|r"):format(QUALITY,qualities[obj.quality].color.hex,qualities[obj.quality].text));
					if (button["quality"..obj.quality]) then
						button["quality"..obj.quality]:Show();
					end
				end

				if (obj.collected) then
					button.collected:Show();
					if (obj.collectGroup) then
						tinsert(button.tooltip,"|cff44ff44"..L["This follower is member of a collect group and already collected."].."|r");
					end
				end
				if (obj.collectGroup) then
					if (not obj.collected) then
						if (collectGroups[obj.collectGroup]==true) then
							button.notCollectable:Show();
							tinsert(button.tooltip,"|cffff4444"..L["This follower is member of a collect group and is no longer collectable."].."|r");
						else
							tinsert(button.tooltip,L["This follower is member of a collect group and is collectable."]);
						end
					end
					local members,t,d,c = {strsplit(".",obj.collectGroup)},{};
					for i,v in ipairs(members) do
						v=tonumber(v);
						if (v~=obj.followerID) then
							d = followers[v];
							if (d) then
								tinsert(t,((d.collected) and "|cff44ff44" or "|cffff4444") .. d.name .. "|r");
							end
						end
					end
					tinsert(button.tooltip,L["In group with:"] .. " " .. table.concat(t,", "));
				end

				if (FollowerLocationInfoDB.ShowFollowerID) then
					button.followerID:SetText("ID: "..obj.followerID);
					button.followerID:Show();
					tinsert(button.tooltip,"|cffbbbbbb"..L["FollowerID"]..": "..obj.followerID.."|r");
				end

				button:SetScript("OnClick",ListEntries_OnClick);
				if (ListEntrySelected) and (ListEntrySelected==obj.followerID) then
					button.selectedTex:Show();
				end
				button:Enable();
			end

			if (obj.tooltip) then
				button.tooltip=obj.tooltip;
			end

			button:Show();
		else
			button:Hide();
		end
	end

	local height = scroll.ButtonHeight + ListButtonOffsetY;
	HybridScrollFrame_Update(scroll, nEntries * height, nButtons * height);
end


--[=[ public functions ]=]
function FollowerLocationInfo_Toggle()
	if (FollowerLocationInfoFrame:IsShown()) then
		FollowerLocationInfoFrame:Hide();
	else
		FollowerLocationInfoFrame:Show();
	end
end

function FollowerLocationInfo_ToggleCollected()
	FollowerLocationInfoDB.ShowCollectedFollower = not FollowerLocationInfoDB.ShowCollectedFollower;
	List_Update();
end

function FollowerLocationInfo_ToggleIDs()
	FollowerLocationInfoDB.ShowFollowerID = not FollowerLocationInfoDB.ShowFollowerID;
	List_Update();
end

function FollowerLocationInfo_ResetConfig()
	wipe(FollowerLocationInfoDB);
	ReloadUI();
end

function FollowerLocationInfo_MinimapButton()
	if (lDBI:IsRegistered(addon)) then
		if (FollowerLocationInfoDB.Minimap.enabled) then
			lDBI:Hide(addon);
			FollowerLocationInfoDB.Minimap.enabled = false;
		else
			lDBI:Show(addon);
			FollowerLocationInfoDB.Minimap.enabled = true;
		end
	else
		FollowerLocationInfoDB.Minimap.enabled = true;
		minimapInit();
	end
end

function FollowerLocationInfo_PrintMissingData()
	local tmp;
	for i,v in pairs(IsMissing) do
		if (type(v)=="table") and (#v>0) then
			table.sort(v);
			print("|cffff4444FLI|r","|cffffff00"..i.."?|r", "|cff44aaff"..table.concat(v,"|r, |cff44aaff").."|r");
		end
	end
end

function FollowerLocationInfo_ToggleList(force)
	if (force==nil) and (DisabledByLevel) or (DisabledByBlizzardBug) then return; end
	local self = FollowerLocationInfoFrame;
	local n, h = self.ListToggle:GetNormalTexture(),self.ListToggle:GetHighlightTexture();
	if (force==false) or (self.List:IsShown()) then
		self.List:Hide();
		self.ListBG:Hide();
		self.ListOptionBG:Hide()
		self.Search:Hide();
		self.ClassFilter:Hide();
		self.AbilityFilter:Hide();
		n:SetTexture(gsub(n:GetTexture(),"Next","Prev"));
		h:SetTexture(gsub(h:GetTexture(),"Next","Prev"));
		if (force==nil) then
			FollowerLocationInfoDB.ListOpen=false;
		end
	elseif (force==true) or (not self.List:IsShown()) then
		self.List:Show();
		self.ListBG:Show();
		self.ListOptionBG:Show()
		self.Search:Show();
		self.ClassFilter:Show();
		self.AbilityFilter:Show();
		n:SetTexture(gsub(n:GetTexture(),"Prev","Next"));
		h:SetTexture(gsub(h:GetTexture(),"Prev","Next"));
		if (force==nil) then
			FollowerLocationInfoDB.ListOpen=true;
		end
		List_Update();
	end
end


--[=[ FollowerLocationInfoFrame ]=]
local function FollowerLocaitonInfoFrame_OnUpdate(self,elapsed)
	if (not GetFollowersOnUpdate) then
		return;
	end

	if (self.elapse == nil) then
		self.elapse = 0;
	end

	if (self.elapse>10) then
		self.elapse = 0;
		GetFollowersOnUpdateCount=GetFollowersOnUpdateCount+1;
		GetFollowers();
	else
		self.elapse=self.elapse+elapsed;
	end
end

local function FollowerLocationInfoFrame_OnEvent(self, event, arg1, ...)
	if (event=="ADDON_LOADED") and (arg1==addon) then
		if (FollowerLocationInfoDB==nil) then
			FollowerLocationInfoDB={Minimap={enabled=true}};
		end
		for i,v in pairs({
			Minimap = {enabled=true},
			ShowFollowerID = true,
			ShowCoordsFrame = true,
			BrokerTitle_Coords = false,
			BrokerTitle_NumFollowers = true,
			ShowCollectedFollower = false,
			ShowHiddenFollowers = false,
			ExternalURL = "WoWHead",
			ListOpen = true
		}) do 
			if (FollowerLocationInfoDB[i]==nil) then
				FollowerLocationInfoDB[i] = v;
			end
		end
		for i,v in pairs(_G.RAID_CLASS_COLORS) do
			if (_G.CUSTOM_CLASS_COLORS) and (_G.CUSTOM_CLASS_COLORS[i]) and (_G.CUSTOM_CLASS_COLORS[i].colorStr) then
				classes[i] = _G.CUSTOM_CLASS_COLORS[i];
			else
				classes[i] = v;
			end
		end
	end
	if (event=="PLAYER_ENTERING_WORLD") then
		dataBrokerInit();
		if (FollowerLocationInfoDB.Minimap.enabled) then
			FollowerLocationInfo_MinimapButton();
		end
	end
	if (UnitLevel("player")>=90) then
		DisabledByLevel=false;
		if (event=="PLAYER_ENTERING_WORLD") --[[or (event=="levelup?")]]  then
			if (UnitLevel("player")>=90) and (not GarrisonLandingPage) then
				Garrison_LoadUI();
			end
		end
		if (event=="ADDON_LOADED" and arg1=="Blizzard_GarrisonUI") or (event=="GARRISON_FOLLOWER_LIST_UPDATE") or (event=="GARRISON_FOLLOWER_REMOVED") or (event=="GARRISON_FOLLOWER_XP_CHANGED") then
			GetFollowers(self);
		end
	else
		DisabledByLevel=true;
	end
end

local function FollowerLocationInfoFrame_OnShow(self)
	DescSelected=false;
	ListEntrySelected=false;
	List_Update();
	Desc_Update();
end

function FollowerLocationInfoFrame_OnLoad(self)
	-- FLI.List
	self.List.Bar:SetScale(0.7);
	self.List.Bar.trackBG:Hide();
	self.List.Bar.doNotHide=true;
	self.List.update = List_Update;
	HybridScrollFrame_CreateButtons(self.List, "FollowerLocationInfoListButtonTemplate",0,0,nil,nil,ListButtonOffsetX, -ListButtonOffsetY);
	if (select(4,GetBuildInfo())<60000) then
		self.List.buttons[2]:SetPoint("TOPLEFT",self.List.buttons[1],"BOTTOMLEFT",1, (-ListButtonOffsetY) - 1)
	end
	self.List.ButtonHeight = self.List.buttons[1]:GetHeight();

	-- FLI.Desc
	self.Desc.Bar:SetScale(0.7);
	self.Desc:SetScript("OnScrollRangeChanged",Desc_OnScroll)
	self.Desc:SetScript("OnVerticalScroll",Desc_OnVScroll)
	self.Desc:SetScript("OnMouseWheel",Desc_OnMouseWheel)

	-- FLI.ConfigButton
	self.ConfigButton:SetScript("OnClick",function(self) configMenu(self,"TOPRIGHT","BOTTOMRIGHT") end);

	-- FLI
	self:SetUserPlaced(true);
	self:SetFrameLevel(10);
	self:SetScript("OnUpdate", FollowerLocaitonInfoFrame_OnUpdate);
	self:SetScript("OnEvent", FollowerLocationInfoFrame_OnEvent);
	self:SetScript("OnShow", FollowerLocationInfoFrame_OnShow);
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("GARRISON_FOLLOWER_LIST_UPDATE");
	self:RegisterEvent("GARRISON_FOLLOWER_REMOVED");
	self:RegisterEvent("GARRISON_FOLLOWER_XP_CHANGED");

	-- FLI -- FilterElements
	self.Search:SetScript("OnTextChanged", List_Search);
	self.ClassFilter.Text:SetText(L[ClassFilterLabel]);
	self.ClassFilter.Title:SetText("Filter 1");
	self.ClassFilter.Button:SetScript("OnClick", List_ClassFilter);
	self.ClassFilter.Remove:SetScript("OnClick", List_ClassFilterClear);
	self.AbilityFilter.Text:SetText(L[AbilityFilterLabel]);
	self.AbilityFilter.Title:SetText("Filter 2");
	self.AbilityFilter.Button:SetScript("OnClick", List_AbilityFilter);
	self.AbilityFilter.Remove:SetScript("OnClick", List_AbilityFilterClear);

	-- FLI.ListBG / FLI.ListOptionBG
	self.ListBG:SetFrameLevel(self:GetFrameLevel()-2);
	self.ListOptionBG:SetFrameLevel(self:GetFrameLevel()-4);
	self.ListToggle.tooltip = L["Show/Hide follower list"];

	-- FLI.BigModelViewer
	self.BigModelViewer:SetFrameLevel(self:GetFrameLevel()-4);
	self.BigModelViewer.Border:SetFrameLevel(self:GetFrameLevel()-2);
	self.BigModelViewerToggle.tooltip = L["Show/Hide big 3d model viewer"];
end


--[=[ WorldMap - Hook ]=]
_G.WorldMapFrame:HookScript("OnShow",function(self)
	local f = FollowerLocationInfoFrame;
	if (not f:IsUserPlaced()) then
		f:ClearAllPoints();
		f:SetPoint("LEFT",self,"RIGHT",30,0);
	end
end);

_G.WorldMapFrame:HookScript("OnHide",function(self)
	local f = FollowerLocationInfoFrame;
	if (not f:IsUserPlaced()) then
		f:ClearAllPoints();
		f:SetPoint("LEFT",UIParent,"LEFT", 300,0);
	end
end);


--[=[ chat command ]=]
SlashCmdList["FOLLOWERLOCATIONINFO"] = function(cmd)
	local cmd, arg = strsplit(" ", cmd, 2)
	local _print = function(...) print("|cffff4444FLI|r", "|cff44aaff", ..., "|r"); end
	cmd = cmd:lower()
	if (cmd=="toggle") then
		FollowerLocationInfo_Toggle();
	elseif (cmd=="collected") then
		FollowerLocationInfo_ToggleCollected();
	elseif (cmd=="ids") then
		FollowerLocationInfo_ToggleIDs();
	elseif (cmd=="missing") then
		FollowerLocationInfo_PrintMissingData();
	elseif (cmd=="minimap") then
		FollowerLocationInfo_MinimapButton();
	elseif (cmd=="list") then
		FollowerLocationInfo_ToggleList();
	elseif (cmd=="reset") then
		FollowerLocationInfo_ResetConfig();
	else
		_print(L["Commandline options for %s"]:format(addon));
		_print(L["Usage: /fli <command>"]);
		_print("      "..L["or /followerlocationinfo <command>"]);
		_print(L["Commands:"]);
		_print("  toggle    = " .. L["Show/Hide frame"]);
		_print("  collected = " .. L["Show/Hide collected followers"]);
		_print("  ids       = " .. L["Show/Hide follower ids"]);
		_print("  list      = " .. L["Show/Hide follower list"]);
		_print("  minimap   = " .. L["Show/Hide minimap button"]);
		_print("  reset     = " .. L["Reset addon settings."]);
		_print("~ development commands ~");
		_print("  missing   = " .. L["Print missing data (follower and npc id's)"]);
	end
end

SLASH_FOLLOWERLOCATIONINFO1 = "/fli";
SLASH_FOLLOWERLOCATIONINFO2 = "/followerlocationinfo";

