
local addon, ns = ...;

local InfoFrame,InfoButton = nil,nil
local _print, pairs, type = print, pairs, type;

local function print(...) _print("|cffff4444"..addon.."|r:",...) end

local function ScrollFrameHook_OnHide(self)
	InfoFrame:Hide();
	InfoButton:Hide();
end

local function Hook_OnClick(self,button)
	if InfoFrame:IsShown() then InfoFrame:Hide(); end

	local id = self.info.followerID;
	if (self.info.garrFollowerID) then -- if info.garrFollowerID present, is info.followerID a character bind guid...
		id = tonumber(self.info.garrFollowerID);
	end

	if (ns.followers[id]) then
		InfoFrame.followerID = id;

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

local function FollowerLocationInfoButton_OnClick(self,button)
	if InfoFrame:IsShown() then
		InfoFrame:Hide();
		print("close");
	else
		InfoFrame:Show();
		print("open");
	end
end

local function FollowerLocationInfoButton_OnShow(self)
	self:ClearAllPoints();
	self:SetScale(0.7);
	if (self._parent==GarrisonLandingPage) then
		self:SetPoint("TOPRIGHT", self._parent, 8, -130);
	else
		self:SetPoint("TOPRIGHT", self._parent, 10, -110);
	end
	self:SetFrameLevel(self._parent:GetFrameLevel()+2);
end

local function FollowerLocationInfo_OnShow(self)
	self:ClearAllPoints();
	if (self._parent==GarrisonLandingPage) then
		self:SetPoint("TOPLEFT", self._parent, 264, -122);
		self:SetPoint("BOTTOMRIGHT", self._parent, -30, 29);
	else
		self:SetPoint("TOPLEFT", self._parent, 272,-107);
		self:SetPoint("BOTTOMRIGHT", self._parent, -30, 30);
	end
	self:SetFrameLevel(self._parent:GetFrameLevel()+10);
	self:Show();
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
					elseif i:find("GarrisonMissionFrameFollowersListScrollFrameButton") then
						_G[i]:HookScript("OnClick",Hook_OnClick);
					end
				end
			end
			GarrisonLandingPageListScrollFrame:HookScript("OnHide", ScrollFrameHook_OnHide);
			GarrisonMissionFrameFollowersListScrollFrame:HookScript("OnHide", ScrollFrameHook_OnHide);
		end
	--elseif event=="PLAYER_ENTERING_WORLD" then
	end
end

function FollowerLocationInfo_OnLoad(self)
	self:SetScript("OnEvent", FollowerLocationInfo_OnEvent);
	self:SetScript("OnShow", FollowerLocationInfo_OnShow);
	FollowerLocationInfoButton:SetScript("OnEnter",nil);
	FollowerLocationInfoButton:SetScript("OnLeave",nil);
	FollowerLocationInfoButton:SetScript("OnShow", FollowerLocationInfoButton_OnShow);
	FollowerLocationInfoButton:SetScript("OnClick", FollowerLocationInfoButton_OnClick);
	self:RegisterEvent("ADDON_LOADED");
	--self:RegisterEvent("PLAYER_ENTERING_WORLD");
end

--[[

wenn man das fenster schließt und wieder öffnet, ist das anhänger noch markiert aber der button ist weg.
OnShow > check selected > InfoButton:Show();
möglich wöre auch beide progress bars zu hooken statt die buttons... onshow onhide?

]]