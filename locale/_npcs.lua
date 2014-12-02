
local _,ns=...;

ns.npcs = {};

ns.npcs[73877] = "Jarrod Hamby";
ns.npcs[74741] = "Romuul";
ns.npcs[75710] = "Hansel Heavyhands";
ns.npcs[75884] = "Rulkan";
ns.npcs[76204] = "Fiona";
ns.npcs[76748] = "Shelly Hamby";
ns.npcs[77014] = "Bruto";
ns.npcs[77031] = "Ahm";
ns.npcs[79159] = "Apprentice Miall";
ns.npcs[79160] = "Master Smith Ared";
ns.npcs[79322] = "Gladiator Akaani";
ns.npcs[79329] = "Miall";
ns.npcs[79457] = "Vindicator Maraad";
ns.npcs[79492] = "Dagg";
ns.npcs[79853] = "Pleasure-Bot 8000";
ns.npcs[79901] = "Torben Zapblast";
ns.npcs[79966] = "Lost Packmule";
ns.npcs[80073] = "Exarch Maladaar";
ns.npcs[80078] = "Exarch Akama";
ns.npcs[80163] = "Ken Loggin";
ns.npcs[80627] = "Miall";
ns.npcs[80628] = "Miall";
ns.npcs[80630] = "Miall";
ns.npcs[80632] = "Alliance Soldier";
ns.npcs[80672] = "Magister Serena";
ns.npcs[80727] = "Rangari Arepheon";
ns.npcs[80968] = "Miall";
ns.npcs[81076] = "Rangari Jonaa";
ns.npcs[81588] = "Thaelin Darkanvil";
ns.npcs[81751] = "Hansel Heavyhands";
ns.npcs[81772] = "Rangari Kaalya";
ns.npcs[85119] = "Glirin";
ns.npcs[85932] = "Vindicator Nuurem";
ns.npcs[86391] = "Dawn-Seeker Krek";
ns.npcs[88195] = "Hulda Shadowblade";
ns.npcs[88482] = "Gazrix Gearlock";
ns.npcs[76200] = "Prelate Reenu";
ns.npcs[79978] = "Aeda Brightdawn";
ns.npcs[79979] = "Defender Illona";
ns.npcs["o233229"] = "Shadow Council Tome of Curses";


if LOCALE_deDE then
	ns.npcs[74741] = "Romuul";
	ns.npcs[76204] = "Fiona";
	ns.npcs[77031] = "Ahm";
	ns.npcs[79159] = "Lehrling Miall";
	ns.npcs[79160] = "Meisterschmied Ared";
	ns.npcs[79457] = "Verteidiger Maraad";
	ns.npcs[79492] = "Dagg";
	ns.npcs[79853] = "Genussbot 8000";
	ns.npcs[79901] = "Torben Zischknall";
	ns.npcs[79966] = "Verirrter Packesel";
	ns.npcs[80073] = "Exarch Maladaar";
	ns.npcs[80078] = "Exarch Akama";
	ns.npcs[80163] = "Ken Kerbe";
	ns.npcs[80627] = "Miall";
	ns.npcs[80632] = "Soldatin der Allianz";
	ns.npcs[80727] = "Rangari Arepheon";
	ns.npcs[81772] = "Rangari Kaalya";
	ns.npcs[85119] = "Glirin";
	ns.npcs[85932] = "Verteidiger Nuurem";
	ns.npcs[86391] = "Dämmerungssucher Krek";
	ns.npcs[88482] = "Gazrix Kolbenfresser";
	ns.npcs[76200] = "Prälat Reenu";
	ns.npcs["o233229"] = "Fluchfoliant des Schattenrats";
end

if LOCALE_esES or LOCALE_esMX then
	ns.npcs[79160] = "Maestro herrero Ared";
	ns.npcs[80078] = "Exarca Akama";
	ns.npcs[80632] = "Soldado de la Alianza";
end

if LOCALE_frFR then
	ns.npcs[76204] = "Fiona";
	ns.npcs[79159] = "Apprentie Miall";
	ns.npcs[79160] = "Maître forgeron Ared";
	ns.npcs[79329] = "Miall";
	ns.npcs[79966] = "Mule de bât perdue";
	ns.npcs[80078] = "Exarque Akama";
	ns.npcs[80163] = "Ken Loggin";
	ns.npcs[80627] = "Miall";
	ns.npcs[80632] = "Soldat de l’Alliance";
	ns.npcs[85932] = "Redresseur de torts Nuurem";
	ns.npcs[86391] = "Traque-aube Krek";
	ns.npcs[88482] = "Gazrik Verrouage";
	ns.npcs[76200] = "Prélat Reenu";
	ns.npcs[79979] = "Défenseur Illona";
end

if LOCALE_itIT then
	ns.npcs[73877] = "Jarrod Hamby";
	ns.npcs[74741] = "Romuul";
	ns.npcs[75710] = "Hansel Maniforti";
	ns.npcs[75884] = "Rulkan";
	ns.npcs[76204] = "Fiona";
	ns.npcs[76748] = "Shelly Hamby";
	ns.npcs[77031] = "Ahm";
	ns.npcs[79159] = "Apprendista Miall";
	ns.npcs[79160] = "Maestro Fabbro Ared";
	ns.npcs[79322] = "Akaani la Gladiatrice";
	ns.npcs[79329] = "Miall";
	ns.npcs[79457] = "Vendicatore Maraad";
	ns.npcs[79492] = "Dagg";
	ns.npcs[79853] = "Sollazzo-Bot 8000";
	ns.npcs[79901] = "Torben Scoppiolampo";
	ns.npcs[79966] = "Mulo da Soma Perduto";
	ns.npcs[80073] = "Esarca Maladaar";
	ns.npcs[80078] = "Esarca Akama";
	ns.npcs[80163] = "Ken Seghetti";
	ns.npcs[80627] = "Miall";
	ns.npcs[80628] = "Miall";
	ns.npcs[80630] = "Miall";
	ns.npcs[80632] = "Soldato dell\'Alleanza";
	ns.npcs[80727] = "Guardaselve Arepheon";
	ns.npcs[80968] = "Miall";
	ns.npcs[81588] = "Thaelin Forgiacupa";
	ns.npcs[81751] = "Hansel Maniforti";
	ns.npcs[81772] = "Guardaselve Kaalya";
	ns.npcs[85932] = "Vendicatore Nuurem";
	ns.npcs[86391] = "Cercatore dell\'Alba Krek";
	ns.npcs[88195] = "Hulda Lamaombra";
	ns.npcs[88482] = "Gazrix Sbloccaruote";
	ns.npcs[76200] = "Prelato Reenu";
	ns.npcs[79978] = "Aeda Albaluce";
	ns.npcs[79979] = "Difensore Illona";
	ns.npcs["o233229"] = "Tomo delle Maledizioni del Concilio dell\'Ombra";
end

if LOCALE_ptBR then
	ns.npcs[77014] = "Brutus";
	ns.npcs[77031] = "Ahm";
	ns.npcs[79160] = "Mestre Ferreiro Ared";
	ns.npcs[79966] = "Mula de Carga Perdida";
	ns.npcs[80163] = "Kleber Loureiro";
	ns.npcs[80628] = "Miall";
	ns.npcs[80632] = "Soldado da Aliança";
	ns.npcs[81772] = "Rangari Kaalya";
	ns.npcs[76200] = "Prelado Reenu";
end

if LOCALE_ruRU then
	ns.npcs[73877] = "Джаррод Хэмби";
	ns.npcs[74741] = "Ромуул";
	ns.npcs[75884] = "Рулкан";
	ns.npcs[76204] = "Фиона";
	ns.npcs[76748] = "Шелли Хэмби";
	ns.npcs[77031] = "Ахм";
	ns.npcs[79159] = "Ученица Миалла";
	ns.npcs[79160] = "Мастер-кузнец Аред";
	ns.npcs[79457] = "Воздаятель Мараад";
	ns.npcs[79966] = "Потерявшийся вьючный мул";
	ns.npcs[80073] = "Экзарх Маладаар";
	ns.npcs[80078] = "Экзарх Акама";
	ns.npcs[80163] = "Кен Логгин";
	ns.npcs[80632] = "Солдат Альянса";
	ns.npcs[80672] = "Магистр Серена";
	ns.npcs[80727] = "Рангари Арефеон";
	ns.npcs[81076] = "Рангари Йонаа";
	ns.npcs[81588] = "Телин Темная Наковальня";
	ns.npcs[85119] = "Глирин";
	ns.npcs[85932] = "Воздаятель Нуурем";
	ns.npcs[86391] = "Искатель зари Крек";
	ns.npcs[88482] = "Газрикс Замокс";
	ns.npcs[76200] = "Прелат Рину";
	ns.npcs[79978] = "Аеда Ясная Заря";
	ns.npcs[79979] = "Защитница Иллона";
	ns.npcs["o233229"] = "Фолиант проклятий Совета Теней";
end

if LOCALE_zhTW then
	ns.npcs[73877] = "Jarrod 漢彼";
	ns.npcs[74741] = "羅穆爾";
	ns.npcs[75710] = "漢瑟爾·重拳";
	ns.npcs[75884] = "蘿坎";
	ns.npcs[76204] = "菲歐娜";
	ns.npcs[76748] = "雪莉‧漢彼";
	ns.npcs[77014] = "布魯托";
	ns.npcs[77031] = "阿哈姆";
	ns.npcs[79159] = "見習工藝師 米歐";
	ns.npcs[79160] = "Master Smith Ared";
	ns.npcs[79322] = "角鬥士阿卡尼";
	ns.npcs[79329] = "米歐";
	ns.npcs[79457] = "復仇者瑪銳德";
	ns.npcs[79492] = "達戈";
	ns.npcs[79853] = "快樂機器人 8000";
	ns.npcs[79901] = "托爾班‧速轟";
	ns.npcs[79966] = "Lost Packmule";
	ns.npcs[80073] = "瑪拉達爾主教";
	ns.npcs[80078] = "阿卡瑪主教";
	ns.npcs[80163] = "肯 羅金";
	ns.npcs[80627] = "米歐";
	ns.npcs[80628] = "米歐";
	ns.npcs[80630] = "米歐";
	ns.npcs[80632] = "聯盟士兵";
	ns.npcs[80672] = "博學者塞瑞娜";
	ns.npcs[80727] = "遊俠阿爾菲奧";
	ns.npcs[80968] = "米歐";
	ns.npcs[81076] = "遊俠喬納";
	ns.npcs[81588] = "塞林·暗砧";
	ns.npcs[81751] = "漢瑟爾·重拳";
	ns.npcs[81772] = "遊俠凱爾雅";
	ns.npcs[85119] = "葛里林";
	ns.npcs[85932] = "Vindicator Nuurem";
	ns.npcs[86391] = "Dawn-Seeker Krek";
	ns.npcs[88195] = "荷爾達‧影刃";
	ns.npcs[88482] = "Gazrix Gearlock";
	ns.npcs[76200] = "Prelate Reenu";
	ns.npcs[79978] = "愛伊達‧明曦";
	ns.npcs[79979] = "防衛者伊蘿娜";
	ns.npcs["o233229"] = "暗影議會詛咒寶典";
end
