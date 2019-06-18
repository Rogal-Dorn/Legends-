local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

//Keep for Beta 11backwards compatibility
gt.Const.Perks.findByBackground <- function ( _perkID, _background )
{
	if ( _perkID == null || _background == null)
	{
		return null;
	}

	local perkMap = gt.Const.Perks.getPerksTree(_background);
	if (perkMap == null)
	{
		return null;
	}

	if (_perkID in perkMap.Map)
	{
		return perkMap.Map[_perkID];
	}

	return null;
};

//Keep for Beta 11 backwards compatibility
gt.Const.Perks.getPerksTree <- function ( _background )
{
	switch ( _background )
	{
		// case "background.legend_commander_witch":
		// 	return gt.Const.Perks.PerksTreeSeer;
		// 	break;
		// case "background.legend_witch":
		// 	return gt.Const.Perks.PerksTreeSeerWeak;
		// 	break;
		// case "background.legend_commander_crusader":
		// 	return gt.Const.Perks.PerksTreeCrusader;
		// 	break;
		// case "background.legend_crusader":
		// 	return gt.Const.Perks.PerksTreeCrusaderWeak;
		// 	break;
		// case "background.legend_commander_ranger":
		// 	return gt.Const.Perks.PerksTreeRanger;
		// 	break;
		// case "background.legend_ranger":
		// 	return gt.Const.Perks.PerksTreeRangerWeak;
		// 	break;
		// case "background.legend_commander_necro":
		// 	return gt.Const.Perks.PerksTreeNecromancer;
		// 	break;
		// case "background.legend_necro":
		// 	return gt.Const.Perks.PerksTreeNecromancerWeak;
		// 	break;
		// case "background.legend_commander_noble":
		// 	return gt.Const.Perks.PerksTreeNoble;
		// 	break;
		case "background.legend_noble":
			return gt.Const.Perks.PerksTreeNobleWeak;
			break;
		// case "background.legend_commander_beggar":
		// 	return gt.Const.Perks.PerksTreeBeggar;
		// 	break;
		// case "background.legend_commander_berserker":
		// 	return gt.Const.Perks.PerksTreeBerserker;	
		// 	break;
		// case "background.legend_berserker":
		// 	return gt.Const.Perks.PerksTreeBerserkerWeak;
		// 	break;
		// case "background.legend_donkey":
		// 	return gt.Const.Perks.PerksTreeDonkey;
		// 	break;
		// case "background.legend_commander_trader":
		// 	return gt.Const.Perks.PerksTreeTrader;
		// 	break;
		// case "background.legend_inventor":
		// 	return gt.Const.Perks.PerksTreeInventorWeak;
		// 	break;
		// case "background.legend_commander_vala":
		// 	return gt.Const.Perks.PerksTreeVala;
		// 	break;
		// case "background.legend_vala":
		// 	return gt.Const.Perks.PerksTreeValaWeak;
		// 	break;			
		case "background.apprentice":
			return gt.Const.Perks.PerksTreeTemplate;
			break;
		case "background.peddler":
			return gt.Const.Perks.PerksTreePeddler;
			break;
		case "background.miner":
			return gt.Const.Perks.PerksTreePickaxe;
			break;
		case "background.militia":
			return gt.Const.Perks.PerksTreeMilitia;
			break;
		case "background.legend_noble_shield":
			return gt.Const.Perks.PerksTreeMilitia;
			break;
		case "background.minstrel":
			return gt.Const.Perks.PerksTreeLute;
			break;
		case "background.female_minstrel":
			return gt.Const.Perks.PerksTreeLute;
			break;
		case "background.legend_blacksmith":
			return gt.Const.Perks.PerksTreeHammer;
			break;
		case "background.legend_ironmonger":
			return gt.Const.Perks.PerksTreeHammer;
			break;
		case "background.farmhand":
			return gt.Const.Perks.PerksTreePitchfork;
			break;
		case "background.female_farmhand":
			return gt.Const.Perks.PerksTreePitchfork;
			break;
		case "background.poacher":
			return gt.Const.Perks.PerksTreeShortbow;
			break;
		case "background.gravedigger":
			return gt.Const.Perks.PerksTreeShovel;
			break;
		case "background.graverobber":
			return gt.Const.Perks.PerksTreeShovel;
			break;
		case "background.lumberjack":
			return gt.Const.Perks.PerksTreeWoodaxe;
			break;
		case "background.legend_noble_2h":
			return gt.Const.Perks.PerksTreeWoodaxe;
			break;
		case "background.thief":
			return gt.Const.Perks.PerksTreeKnife;
			break;
		case "background.female_butcher":
			return gt.Const.Perks.PerksTreeButcher;
			break;
		case "background.legend_cannibal":
			return gt.Const.Perks.PerksTreeButcher;
			break;
		case "background.butcher":
			return gt.Const.Perks.PerksTreeButcher;
			break;
		case "background.female_thief":
			return gt.Const.Perks.PerksTreeKnife;
			break;
		case "background.legend_herbalist":
			return gt.Const.Perks.PerksTreeSickle;
			break;
		case "background.legend_noble_ranged":
			return gt.Const.Perks.PerksTreeSling;
			break;
		case "background.shepard":
			return gt.Const.Perks.PerksTreeSling;
			break;
		case "background.legend_shieldmaiden":
			return gt.Const.Perks.PerksTreeShield;
			break;
		case "background.fisherman":
			return gt.Const.Perks.PerksTreeNets;
			break;
		case "background.beast_slayer":
			return gt.Const.Perks.PerksTreeBeastHunter;
			break;
		case "background.flagellant":
			return gt.Const.Perks.PerksTreeNinetail;
			break;
		case "background.pacified_flagellant":
			return gt.Const.Perks.PerksTreeNinetail;
			break;
		case "background.monk_turned_flagellant":
			return gt.Const.Perks.PerksTreeNinetail;
			break;
		case "background.cultist":
			return gt.Const.Perks.PerksTreeNinetail;
			break;
		case "background.converted_cultist":
			return gt.Const.Perks.PerksTreeNinetail;
			break;
		case "background.barbarian":
			return gt.Const.Perks.PerksTreeBarbarian;
			break;
		case "background.hunter":
			return gt.Const.Perks.PerksTreeHunter;
			break;
		case "background.female_adventurous_noble":
			return gt.Const.Perks.PerksTreeArcher;
			break;
		case "background.female_disowned_noble":
			return gt.Const.Perks.PerksTreeArcher;
			break;
		case "background.female_bowyer":
			return gt.Const.Perks.PerksTreeArcher;
			break;
		case "background.bowyer":
			return gt.Const.Perks.PerksTreeArcher;
			break;
		case "background.monk":
			return gt.Const.Perks.PerksTreeHoly;
			break;
		case "background.legend_nun":
			return gt.Const.Perks.PerksTreeHoly;
			break;
		case "background.legend_taxidermist":
			return gt.Const.Perks.PerksTreeTaxidermist;
			break;
		case "background.witch_hunter":
			return gt.Const.Perks.PerksTreeWitchHunter;
			break;
		case "background.deserter":
			return gt.Const.Perks.PerksTreeDeserter;
			break;
		case "background.sellsword":
			return gt.Const.Perks.PerksTreeSoldier;
			break;
		case "background.retired_soldier":
			return gt.Const.Perks.PerksTreeSoldier;
			break;
		case "background.squire":
			return gt.Const.Perks.PerksTreeSoldier;
			break;
		case "background.swordmaster":
			return gt.Const.Perks.PerksTreeSwordMaster;
			break;
		case "background.hedge_knight":
			return gt.Const.Perks.PerksTreeSwordMaster;
			break;
		case "background.bastard":
			return gt.Const.Perks.PerksTreeBastard;
			break;
		case "background.disowned_noble":
			return gt.Const.Perks.PerksTreeBastard;
			break;
		case "background.assassin":
			return gt.Const.Perks.PerksTreeAssassin;
			break;
		default:
			return gt.Const.Perks.PerksTreeTemplate;
	}
	return null;
};


gt.Const.Perks.getDefaultPerks <- function ( _background )
{
	switch ( _background )
	{
		case "background.adventurous_noble":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.InspirationalTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.ViciousTree,
				};
		break;
		case "background.female_adventurous_noble":
		return {
			gt.Const.Perks.BowTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ArchersTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.InspirationalTree,
				};
		break;
		case "background.apprentice":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.assassin":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.TrainedTree
				};
		break;
		case "background.female_miller":
		return {
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.LightArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.barbarian":
		return {
			gt.Const.Perks.GreatSwordTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.bastard":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.beast_slayer":
		return {
			gt.Const.Perks.GreatSwordTree,
			gt.Const.Perks.ThrowingTree,
			//gt.Const.Perks.BeastMasterTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.BeastsTree,
			gt.Const.Perks.MysticTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.beggar":
		return {
			//gt.Const.Perks.FistsTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.legend_blacksmith":
		return {
			gt.Const.Perks.HammerTree,
			//gt.Const.Perks.BlacksmithHammerTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.RepairClassTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.bowyer":
		return {
			gt.Const.Perks.BowTree,
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.female_bowyer":
		return {
			gt.Const.Perks.BowTree,
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.brawler":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.butcher":
		return {
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.DaggerTree,
			//gt.Const.Perks.ButcherCleaverTree
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.legend_cannibal":
		return {
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.SwordsTree,
			//gt.Const.Perks.ButcherCleaverTree,
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.MartyrTree
				};
		break;
		case "background.caravan_hand":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.cripple":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.cultist":
		return {
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.FlailTree,
			//gt.Const.Perks.NinetailsTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.daytayler":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.daytayler":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.deserter":
		return {
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.disowned_noble":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.MartyrTree
				};
		break;
		case "background.female_disowned_noble":
		return {
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.BowTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.ArchersTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.MartyrTree
				};
		break;
		case "background.legend_donkey":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.eunuch":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.MartyrTree
				};
		break;
		case "background.eunuch":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.MartyrTree
				};
		break;
		case "background.farmhand":
		return {
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.FlailTree,
			//gt.Const.Perks.PitchforkTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.fisherman":
		return {
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.female_fisherman":
		return {
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.DaggerTree,
			//gt.Const.Perks.ButcherCleaverTree
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.flagellant":
		return {
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.CleaverTree,
			//gt.Const.Perks.NinetailsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.gambler":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ThrowingTree,
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.gravedigger":
		return {
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.HammerTree,
			//gt.Const.Perks.ShovelTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.graverobber":
		return {
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.CleaverTree,
			//gt.Const.Perks.ShovelTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.hedge_knight":
		return {
			gt.Const.Perks.GreatSwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.legend_herbalist":
		return {
			gt.Const.Perks.SwordTree,
			//gt.Const.Perks.SickleTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MysticTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.HealerClassTree
				};
		break;
		case "background.historian":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.houndmaster":
		return {
			//gt.Const.Perks.BeastMasterTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.female_servant":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.LightArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.hunter":
		return {
			gt.Const.Perks.BowTree,
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.BeastsTree
				};
		break;
		case "background.legend_inventor":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.RepairClassTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.HelmetTree
				};
		break;
		case "background.legend_ironmonger":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.SwordsTree,
			//gt.Const.Perks.BlacksmithHammerTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.RepairClassTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.juggler":
		return {
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.TrainedTree
				};
		break;
		case "background.lumberjack":
		return {
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.WoodsmanAxeTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.mason":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.mason":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.FitTree
				};
		break;


		default:
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.FastTree
				};
	}
	return null;
};
