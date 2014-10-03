
local addon, ns = ...;
local L = ns.L;

local InfoFrame,InfoButton = nil,nil
local _print, pairs, type = print, pairs, type;
local currentSelection = nil;
local questsCompleted;
local refresh = false;

local function print(...) _print("|cffff4444"..addon.."|r:",...) end

--[[
local function prepareQuestCheck()
	local completed = GetQuestsCompleted();
	local qlog = {};
	for i=1, GetNumQuestLogEntries() do
		
	end
end
]]

local function IsQuestCompleted(QuestID)
	if (not questsCompleted) or ((questsCompleted) and ((time() - questsCompleted.last)<300)) then
		questsCompleted = {ids=GetQuestsCompleted(), last=time()};
	end
	return (questsCompleted.ids[QuestID]==true);
end

local function GetQuestInfo(QuestID)
	assert(type(tonumber(QuestID))=="number","Usage: GetQuestInfo( <QuestId[number]> )");
	local tt, reg, line, data = FollowerLocationInfo_ScannerTooltip,nil,1,{};
	tt:SetOwner(UIParent,"ANCHOR_NONE");
	tt:ClearLines();
	tt:SetHyperlink("quest:"..QuestID);
	tt:Show();
	reg = {tt:GetRegions()}
	for k, v in ipairs(reg) do
		if (v) and v:GetObjectType()=="FontString" then
			local str = v:GetText();
			if (str) and (strtrim(str)~="") then
				tinsert(data,v:GetText());
				line = line + 1;
			end
		end
	end
	tt:Hide();
	return unpack(data);
end

local function ScrollFrameHook_OnHide(self)
	InfoFrame:Hide();
end

local function Hook_OnClick(self,button)
	if InfoFrame:IsShown() then InfoFrame:Hide(); end

	local id = self.info.followerID;
	if (self.info.garrFollowerID) then -- if info.garrFollowerID present, is info.followerID a character bind guid...
		id = tonumber(self.info.garrFollowerID);
	end

	if (ns.followers[id]) then
		InfoFrame.followerID = id;
		InfoFrame.info = ns.followers[id];
		currentSelection = id;

		local parent = GarrisonLandingPage;
		if self:GetName():find("GarrisonMissionFrame") then
			parent = GarrisonMissionFrame;
		end

		InfoFrame._parent = parent;
		InfoButton._parent = parent;

		InfoButton:Show();
	else
		InfoButton:Hide();
	end
end

local function Hook_OnHide(self)
	if (InfoButton) and (InfoButton:IsShown()) then
		InfoButton:Hide();
	end
end

local function Hook_OnShow(self)
	if (currentSelection) and (InfoButton) and (not InfoButton:IsShown()) then
		InfoButton:Show();
	end
end

local function FollowerLocationInfo_OnScroll(self, xrange, yrange)
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

local function FollowerLocationInfo_OnVScroll(self,offset)
	self.Bar:SetValue(offset);
end

local function FollowerLocationInfo_OnMouseWheel(self,value)
	local scrollStep = self.Bar.scrollStep or self.Bar:GetHeight() / 2
	if ( value > 0 ) then
		self.Bar:SetValue(self.Bar:GetValue() - scrollStep);
	else
		self.Bar:SetValue(self.Bar:GetValue() + scrollStep);
	end
end

local function FollowerLocationInfoButton_OnClick(self,button)
	if InfoFrame:IsShown() then
		InfoFrame:Hide();
	else
		InfoFrame:Show();
	end
end

local function FollowerLocationInfoButton_OnShow(self)
	self:SetParent(self._parent);
	self:ClearAllPoints();
	self:SetPoint("TOPRIGHT", -15, -122);
	self:SetScale(0.88);
	self:SetFrameLevel(self._parent:GetFrameLevel()+2);
end

local function FollowerLocationInfo_AddInfo(self, count, objType, obj)
	local p = self.Scroll.Child;
	local addLine = function(title, text, img)
		local l = nil
		count = count + 1;

		if (not self.lines[count]) then
			self.lines[count] = CreateFrame("frame",nil,p,"FollowerLocationInfoLine");
			l = self.lines[count];
		else
			l = self.lines[count];
		end

		l.title:SetText((strlen(title)>0) and title..":" or "");

		if (img) then
			l.img:SetTexture("Interface\\addons\\"..addon.."\\media\\Follower-"..img)
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
		addLine(L["Zone"], GetMapNameByID(obj[1]));
		if (#obj>1) then
			addLine(L["Coords"], obj[2]..", "..obj[3]);
			-- link / button for tomtom and co...
		end
	elseif (objType=="quest") or (objType=="questrow") or (objType=="event") then
		local title, qState, qTitle, qText, qGiver, qZone, qCoord, str;
		if objType=="quest" then
			title = "Quests";
		elseif objType=="questrow" then
			title = "Quest row";
		elseif objType=="event" then
			title = "Event";
		end
		for i,v in ipairs(obj) do
			qState, qGiver, qZone, qCoord, str = 0, "name?", "zone?", "?.?, ?.?", "%s|n    %s|n    (%s @ %s)"
			qTitle, qText = GetQuestInfo(v);
			if (qTitle) then
				if (GetQuestLogIndexByID(v)~=0) then
					qTitle = qTitle .. " |cffeeee00"..L["(In questlog)"].."|r"
				elseif (IsQuestCompleted(v)) then
					qTitle = qTitle .. " |cff888888"..L["(Completed)"].."|r"
				end
				-- ns.questnpc

				addLine(title, str:format(qTitle,qGiver,qZone, qCoord))
			elseif v==0 then
				addLine(title, "Mission quest...");
			else
				addLine(title, "Error. Missing quest data for questid "..v);
				-- ctimer um die liste zu aktuallisieren?
				refresh = true;
			end
			title = "";
		end
	elseif (objType=="mission") then
		addLine(L["Mission"], obj);
	elseif (objType=="desc") then
		addLine(L["Description"], L["Desc-"..obj]);
	elseif (objType=="img") then
		for i,v in ipairs(obj) do
			addLine(L["Image"] .. ((#obj>1) and " "..i or ""), nil, v);
		end
	elseif (objType=="currency") then
		addLine(L["Payment"], obj[2].." "..GetCurrencyLink(obj[1]));
	elseif (objType=="gold") then
		addLine(L["Payment"], GetCoinTextureString(obj));
	elseif (objType=="type") then
		addLine(L["Type"],L[obj]);
	elseif (objType=="requirements") then
		local req = "";
		for i,v in ipairs(obj) do
			if (strlen(req)>0) then req = req .. "|n"; end
			req = L[v];
		end
		addLine(L["Requirements"], req);
	else
		--addLine(L["?"], "?");
	end

	return count;
end

local function FollowerLocationInfo_OnShow(self)
	self:SetParent(self._parent);
	self:ClearAllPoints();
	self:SetPoint("TOPLEFT", 345, -160);
	self:SetPoint("BOTTOMRIGHT", -38, 38);
	self.Scroll.Bar:SetPoint("TOPLEFT",self.Scroll,"TOPRIGHT",4,0);
	self.Scroll.Bar:SetPoint("BOTTOMLEFT",self.Scroll,"BOTTOMRIGHT",4,0);
	self:SetFrameLevel(self._parent:GetFrameLevel()+10);
	self:Show();

	if (self.info) then
		if (not self.lines) then self.lines = {}; end
		local l,count = nil,0
		for i,v in ipairs(self.lines) do
			l = self.lines[i];
			l:SetParent(UIParent)
			l:SetHeight(0);
			l:ClearAllPoints();
			l:Hide();
			l.text:Hide();
			l.img:Hide();
		end
		for i,v in ipairs(self.info) do
			count = FollowerLocationInfo_AddInfo(self,count,v[1],v[2]);
		end
		if (refresh) then
			refresh=false;
			C_Timer.After(0.7,function()
				if (self:IsShown()) then
					self:Hide();
					self:Show();
				end
			end)
		end
	else
		FollowerLocationInfo_AddInfo(self,"error","No data found...");
	end
end

local function FollowerLocationInfo_OnEvent(self,event,arg1,...)
	if event=="ADDON_LOADED" then
		if arg1==addon then
			print("Addon loaded...");
			InfoFrame = FollowerLocationInfoFrame;
			InfoButton = FollowerLocationInfoButton;
		elseif arg1=="Blizzard_GarrisonUI" then
			for i,v in pairs(_G) do
				if type(i)=="string" then
					if i:find("GarrisonLandingPageListScrollFrameButton") then
						_G[i]:HookScript("OnClick",Hook_OnClick);
						_G[i]:HookScript("OnHide",Hook_OnHide);
						_G[i]:HookScript("OnShow",Hook_OnShow);
					end
				end
			end
			GarrisonLandingPageListScrollFrame:HookScript("OnHide", ScrollFrameHook_OnHide);
		end
	--elseif event=="PLAYER_ENTERING_WORLD" then
	end
end

function FollowerLocationInfo_OnLoad(self)
	self:SetScript("OnEvent", FollowerLocationInfo_OnEvent);
	self:SetScript("OnShow", FollowerLocationInfo_OnShow);
	self.Scroll.Bar:SetMinMaxValues(0,0);
	self.Scroll.Bar:SetValue(0);
	self.Scroll.Bar:SetScale(0.84);
	self.Scroll.offset = 0;
	self.Scroll.scrollBarHideable = true;
	self.Scroll:SetScript("OnScrollRangeChanged",FollowerLocationInfo_OnScroll)
	self.Scroll:SetScript("OnVerticalScroll",FollowerLocationInfo_OnVScroll)
	self.Scroll:SetScript("OnMouseWheel",FollowerLocationInfo_OnMouseWheel)
	FollowerLocationInfoButton:SetScript("OnShow", FollowerLocationInfoButton_OnShow);
	FollowerLocationInfoButton:SetScript("OnClick", FollowerLocationInfoButton_OnClick);
	self:RegisterEvent("ADDON_LOADED");
	--self:RegisterEvent("PLAYER_ENTERING_WORLD");
end

--[[

wenn man das fenster schließt und wieder öffnet, ist das anhänger noch markiert aber der button ist weg.
OnShow > check selected > InfoButton:Show();
möglich wöre auch beide progress bars zu hooken statt die buttons... onshow onhide?







infos?
	link to wowhead...
	



alle quests einer questreihe aufliste samt npc's von denen man die quests bekommt.

quests:
	eine reihe von questid's
	die quests im questlog suchen.
	die quests in abgeschlossene quests suchen.

	<questname>
		Von: <npc name>
		Map: <map name>
		Coord: <coords>






]]