
this.Const.Perks.getDefaultPerks <- function ( _background )
{

	switch ( _background )
	{
		case "background.adventurous_noble":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.InspirationalTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.ViciousTree,
		];
		break;
		case "background.female_adventurous_noble":
		return [
			this.Const.Perks.BowTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ArchersTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.InspirationalTree,
			];
		break;
		case "background.apprentice":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.assassin":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.TrainedTree
			];
		break;
		case "background.female_miller":
		return [
			this.Const.Perks.CleaverTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.LightArmorTree,
			//this.Const.Perks.ChefTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.SturdyTree
			];
		break;
		case "background.barbarian":
		return [
			this.Const.Perks.GreatSwordTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.MartyrTree,
			this.Const.Perks.CivilizationTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.bastard":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.beast_slayer":
		return [
			this.Const.Perks.GreatSwordTree,
			this.Const.Perks.ThrowingTree,
			//this.Const.Perks.BeastMasterTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.BeastsTree,
			this.Const.Perks.MysticTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.beggar":
		return [
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.AgileTree
			];
		break;
		case "background.legend_blacksmith":
		return [
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.HammerClassTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.RepairClassTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
			];
		break;
		case "background.bowyer":
		return [
			this.Const.Perks.BowTree,
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.female_bowyer":
		return [
			this.Const.Perks.BowTree,
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.brawler":
		return [
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.IndestructibleTree
			];
		break;
		case "background.butcher":
		return [
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ButcherClassTree,
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.LargeTree
			];
		break;
		case "background.legend_cannibal":
		return [
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.SwordsTree,
			gt.Const.Perks.ButcherClassTree,
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.MartyrTree
			];
		break;
		case "background.caravan_hand":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.OutlandersTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.cripple":
		return [
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.IndestructibleTree
			];
		break;
		case "background.cultist":
		return [
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.NinetailsClassTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.IndestructibleTree
			];
		break;
		case "background.daytayler":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree
			];
		break;
		case "background.daytayler":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree
			];
		break;
		case "background.deserter":
		return [
			this.Const.Perks.SpearTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.DeviousTree
			];
		break;
		case "background.disowned_noble":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.MartyrTree
			];
		break;
		case "background.female_disowned_noble":
		return [
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.BowTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.ArchersTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.MartyrTree
			];
		break;
		case "background.legend_donkey":
		return [
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
			];
		break;
		case "background.eunuch":
		return [
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.BarterClassTree
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.MartyrTree
			];
		break;
		case "background.farmhand":
		return [
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.PitchforkClassTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.SturdyTree
			];
		break;
		case "background.fisherman":
		return [
			this.Const.Perks.PolearmTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.SpearTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.female_fisherman":
		return [
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ButcherClassTree,
			gt.Const.Perks.MediumArmorTree,
			//gt.Const.Perks.ChefTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.LargeTree
			];
		break;
		case "background.flagellant":
		return [
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.NinetailsClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.SturdyTree
			];
		break;
		case "background.gambler":
		return [
			gt.Const.Perks.DaggerTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree
			];
		break;
		case "background.gravedigger":
		return [
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.ShovelClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.SturdyTree
			];
		break;
		case "background.graverobber":
		return [
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.CleaverTree,
			gt.Const.Perks.ShovelClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.DeviousTree
			];
		break;
		case "background.hedge_knight":
		return [
			this.Const.Perks.GreatSwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.SwordmasterTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.legend_herbalist":
		return [
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.SickleClassTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MysticTree,
			gt.Const.Perks.IntelligentTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.HealerClassTree
			];
		break;
		case "background.historian":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.houndmaster":
		return [
			//this.Const.Perks.BeastMasterTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.female_servant":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.LightArmorTree,
			//this.Const.Perks.ChefTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.hunter":
		return [
			this.Const.Perks.BowTree,
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.BeastsTree
			];
		break;
		case "background.legend_inventor":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.RepairClassTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.HelmetTree
			];
		break;
		case "background.legend_ironmonger":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.SwordsTree,
			this.Const.Perks.HammerClassTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.RepairClassTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.juggler":
		return [
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.SlingsTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.TrainedTree
			];
		break;
		case "background.killer_on_the_run":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.CivilizationTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.lumberjack":
		return [
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.WoodaxeClassTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FitTree
			];
		break;
		case "background.mason":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.messenger":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.militia":
		return [
			gt.Const.Perks.SpearTree,
			gt.Const.Perks.ShieldTree,
			gt.Const.Perks.MilitiaClassTree,
			gt.Const.Perks.HeavyArmorTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.TrainedTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.IndestructibleTree
			];
		break;
		case "background.female_farmhand":
		return [
			gt.Const.Perks.PolearmTree,
			gt.Const.Perks.FlailTree,
			gt.Const.Perks.PitchforkClassTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree,
			gt.Const.Perks.SturdyTree
			];
		break;
		case "background.miller":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.SturdyTree
			];
		break;
		case "background.miner":
		return [
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.PickaxeClassTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.SturdyTree
			];
		break;
		case "background.minstrel":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.BardTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.InspirationalTree
			];
		break;
		case "background.monk":
		return [
			this.Const.Perks.FlailTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.UndeadTree,
			this.Const.Perks.HealerClassTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.InspirationalTree
			];
		break;
		case "background.legend_noble_ranged":
		return [
			this.Const.Perks.SlingsTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.ViciousTree
			];
		break;
		case "background.legend_noble_shield":
		return [
			this.Const.Perks.SpearTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.IndestructibleTree
			];
		break;
		case "background.legend_noble_2h":
		return [
			this.Const.Perks.GreatSwordTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.legend_nun":
		return [
			this.Const.Perks.FlailTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.UndeadTree,
			this.Const.Perks.HealerClassTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.InspirationalTree
			];
		break;
		case "background.legend_orc_slayer":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.OrcsTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.peddler":
		return [
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OutlandersTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.BarterClassTree,
			gt.Const.Perks.DeviousTree
			];
		break;
		case "background.female_thief":
		return [
			gt.Const.Perks.KnifeClassTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.DeviousTree
			];
		break;
		case "background.pimp":
		return [
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.ThrowingTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.OrganisedTree,
			gt.Const.Perks.CivilisationTree,
			gt.Const.Perks.DeviousTree
			];
		break;
		case "background.poacher":
		return [
			gt.Const.Perks.BowTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.ShortbowClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.BeastsTree,
			gt.Const.Perks.AgileTree
			];
		break;
		case "background.raider":
		return [
			this.Const.Perks.AxeTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.GreatswordTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.CivilizationTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.ViciousTree
			];
		break;
		case "background.rat_catcher":
		return [
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.SlingsTree,
			//this.Const.Perks.BeastMasterTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.refugee":
		return [
			gt.Const.Perks.StavesTree,
			gt.Const.Perks.SlingsTree,
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.MartyrTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.FastTree,
			gt.Const.Perks.AgileTree
			];
		break;
		case "background.retired_soldier":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.InspirationalTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.female_tailor":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.SpearTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.RepairTree
			];
		break;
		case "background.retired_soldier":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.OutlandersTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.servant":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.LightArmorTree,
			//this.Const.Perks.ChefTree,
			this.Const.Perks.TraderTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.sellsword":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.OutlanderTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.shepard":
		return [
			this.Const.Perks.SlingsTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.BeastsTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.legend_shieldmaiden":
		return [
			this.Const.Perks.SpearTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.squire":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.squire":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.swordmaster":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.GreatswordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.SwordmasterTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.ViciousTree
			];
		break;
		case "background.tailor":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.SpearTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.RepairTree
			];
		break;
		case "background.legend_taxidermist":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.BeastsTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.ViciousTree
			];
		break;
		case "background.thief":
		return [
			gt.Const.Perks.KnifeClassTree,
			gt.Const.Perks.SwordTree,
			gt.Const.Perks.DaggersTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.ViciousTree,
			gt.Const.Perks.AgileTree,
			gt.Const.Perks.CivilizationTree,
			gt.Const.Perks.DeviousTree
			];
		break;
		case "background.female_minstrel":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.BardTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.InspirationalTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.vagabond":
		return [
			this.Const.Perks.HammerTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.AgileTree
			];
		break;
		case "background.female_daytayler":
		return [
			gt.Const.Perks.HammerTree,
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.MediumArmorTree,
			gt.Const.Perks.FitTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.IndestructibleTree
			];
		break;
		case "background.wildman":
		return [
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.LargeTree,
			gt.Const.Perks.FitTree
			];
		break;
		case "background.wildwoman":
		return [
			gt.Const.Perks.MaceTree,
			gt.Const.Perks.FistsClassTree,
			gt.Const.Perks.AxeTree,
			gt.Const.Perks.LightArmorTree,
			gt.Const.Perks.OrcsTree,
			gt.Const.Perks.SturdyTree,
			gt.Const.Perks.DeviousTree,
			gt.Const.Perks.FitTree
			];
		break;
		case "background.witchhunter":
		return [
			this.Const.Perks.CrossbowTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.UndeadTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.MysticTree
			];
		break;


		default:
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.FastTree
			];
	}
	return null;
};
