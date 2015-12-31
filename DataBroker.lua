
local addon,ns = ...;
local Addon = gsub(addon,"_Core","");
local LDB  = LibStub("LibDataBroker-1.1");
local LDBi = LibStub("LibDBIcon-1.0");
local LDB_Object, LDBi_Object;

function FollowerLocationInfo_MinimapButton()
	if not (LDBi and LDBi_Object) then return; end
	if (FollowerLocationInfoDB.Minimap.enabled) then
		LDBi:Hide(Addon);
		FollowerLocationInfoDB.Minimap.enabled = false;
	else
		LDBi:Show(Addon);
		FollowerLocationInfoDB.Minimap.enabled = true;
	end
end

local function LDB_Update()
	if not LDB_Object then return end
	local label = {};

	-- coords
	if(FollowerLocationInfoDB.BrokerTitle_Coords)then
		local x, y = GetPlayerMapPosition("player")
		if(x~=0 and y~=0)then
			tinsert(label,("%1.1f, %1.1f"):format(x*100,y*100));
		else
			tinsert(label,"−−.−, −−.−");
		end
	end

	-- follower count / max
	if(FollowerLocationInfoDB.BrokerTitle_NumFollowers)then
		tinsert(label,numCollectedFollowers..'/'..numOfficalFollowers);
	end

	if(#label==0)then
		tinsert(label,Addon);
	end

	LDB_Object.text = table.concat(label,", ");
end
ns.LDB_Update = LDB_Update();

local function LDB_Init()
	if not (LDB and LDBi) then return end
	if LDB_Object~=nil then return end

	LDB_Object = LDB:NewDataObject(Addon, {
		type          = "data source",
		label         = Addon,
		icon          = "Interface\\Icons\\Achievement_GarrisonFollower_Rare",
		text          = Addon,
		OnClick       = function(self,button)
			if (button=="LeftButton") then
				FollowerLocationInfo_ToggleJournal();
			elseif (button=="RightButton") then
				--configMenu(self,"TOP","BOTTOM");
			end
		end,
		--OnTooltipShow = function(self) end
	});
	
	if GetAddOnInfo("SlideBar") and GetAddOnEnableState(UnitName("player"),"SlideBar")>1 then
		LDB:NewDataObject(Addon..".Launcher", {
			type          = "launcher",
			icon          = "Interface\\Icons\\Achievement_GarrisonFollower_Rare",
			OnClick       = function(self,button)
				if (button=="LeftButton") then
					FollowerLocationInfo_ToggleJournal();
				else
					-- configmenu?
				end
			end
		});
	end

	if(FollowerLocationInfoDB.Minimap==nil)then
		FollowerLocationInfoDB.Minimap={enabled=true};
	end

	if(FollowerLocationInfoDB.Minimap.enabled==nil)then
		FollowerLocationInfoDB.Minimap.enabled=true;
	end

	if(not LDB_Object)then
		LDB_Object = LDB:GetDataObjectByName(Addon);
	end

	LDBi_Object = LDBi:Register(Addon, LDB_Object, FollowerLocationInfoDB.Minimap);
	if(not FollowerLocationInfoDB.Minimap.enabled)then
		FollowerLocationInfo_MinimapButton();
	end
end
ns.LDB_Init = LDB_Init;
