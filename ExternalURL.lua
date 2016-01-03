
local addon,ns = ...;

local Locale = GetLocale();

ns.ExternalURLValues = {
	WoWHead = "WoWHead",
	WoWDB = "WoWDB (english only)",
	Thottbot = "Thottbot (english only)",
	Buffed = "Buffed"
};

--- Usage:
-- StaticPopup_Show("FOLLOWERLOCATIONINFO_EXTERNALURL_DIALOG",nil,nil,{<Target[string]>,<Type[string]>,<Id[number|string]>});
StaticPopupDialogs["FOLLOWERLOCATIONINFO_EXTERNALURL_DIALOG"] = {
	text = "URL",
	button2 = CLOSE,
	timeout = 0,
	whileDead = 1, 
	hasEditBox = 1,
	hideOnEscape = 1,
	maxLetters = 1024,
	editBoxWidth = 250,
	OnShow = function(self)
		local Target,Type,Id = unpack(self.data or {});
		local url,lang,field = "";

		if Target=="WoWHead" then
			lang = {deDE="de",esES="es",esMX="es",frFR="fr",itIT="it",ptPT="pt",ptBR="pt",ruRU="ru",koKR="ko",zhCN="cn", zhTW="cn" };
			field = {q="quest",i="item",s="spell",o="object"};
			url = ("http://%s.wowhead.com/%s=%d"):format(lang[Locale] or "www",field[Type],Id);
		elseif Target=="Buffed" then
			lang = {deDE="de",ruRU="ru"};
			field = {q="q",i="i",s="s",o="o"};
			url = ("http://wowdata.getbuffed.%s/?q=%d"):format(lang[Locale] or "com",field[Type],Id);
		elseif Target=="Thottbot" then
			field = {q="quest",i="item",s="spell",o="object"};
			url = ("http://www.thottbot.com/%s=%d"):format(field[Type],Id);
		elseif Target=="WowDB" then
			field = {q="quests",i="items",s="spells",o="objects"};
			url = ("http://www.wowdb.com/%s/%d"):format(field[Type],Id);
		else
			-- ?
		end

		_G[self:GetName().."EditBox"]:SetText(url);
		_G[self:GetName().."EditBox"]:SetFocus();
		_G[self:GetName().."EditBox"]:HighlightText(0);
		_G[self:GetName().."Button2"]:ClearAllPoints();
		_G[self:GetName().."Button2"]:SetWidth(100);
		_G[self:GetName().."Button2"]:SetPoint("CENTER",_G[self:GetName().."EditBox"],"CENTER",0,-30);
	end,
	EditBoxOnEscapePressed = function(self)
		self:GetParent():Hide()
	end
}

