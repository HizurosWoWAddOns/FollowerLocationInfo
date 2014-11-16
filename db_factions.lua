
local addon, ns = ...;

ns.factions = {
	[1445] = "Frostwolf Orcs",
	[1515] = "Arakkoa Outcasts",
	[1520] = "Shadowmoon Exiles",
	[1681] = "Vol'jin's Spear",
	[1682] = "Wrynn's Vanguard",
	[1708] = "Laughing Skull Orcs",
	[1710] = "Sha'tari Defense",
	[1711] = "Steamwheedle Preservation Society",
	[1731] = "Council of Exarchs",
	[1732] = "Steamwheedle Draenor Expedition",
	[1735] = "Barracks Bodyguards",
};

if LOCALE_deDE then
	ns.factions[1445] = "Frostwolforcs";
	ns.factions[1515] = "Ausgestoßene Arakkoa";
	ns.factions[1520] = "Exilanten des Schattenmondklans";
	ns.factions[1681] = "Vol'jins Speer";
	ns.factions[1682] = "Wrynns Vorhut";
	ns.factions[1708] = "Orcs des Lachenden Schädels";
	ns.factions[1710] = "Sha'tarverteidigung";
	ns.factions[1711] = "Werterhaltungsgesellschaft des Dampfdruckkartells";
	ns.factions[1731] = "Exarchenrat";
	ns.factions[1732] = "Draenorexpedition des Dampfdruckkartells";
	ns.factions[1735] = "Kasernenleibwachen";
end

if LOCALE_esES or LOCALE_esMX then
	ns.factions[1445] = "Orcos Lobo Gélido";
	ns.factions[1515] = "Arakkoa desterrados";
	ns.factions[1520] = "Exiliados Sombraluna";
	ns.factions[1681] = "Lanza de Vol'jin";
	ns.factions[1682] = "Vanguardia de Wrynn";
	ns.factions[1708] = "Orcos Riecráneos";
	ns.factions[1710] = "Defensa Sha'tari";
	ns.factions[1711] = "Sociedad Patrimonial Bonvapor";
	ns.factions[1731] = "Consejo de Exarcas";
	ns.factions[1732] = "Expedición Bonvapor de Draenor";
	ns.factions[1735] = "Guardaespaldas del cuartel";
end

if LOCALE_frFR then
	ns.factions[1445] = "Orcs loups-de-givre";
	ns.factions[1515] = "Parias arakkoa";
	ns.factions[1520] = "Exilés ombrelunes";
	ns.factions[1681] = "Lance de Vol’jin";
	ns.factions[1682] = "Avant-garde de Wrynn";
	ns.factions[1708] = "Orcs du Crâne-Ricanant";
	ns.factions[1710] = "Défense sha’tari";
	ns.factions[1711] = "Société de Conservation de Gentepression";
	ns.factions[1731] = "Conseil des exarques";
	ns.factions[1732] = "Expédition de Gentepression en Draenor";
	ns.factions[1735] = "Gardes du corps de caserne";
end

if LOCALE_itIT then
	ns.factions[1445] = "Orchi Lupi Bianchi";
	ns.factions[1515] = "Esiliati Arakkoa";
	ns.factions[1520] = "Esiliati Torvaluna";
	ns.factions[1681] = "Lancia di Vol'jin";
	ns.factions[1682] = "Avanguardia di Wrynn";
	ns.factions[1708] = "Orchi Teschio Ridente";
	ns.factions[1710] = "Protettori Sha'tari";
	ns.factions[1711] = "Società di Preservazione degli Spargifumo";
	ns.factions[1731] = "Concilio degli Esarchi";
	ns.factions[1732] = "Spedizione su Draenor degli Spargifumo";
	ns.factions[1735] = "Guardie del Corpo della Caserma";
end

--if LOCALE_koKR then end

if LOCALE_ptBR then
	ns.factions[1445] = "Orcs Lobo do Gelo";
	ns.factions[1515] = "Arakkoas Proscritos";
	ns.factions[1520] = "Exilados da Lua Negra";
	ns.factions[1681] = "Lança de Vol'jin";
	ns.factions[1682] = "Vanguarda de Wrynn";
	ns.factions[1708] = "Orcs Cargaveira";
	ns.factions[1710] = "Defesa Sha'tari";
	ns.factions[1711] = "Sociedade de Preservação de Bondebico";
	ns.factions[1731] = "Conselho de Exarcas";
	ns.factions[1732] = "Expedição a Draenor de Bondebico";
	ns.factions[1735] = "Guarda-costas do Quartel";
end

if LOCALE_ruRU then
	ns.factions[1445] = "Клан Северного Волка";
	ns.factions[1515] = "Араккоа-изгои";
	ns.factions[1520] = "Изгнанники клана Призрачной Луны";
	ns.factions[1681] = "Копье Вол'джина";
	ns.factions[1682] = "Авангард Ринна";
	ns.factions[1708] = "Клан Веселого Черепа";
	ns.factions[1710] = "Защитники Ша'тар";
	ns.factions[1711] = "Археологическое общество Хитрой Шестеренки";
	ns.factions[1731] = "Совет экзархов";
	ns.factions[1732] = "Дренорcкая Экспедиция Хитрой Шестеренки";
	ns.factions[1735] = "Телохранители из казарм";
end

-- if LOCALE_zhCN or LOCALE_zhTW then end

