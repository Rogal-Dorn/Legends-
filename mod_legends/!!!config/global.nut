::Const.Serialization.Version <- 73;

::Const.Difficulty = {
	Easy = 0,
	Normal = 1,
	Hard = 2,
	Legendary = 3,
	BuyPriceMult = [
		0.95,
		1.0,
		1.05,
		1.1
	],
	SellPriceMult = [
		1.05,
		1.0,
		0.95,
		0.9
	],
	EnemyMult = [
		0.85,
		1.0,
		1.15,
		1.0
	],
	PaymentMult = [
		1.1,
		1.0,
		0.95,
		0.9
	],
	MinPayments = [
		100,
		50,
		30,
		10
	],
	MinHeadPayments = [
		15,
		10,
		5,
		1
	],
	HealMult = [
		1.0,
		0.66,
		0.33,
		0.1
	],
	RepairMult = [
		1.0,
		0.66,
		0.33,
		0.1
	],
	RetreatDefenseBonus = [
		30,
		20,
		10,
		0
	],
	XPMult = [
		1.1,
		1.0,
		1.0,
		1.0
	],
	MaxResources = [
		{
			Food = 300,
			Ammo = 250,
			Medicine = 100,
			ArmorParts = 100
		},
		{
			Food = 250,
			Ammo = 150,
			Medicine = 75,
			ArmorParts = 75
		},
		{
			Food = 200,
			Ammo = 100,
			Medicine = 50,
			ArmorParts = 75
		},
		{
			Food = 100,
			Ammo = 75,
			Medicine = 30,
			ArmorParts = 50
		}
	]
};

if (!("COUNT" in ::Const.EntityType)) {
	::Const.EntityType.COUNT <- ::Const.EntityType.Oathbringer;
} else {
	::Const.EntityType.COUNT = ::Const.EntityType.Oathbringer;
}

::Const.EntityType.addNew <- function (_icon, _name, _plural) {
	::Const.EntityIcon.push(_icon);
	::Const.Strings.EntityName.push(_name);
	::Const.Strings.EntityNamePlural.push(_plural);
	::Const.EntityType.COUNT += 1;
	return ::Const.EntityType.COUNT;
}

::Const.EntityType.BanditRabble <-
	::Const.EntityType.addNew("rabble_orientation", "Bandit Rabble", "Bandit Rabble");
::Const.EntityType.LegendCat <-
	::Const.EntityType.addNew("cat_orientation", "Cat", "Cats");
::Const.EntityType.LegendOrcElite <-
	::Const.EntityType.addNew("orc_elite_orientation", "Orc Elite", "Orc Elites");
::Const.EntityType.LegendOrcBehemoth <-
	::Const.EntityType.addNew("orc_behemoth_orientation", "Orc Behemoth", "Orc Behemoths");
::Const.EntityType.LegendWhiteDirewolf <-
	::Const.EntityType.addNew("white_direwolf_orientation", "White Direwolf", "White Direwolves");
::Const.EntityType.LegendSkinGhoul <-
	::Const.EntityType.addNew("skin_ghoul_orientation", "Skin Ghoul", "Skin Ghouls");
::Const.EntityType.LegendStollwurm <-
	::Const.EntityType.addNew("stollwurm_orientation", "Stollwurm", "Stollwurmer");
::Const.EntityType.LegendRockUnhold <-
	::Const.EntityType.addNew("rock_unhold_orientation", "Rock Unhold", "Rock Unholds");
::Const.EntityType.LegendRedbackSpider <-
	::Const.EntityType.addNew("redback_spider_orientation", "Redback Spider", "Redback Spiders");
::Const.EntityType.LegendDemonAlp <-
	::Const.EntityType.addNew("demonalp_orientation", "Demon Alp", "Demon Alps");
::Const.EntityType.LegendHexeLeader <-
	::Const.EntityType.addNew("hexen_leader_orientation", "Hexe Coven Leader", "Hexe Coven Leaders");
::Const.EntityType.LegendGreenwoodSchrat <-
	::Const.EntityType.addNew("greenwood_schrat_orientation", "Heartwood Schrat", "Heartwood Schrats");
::Const.EntityType.LegendGreenwoodSchratSmall <-
	::Const.EntityType.addNew("greenwood_schrat_small_orientation", "Heartwood Sapling", "Heartwood Saplings");
::Const.EntityType.LegendWhiteWarwolf <-
	::Const.EntityType.addNew("white_direwolf_orientation", "White Warwolf", "White Warwolves");
::Const.EntityType.LegendBanshee <-
	::Const.EntityType.addNew("banshee_orientation_2", "Winselmutter", "Winselmutters");
::Const.EntityType.LegendDemonHound <-
	::Const.EntityType.addNew("hollenhound_orientation", "Höllenhund", "Höllenhunds");
::Const.EntityType.LegendVampireLord <-
	::Const.EntityType.addNew("vampire_lord_orientation", "Necrosavant Lord", "Necrosavant Lords");
::Const.EntityType.BanditVeteran <-
	::Const.EntityType.addNew("banditveteran_orientation", "Bandit Veteran", "Bandit Veterans");
::Const.EntityType.BanditWarlord <-
	::Const.EntityType.addNew("banditwarlord_orientation", "Bandit Warlord", "Bandit Warlords");
::Const.EntityType.LegendPeasantButcher <-
	::Const.EntityType.addNew("butcher_orientation", "Butcher", "Butchers");
::Const.EntityType.LegendPeasantBlacksmith <-
	::Const.EntityType.addNew("blacksmith_orientation", "Blacksmith", "Blacksmiths");
::Const.EntityType.LegendPeasantMonk <-
	::Const.EntityType.addNew("monk_orientation", "Monk", "Monks");
::Const.EntityType.LegendPeasantFarmhand <-
	::Const.EntityType.addNew("farmhand_orientation", "Farmhand", "Farmhands");
::Const.EntityType.LegendPeasantMinstrel <-
	::Const.EntityType.addNew("minstrel_orientation", "Minstrel", "Minstrels");
::Const.EntityType.LegendPeasantPoacher <-
	::Const.EntityType.addNew("poacher_orientation", "Poacher", "Poachers");
::Const.EntityType.LegendPeasantWoodsman <-
	::Const.EntityType.addNew("woodcutter_orientation", "Woodcutter", "Woodsfolk");
::Const.EntityType.LegendPeasantMiner <-
	::Const.EntityType.addNew("miner_orientation", "Miner", "Miners");
::Const.EntityType.LegendPeasantSquire <-
	::Const.EntityType.addNew("squire_orientation", "Squire", "Squires");
::Const.EntityType.LegendPeasantWitchHunter <-
	::Const.EntityType.addNew("witchhunter_orientation", "Witch Hunter", "Witch Hunters");
::Const.EntityType.LegendHalberdier <-
	::Const.EntityType.addNew("halberdier_orientation", "Halberdier", "Halberdiers");
::Const.EntityType.LegendSlinger <-
	::Const.EntityType.addNew("slinger_orientation", "Slinger", "Slingers");
::Const.EntityType.LegendFencer <-
	::Const.EntityType.addNew("fencer_orientation", "Fencer", "Fencers");
::Const.EntityType.BanditOutrider <-
	::Const.EntityType.addNew("banditoutrider_orientation", "Bandit Outrider", "Bandit Outriders");
::Const.EntityType.LegendBear <-
	::Const.EntityType.addNew("bear_orientation", "Bear", "Bears");
::Const.EntityType.LegendCatapult <-
	::Const.EntityType.addNew("catapult_01_orientation", "Catapult", "Catapults");
::Const.EntityType.LegendHorse <-
	::Const.EntityType.addNew("horse_orientation", "Horse", "Horses");
::Const.EntityType.SkeletonGladiator <-
	::Const.EntityType.addNew("gladiator_orientation", "Ancient Gladiator", "Ancient Gladiators");
::Const.EntityType.BanditRabblePoacher <-
	::Const.EntityType.addNew("rabble_poacher_orientation", "Bandit Rabble Poacher", "Bandit Rabble Poachers");
::Const.EntityType.BanditVermes <-
	::Const.EntityType.addNew("bandit_raider_orientation", "Infected Bandit", "Bandit Vermes");
::Const.EntityType.SatoManhunter <-
	::Const.EntityType.addNew("nomad_02", "Manhunter", "Manhunters");
::Const.EntityType.SatoManhunterVeteran <-
	::Const.EntityType.addNew("nomad_05", "Manhunter Veteran", "Manhunter Veterans");
::Const.EntityType.LegendMummyLight <-
	::Const.EntityType.addNew("mummy_light_orientation", "Embalmed Slave", "Embalmed Slaves");
::Const.EntityType.LegendMummyMedium <-
	::Const.EntityType.addNew("mummy_medium_orientation", "Embalmed Soldier", "Embalmed Soldiers");
::Const.EntityType.LegendMummyHeavy <-
	::Const.EntityType.addNew("mummy_heavy_orientation", "Embalmed Noble", "Embalmed Nobles");
::Const.EntityType.LegendMummyQueen <-
	::Const.EntityType.addNew("mummy_queen_orientation", "Embalmed Queen", "Embalmed Queens");
::Const.EntityType.KoboldFighter <-
	::Const.EntityType.addNew("kobold_fighter_orientation", "Kobold Fighter", "Kobold Fighters");
::Const.EntityType.KoboldWolfrider <-
	::Const.EntityType.addNew("kobold_wolfrider_orientation", "Kobold Wolfrider", "Kobold Wolfriders");
::Const.EntityType.LegendMummyPriest <-
	::Const.EntityType.addNew("mummy_priest_orientation", "Embalmed Priest", "Embalmed Priests");
::Const.EntityType.FreeCompanySpearman <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Spearman", "Free Company Spearmen");
::Const.EntityType.FreeCompanySlayer <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Slayer", "Free Company Slayers");
::Const.EntityType.FreeCompanyFootman <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Footman", "Free Company Footmen");
::Const.EntityType.FreeCompanyArcher <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Archer", "Free Company Archers");
::Const.EntityType.FreeCompanyCrossbow <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Crossbow", "Free Company Crossbows");
::Const.EntityType.FreeCompanyLongbow <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Longbow", "Free Company Longbows");
::Const.EntityType.FreeCompanyBillman <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Billman", "Free Company Billmen");
::Const.EntityType.FreeCompanyPikeman <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Pikeman", "Free Company Pikemen");
::Const.EntityType.FreeCompanyInfantry <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Infantry", "Free Company Infantry");
::Const.EntityType.FreeCompanyLeader <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Leader", "Free Company Leaders");
::Const.EntityType.FreeCompanyLeaderLow <-
	::Const.EntityType.addNew("mercenary_orientation", "Free Company Ringleader", "Free Company Ringleaders");
::Const.EntityType.SatoManhunterRanged <-
	::Const.EntityType.addNew("nomad_02", "Manhunter Handgonner", "Manhunter Handgonners");
::Const.EntityType.SatoManhunterVeteranRanged <-
	::Const.EntityType.addNew("nomad_05", "Manhunter Veteran Handgonner", "Manhunter Veteran Handgonners");
::Const.EntityType.LegendNobleGuard <-
	::Const.EntityType.addNew("footman_veteran_orientation", "Royal Guard", "Royal Guards");
::Const.EntityType.LegendManAtArms <-
	::Const.EntityType.addNew("footman_veteran_orientation", "Veteran Knight", "Veteran Knights");
::Const.EntityType.LegendBasiliskDrone <-
	::Const.EntityType.addNew("basilisk_drone_orientation", "Basilisk Drone", "Basilisk Drones");
::Const.EntityType.LegendBasiliskDroneLow <-
	::Const.EntityType.addNew("basilisk_drone_orientation", "Basilisk Drone", "Basilisk Drones");
::Const.EntityType.LegendCaravanPolearm <-
	::Const.EntityType.addNew("caravan_hand_orientation", "Caravan Polearm", "Caravan Polearms");
::Const.EntityType.NobleEliteFootman <-
	::Const.EntityType.addNew("footman_veteran_orientation", "Elite Footman", "Elite Footmen");
::Const.EntityType.NoblePollax <-
	::Const.EntityType.addNew("billman_orientation", "Pollaxe", "Pollaxes");
::Const.EntityType.NobleSureshot <-
	::Const.EntityType.addNew("arbalester_orientation", "Sureshot", "Sureshots");
::Const.EntityType.LegendBasiliskSentry <-
	::Const.EntityType.addNew("basilisk_drone_orientation", "Basilisk Sentries", "Basilisk Sentries");


local originalgetDefaultFaction = ::Const.EntityType.getDefaultFaction
::Const.EntityType.getDefaultFaction = function (_id) {
	switch(_id) {
		case this.Const.EntityType.LegendBanshee:
		case this.Const.EntityType.LegendDemonHound:
		case this.Const.EntityType.LegendVampireLord:
		case this.Const.EntityType.SkeletonGladiator:
		case this.Const.EntityType.LegendMummyLight:
		case this.Const.EntityType.LegendMummyMedium:
		case this.Const.EntityType.LegendMummyHeavy:
		case this.Const.EntityType.LegendMummyQueen:
		case this.Const.EntityType.LegendMummyPriest:
			return this.Const.FactionType.Undead;

		case this.Const.EntityType.LegendOrcElite:
		case this.Const.EntityType.LegendOrcBehemoth:
			return this.Const.FactionType.Orcs;

		case this.Const.EntityType.LegendCaravanPolearm:
			return this.Const.FactionType.Settlement;

		case this.Const.EntityType.LegendHalberdier:
		case this.Const.EntityType.LegendSlinger:
		case this.Const.EntityType.LegendFencer:
		case this.Const.EntityType.LegendNobleGuard:
		case this.Const.EntityType.LegendManAtArms:
		case this.Const.EntityType.NobleEliteFootman:
			return this.Const.FactionType.NobleHouse;

		case this.Const.EntityType.LegendCat:
	// Not sure what to do with LegendPeasantX yet, so we'll put them in Generic for now
		case this.Const.EntityType.LegendPeasantButcher:
		case this.Const.EntityType.LegendPeasantBlacksmith:
		case this.Const.EntityType.LegendPeasantMonk:
		case this.Const.EntityType.LegendPeasantFarmhand:
		case this.Const.EntityType.LegendPeasantMinstrel:
		case this.Const.EntityType.LegendPeasantPoacher:
		case this.Const.EntityType.LegendPeasantWoodsman:
		case this.Const.EntityType.LegendPeasantMiner:
		case this.Const.EntityType.LegendPeasantSquire:
		case this.Const.EntityType.LegendPeasantWitchHunter:
	// Other stuff
		case this.Const.EntityType.LegendCatapult:
		case this.Const.EntityType.LegendHorse:
	// Unused Free Company
		case this.Const.EntityType.FreeCompanySpearman:
		case this.Const.EntityType.FreeCompanySlayer:
		case this.Const.EntityType.FreeCompanyFootman:
		case this.Const.EntityType.FreeCompanyArcher:
		case this.Const.EntityType.FreeCompanyCrossbow:
		case this.Const.EntityType.FreeCompanyLongbow:
		case this.Const.EntityType.FreeCompanyBillman:
		case this.Const.EntityType.FreeCompanyPikeman:
		case this.Const.EntityType.FreeCompanyInfantry:
		case this.Const.EntityType.FreeCompanyLeader:
		case this.Const.EntityType.FreeCompanyLeaderLow:
			return this.Const.FactionType.Generic;

		case this.Const.EntityType.BanditRabble:
		case this.Const.EntityType.BanditVeteran:
		case this.Const.EntityType.BanditWarlord:
		case this.Const.EntityType.BanditOutrider:
		case this.Const.EntityType.BanditRabblePoacher:
		case this.Const.EntityType.BanditVermes:
			return this.Const.FactionType.Bandits;

		case this.Const.EntityType.KoboldFighter:
		case this.Const.EntityType.KoboldWolfrider:
			return this.Const.FactionType.Goblins;

		case this.Const.EntityType.LegendWhiteDirewolf:
		case this.Const.EntityType.LegendSkinGhoul:
		case this.Const.EntityType.LegendStollwurm:
		case this.Const.EntityType.LegendRockUnhold:
		case this.Const.EntityType.LegendRedbackSpider:
		case this.Const.EntityType.LegendDemonAlp:
		case this.Const.EntityType.LegendHexeLeader:
		case this.Const.EntityType.LegendGreenwoodSchrat:
		case this.Const.EntityType.LegendGreenwoodSchratSmall:
		case this.Const.EntityType.LegendWhiteWarwolf:
		case this.Const.EntityType.LegendBear:
		case this.Const.EntityType.LegendBasiliskDrone:
		case this.Const.EntityType.LegendBasiliskDroneLow:
		case this.Const.EntityType.LegendBasiliskSentry:
			return this.Const.FactionType.Beasts;

		case this.Const.EntityType.SatoManhunter:
		case this.Const.EntityType.SatoManhunterVeteran:
		case this.Const.EntityType.SatoManhunterRanged:
		case this.Const.EntityType.SatoManhunterVeteranRanged:
			return this.Const.FactionType.OrientalCityState;

		default:
			return originalgetDefaultFaction(_id);
	}
}
