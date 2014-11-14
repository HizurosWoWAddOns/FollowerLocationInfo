
local addon,ns = ...;
local L = ns.locale;
ns.faction, ns.factionLocale = UnitFactionGroup("player"); L[ns.faction] = ns.factionLocale;
ns.factionID = ((ns.faction=="Alliance") and 1) or ((ns.faction=="Horde") and 2) or 0;
ns.followers = {};
ns.followers_zones = {};
local followers = {};
local zoneNames = {};
local classes={};
local qualities = {nil,_G.UnitPopupButtons.ITEM_QUALITY2_DESC,_G.UnitPopupButtons.ITEM_QUALITY3_DESC,_G.UnitPopupButtons.ITEM_QUALITY4_DESC};
local doRefresh = false;
local factionZoneOrder = (ns.faction:lower()=="alliance") and {962,947,949,946,948,950,941,978,1009} or {962,941,949,946,948,950,947.978,1011};

for i,v in ipairs({941,946,947,948,949,950,962,978,1009,1011}) do zoneNames[v] = GetMapNameByID(v); end



--[=[ Broker & Minimap ]=]
local lDB = LibStub("LibDataBroker-1.1");
local lDBI = LibStub("LibDBIcon-1.0");
local function dataBrokerInit()
	if (lDB) then
		local obj = lDB:NewDataObject(addon, {
			type          = "data source",
			label         = addon,
			icon          = "Interface\\Icons\\Achievement_GarrisonFollower_Rare",
			text          = addon,
			--OnEnter       = function(self) end,
			--OnLeave       = function(self) end,
			OnClick       = function(self,button)
				if (FollowerLocationInfoFrame:IsShown()) then
					FollowerLocationInfoFrame:Hide();
				else
					FollowerLocationInfoFrame:Show();
				end
			end,
			--OnDoubleClick = function(self) end,
			--OnTooltipShow = function(self) end
		})

		if (lDBI) then
			lDBI:Register(addon, obj, FollowerLocationInfoDB.Minimap)
			if (not FollowerLocationInfoDB.Minimap.enabled) then
				libDBIcon:Hide(addon);
			end
		end
	end
end




--[=[ Misc ]=]
local function IsQuestCompleted(QuestID)
	if (not questsCompleted) or ((questsCompleted) and ((time() - questsCompleted.last)<300)) then
		questsCompleted = {ids=GetQuestsCompleted(), last=time()};
	end
	return (questsCompleted.ids[QuestID]==true);
end

ns.addFollower = function(id,neutral,data)
	local Data = data[(neutral) and "Neutral" or ns.faction];
	if (#Data>0) and (Data.zone~=0) and (not Data.ignore) then
		ns.followers[id] = Data;
		ns.followers_zones[id] = Data.zone;
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



--[=[ FLI.Desc ]=]
local DescSelected = false;

local function Desc_AddInfo(self, count, objType, ...)
	local p,objs,_ = self.Child,{...};
	local obj = objs[1];

	local addLine = function(title, text, img)
		local l = nil
		count = count + 1;

		if (not self.lines[count]) then
			self.lines[count] = CreateFrame("frame",nil,p,"FollowerLocationInfoDescLineTemplate");
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

		l:SetParent(p);
		l:SetPoint("TOP", (count==1) and p or self.lines[count-1], (count==1) and "TOP" or "BOTTOM", 0, (count==1) and -12 or -6);
		l:SetPoint("LEFT");
		l:SetPoint("RIGHT");
		l:Show();
	end

	if (objType=="pos") then
		local title = "Location";
		for i,v in ipairs(objs) do
			if (#v>1) then
				addLine(title, ("%s, %1.1f, %1.1f"):format(GetMapNameByID(v[1]), v[2], v[3]));
			else
				addLine(title, ("%s"):format(GetMapNameByID(v[1])));
			end
			title = "";
		end
	elseif (objType=="quest") or (objType=="questrow") or (objType=="event") then
		local title, qState, qTitle, qText, qGiver, qZone, qCoord, str, qGiverData;
		if objType=="quest" then
			title = L["Quests"];
		elseif objType=="questrow" then
			title = L["Quest row"];
		elseif objType=="event" then
			title = L["Event"];
		end
		for i,v in ipairs(objs) do
			qState, qGiver, qZone, qCoord, str = 0, "name?", "zone?", "?.?, ?.?", "%s|n    (%s @ %s)" --"%s|n    %s|n    (%s @ %s)"
			qTitle, qText = GetQuestInfo(v[1]);
			if (qTitle) then
				if (GetQuestLogIndexByID(v[1])~=0) then
					qTitle = qTitle .. " |cffeeee00"..L["(In questlog)"].."|r"
				elseif (IsQuestCompleted(v[1])) then
					qTitle = qTitle .. " |cff888888"..L["(Completed)"].."|r"
				end

				-- npc name v[2]
				if (v[2]) and (v[2]~=0) then
					--qGiver = "";
				end

				if (v[3]) and (v[3]~=0) then
					qZone = GetMapNameByID(v[3]);
				end

				if (v[4]) and (v[5]) then
					qCoord = ("%1.1f, %1.1f"):format(v[4],v[5]);
				end

				addLine(title, str:format(qTitle,--[[qGiver,]]qZone, qCoord))
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

		if (not desc) and ((lang=="zhCN") or (lang=="zhTW")) then
			-- ?
		end

		if (not desc) and (obj.enUS) then -- fallback if possible?
			desc = obj.enUS;
		end

		if (desc) then
			addLine(L["Description"], desc:format(self.info.name));
		end
	elseif (objType=="img") then
		for i,v in ipairs(objs) do
			addLine(L["Image"] .. ((#objs>1) and " "..i or ""), nil, v);
		end
	elseif (objType=="payment") then -- removed?
		local str = "";
		for i,v in ipairs(objs) do
			if (strlen(str)>0) then str = str .. "|n"; end
			if v[1] == "gold" then
				str = str .. GetCoinTextureString(v[2]);
			elseif (GetCurrencyLink(obj[1])) then
				str = str .. obj[2] .. " " .. GetCurrencyLink(obj[1]);
			else
				str = str .. obj[2] .. " ?";
			end
		end
		addLine(L["Payment"], str);
	elseif (objType=="type") then
		addLine(L["Type"],L[obj]);
	elseif (objType=="requirements") then
		local req = {};
		for i,v in ipairs(objs) do
			tinsert(req,L[v]);
		end
		addLine(L["Requirements"], table.concat(req,"|n"));
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
	end

	Model:Hide();
	--FollowerLocationInfoDescLineTemplate
	if (DescSelected) then
		self.info,self.data=DescSelected.info,DescSelected.data;

		-- add all elements
		for i=1, #self.data do
			count = Desc_AddInfo(self,count,unpack(self.data[i]));
		end

		if (doRefresh) then
			doRefresh=false;
			C_Timer.After(0.7, function()
				Desc_Update();
			end);
		end

		-- DescHead data
		local _,className = strsplit("-",self.info.classAtlas);
		local class = classes[className:upper()];
		Model:SetDisplayInfo(self.info.displayID);
		Model:SetPosition(unpack(self.data.ModelPosition or {2,0,-0.62}));
		DescHead.Name:SetText("|c" .. class.colorStr .. self.info.name .. "|r");
		DescHead.Class:SetText("|cffffffff" .. self.info.className .. "|r");
		DescHead.Misc:SetText(("%s: %d, %s: %s%s|r"):format(LEVEL,self.info.level,QUALITY,qualities[self.info.quality].color.hex,qualities[self.info.quality].text));

		Model:Show();
		DescHead:Show();
		InfoHead:Hide();
	else
		Desc_AddInfo(self,count,"custom",{"Welcome","Select a follower to see the description..."});
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
local ListButtonOffsetX, ListButtonOffsetY = 0,1;
local List_Update;
local ListEntrySelected = false;
local ListEntries = {};

local function ListEntries_Update(filter)
	local zones2follower = {[0]={}};
	for i,v in ipairs(C_Garrison.GetFollowers()) do
		if (v.garrFollowerID~=nil) then
			v.followerID,v.garrFollowerID = tonumber(v.garrFollowerID),v.followerID; -- blizzard's stupid order change...
		end
		local id = v.followerID;
		local data = ns.followers[id];
		followers[id]={info=v,data=data};

		-- filter here!!

		if (data) then
			if (zones2follower[ns.followers_zones[id]]==nil) then
				zones2follower[ns.followers_zones[id]]={};
			end
			tinsert(zones2follower[ns.followers_zones[id]],id);
		else
			tinsert(zones2follower[0],id);
		end
	end
	for i1,v1 in ipairs(factionZoneOrder) do
		if (zones2follower[v1]) and (#zones2follower[v1]>0) then
			-- header element
			tinsert(ListEntries,{ZoneName=zoneNames[v1]});
			--
			for i2,v2 in ipairs(zones2follower[v1]) do
				tinsert(ListEntries,followers[v2]);
			end
		end
	end

	-- header element
	tinsert(ListEntries,{ZoneName=L["No description found for..."]});
	--
	for i2,v2 in ipairs(zones2follower[0]) do
		tinsert(ListEntries,followers[v2]);
	end
end

local function ListEntries_OnClick(self,button)
	if (ListEntrySelected==false) or (ListEntrySelected~=self.info.followerID) then
		ListEntrySelected = self.info.followerID;
		DescSelected = {info=self.info,data=self.data};
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
	elseif (not isHeader) and (self.IsHeader) then
		self.IsHeader = false;
		self.Portrait:Show();
		self.Name:Show();
		self.Level:Show();
		self.ZoneName:Hide();
		self.highlightTex:Show();
	end
	self.owned:Hide();
	self.quality2:Hide();
	self.quality3:Hide();
	self.quality4:Hide();
	self.selectedTex:Hide();
	self.followerID:Hide();
	self:SetScript("OnClick",nil);
	self:Disable();
end

function List_Update()
	if (#ListEntries==0) then
		ListEntries_Update();
	end
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
			else
				local _,className = strsplit("-",obj.info.classAtlas);
				local class = classes[className:upper()];
				GarrisonFollowerPortrait_Set(button.Portrait,obj.info.portraitIconID);
				button.Name:SetText(("|c%s%s|r"):format(class.colorStr,obj.info.name));
				button.Level:SetText(obj.info.level);
				if (obj.info.quality) and (button["quality"..obj.info.quality]) then
					button["quality"..obj.info.quality]:Show();
				end
				if (obj.info.garrFollowerID) then
					button.owned:Show();
				end
				button.info = obj.info;
				if (obj.data) then
					button.data = obj.data;
					button:Enable();
					button:SetScript("OnClick",ListEntries_OnClick);

					if (ListEntrySelected) and (ListEntrySelected==obj.info.followerID) then
						button.selectedTex:Show();
					end
				end
				if (FollowerLocationInfoDB.ShowFollowerID) then
					button.followerID:SetText("ID: "..obj.info.followerID);
					button.followerID:Show();
				end
			end

			button:Show();
		else
			button:Hide();
		end
	end

	local height = scroll.ButtonHeight + ListButtonOffsetY;
	HybridScrollFrame_Update(scroll, nEntries * height, nButtons * height);
end


--[=[ FollowerLocationInfoFrame ]=]
local function FollowerLocationInfoFrame_OnEvent(self, event, arg1, ...)
	if (event=="ADDON_LOADED") and (arg1==addon) then
		if (FollowerLocationInfoDB==nil) then
			FollowerLocationInfoDB={Minimap={enabled=true}};
		end
		if (FollowerLocationInfoDB.Minimap==nil) then
			FollowerLocationInfoDB.Minimap={enabled=true};
		end
		if (FollowerLocationInfoDB.ShowFollowerID==nil) then
			FollowerLocationInfoDB.ShowFollowerID=true;
		end
		self.List.showFollowerID:SetChecked(FollowerLocationInfoDB.ShowFollowerID);
		dataBrokerInit();
		classes = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS;
	elseif (event=="PLAYER_ENTERING_WORLD") then
	end
end
local function FollowerLocationInfoFrame_OnShow(self)
	DescSelected=false;
	ListEntrySelected=false;
	List_Update();
	Desc_Update();
end
--local function FollowerLocationInfoFrame_OnUpdate(self) end
--local function FollowerLocationInfoFrame_OnHide(self) end

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
	self.List.showFollowerID.Text:SetText(L["Show FollowerID"]);
	self.List.showFollowerID:SetScript("OnClick",function(self)
		if ( self:GetChecked() ) then
			PlaySound("igMainMenuOptionCheckBoxOn");
		else
			PlaySound("igMainMenuOptionCheckBoxOff");
		end
		FollowerLocationInfoDB.ShowFollowerID = (self:GetChecked());
		self:GetParent().update();
	end);

	-- FLI.Desc
	self.Desc.Bar:SetScale(0.7);
	self.Desc:SetScript("OnScrollRangeChanged",Desc_OnScroll)
	self.Desc:SetScript("OnVerticalScroll",Desc_OnVScroll)
	self.Desc:SetScript("OnMouseWheel",Desc_OnMouseWheel)

	-- FLI
	self:SetFrameLevel(10);
	self:SetScript("OnEvent", FollowerLocationInfoFrame_OnEvent);
	self:SetScript("OnShow", FollowerLocationInfoFrame_OnShow);
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");

	-- FLI.ListBG
	self.ListBG:SetFrameLevel(self:GetFrameLevel()-3);
end


--[=[ WorldMap - Hook ]=]
_G.WorldMapFrame:HookScript("OnShow",function(self)
	local f = FollowerLocationInfoFrame;
	f:ClearAllPoints();
	f:SetPoint("LEFT",self,"RIGHT",30,0);
end);

_G.WorldMapFrame:HookScript("OnHide",function(self)
	local f = FollowerLocationInfoFrame;
	f:ClearAllPoints();
	f:SetPoint("LEFT",UIParent,"LEFT", 300,0);
end);
