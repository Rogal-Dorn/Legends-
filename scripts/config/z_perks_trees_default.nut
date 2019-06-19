
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
		case "background.killer_on_the_run":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.FastTree
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
		case "background.messenger":
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
		case "background.militia":
		return {
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.MilitiaSpearTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.female_farmhand":
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
		case "background.miller":
		return {
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.miner":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree
				};
		break;
		case "background.minstrel":
		return {
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.BardTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.InspirationalTree
				};
		break;
		case "background.monk":
		return {
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.UndeadTree,
			gt.Const.Perks.HealerClassTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.InspirationalTree
				};
		break;
		case "background.legend_noble_ranged":
		return {
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.ViciousTree
				};
		break;
		case "background.legend_noble_shield":
		return {
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.legend_noble_2h":
		return {
			gt.Const.Perks.GreatSwordTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.legend_nun":
		return {
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.UndeadTree,
			gt.Const.Perks.HealerClassTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.InspirationalTree
				};
		break;
		case "background.legend_orc_slayer":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.peddler":
		return {
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.OrganisedTree,
			//gt.Const.Perks.TraderTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.female_thief":
		return {
			//gt.Const.Perks.KnifeTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.pimp":
		return {
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.CivilisationTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.poacher":
		return {
			gt.Const.Perks.BowTree,
			gt.Const.Perks.SlingsTree,
			//gt.Const.Perks.ShortbowTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.BeastsTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.raider":
		return {
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.GreatswordTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.ViciousTree
				};
		break;
		case "background.rat_catcher":
		return {
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.SlingsTree,
			//gt.Const.Perks.BeastMasterTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.refugee":
		return {
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.SlingsTree,
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.retired_soldier":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.InspirationalTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.female_tailor":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.RepairTree
				};
		break;
		case "background.retired_soldier":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.servant":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.LightArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.TraderTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.servant":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.OutlanderTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.sellsword":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.OutlanderTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.LargeTree
				};
		break;
		case "background.shepard":
		return {
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.BeastsTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.legend_shieldmaiden":
		return {
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.squire":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.squire":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.FastTree
				};
		break;
		case "background.swordmaster":
		return {
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.GreatswordTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.SwordmasterTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.ViciousTree
				};
		break;
		case "background.tailor":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.RepairTree
				};
		break;
		case "background.legend_taxidermist":
		return {
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.BeastsTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.ViciousTree
				};
		break;
		case "background.thief":
		return {
			//gt.Const.Perks.KnifeTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.DeviousTree
				};
		break;
		case "background.female_minstrel":
		return {
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.BardTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.InspirationalTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.vagabond":
		return {
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.AgileTree
				};
		break;
		case "background.female_daytayler":
		return {
			gt.Const.Perks.HammerTree,
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree
				};
		break;
		case "background.wildman":
		return {
			gt.Const.Perks.MaceTree,
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.wildman":
		return {
			gt.Const.Perks.MaceTree,
			//gt.Const.Perks.FistTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.FitTree
				};
		break;
		case "background.witchhunter":
		return {
			gt.Const.Perks.CrossbowTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.UndeadTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IntelligentTree
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
