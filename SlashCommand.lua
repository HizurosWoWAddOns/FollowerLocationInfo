
SlashCmdList["FOLLOWERLOCATIONINFO"] = function(cmd)
	local cmd, arg = strsplit(" ", cmd, 2)
	local _print = function(...) print("|cffff4444FLI|r", "|cff44aaff", ..., "|r"); end

	_print("Sorry. Currently, the chat commands are disabled.");
	_print("But it will come back...");

	--[=[
	cmd = cmd:lower()
	if (cmd=="toggle") then
		FollowerLocationInfo_Toggle();
	elseif (cmd=="collected") then
		FollowerLocationInfo_ToggleCollected();
	elseif (cmd=="ids") then
		FollowerLocationInfo_ToggleIDs();
	--elseif (cmd=="missing") then
		--FollowerLocationInfo_PrintMissingData();
	elseif (cmd=="minimap") then
		FollowerLocationInfo_MinimapButton();
	elseif (cmd=="list") then
		FollowerLocationInfo_ToggleList();
	elseif (cmd=="reset") then
		FollowerLocationInfo_ResetConfig();
	--elseif (cmd=="resetscale") then
		--FollowerLocationInfo_ResetScale();
	--elseif (cmd=="resetframe") then
		--local f=FollowerLocationInfoFrame;
		--f:SetUserPlaced(false);
		--f:ClearAllPoints();
		--f:SetPoint("LEFT",300,0);
		--f:SetUserPlaced(true);
	elseif (cmd=="genbasics") and (ns.generate_basics) then
		ns.generate_basics();
	elseif (cmd=="collectlocales") then
		FollowerLocationInfo_Collector();
	elseif (cmd=="delcollectedlocales") then
		FLI_tmpDB = {};
	else
		_print(L["Commandline options for %s"]:format(addon));
		_print(L["Usage: /fli <command>"]);
		_print("      "..L["or /followerlocationinfo <command>"]);
		_print(L["Commands:"]);
		_print("  toggle = "     .. L["Show/Hide frame"]);
		_print("  collected = "  .. L["Show/Hide collected followers"]);
		_print("  ids = "        .. L["Show/Hide follower ids"]);
		_print("  list = "       .. L["Show/Hide follower list"]);
		_print("  minimap = "    .. L["Show/Hide minimap button"]);
		_print("  reset =    "   .. L["Reset addon settings"]);
		_print("  resetframe = "  .. L["Reset frame position"]);
		--_print("  resetscale = " .. L["Reset window scaling"]);
		_print("~ development commands ~");
		--_print("  missing = "    .. L["Print missing data (follower and npc id's)"]);
		_print("  collectlocales = "    .. L["Collects localized follower names from one faction. It is recommented to use it on both factions. The character must be level 90 or higher."]);
		_print("  delcollectedlocales = "..L["Deletes collected localized follower names"]);
	end
	--]=]
end

SLASH_FOLLOWERLOCATIONINFO1 = "/fli";
SLASH_FOLLOWERLOCATIONINFO2 = "/followerlocationinfo";
