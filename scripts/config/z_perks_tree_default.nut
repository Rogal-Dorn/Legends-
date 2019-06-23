
this.Const.Perks.getDefaultPerks <- function ( _background )
{

	switch ( _background )
	{
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
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.eunuch":
		return [
			this.Const.Perks.CleaverTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.SlingsTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.BarterClassTree
			this.Const.Perks.DeviousTree,
			this.Const.Perks.MartyrTree
			];
		break;
		case "background.farmhand":
		return [
			this.Const.Perks.PolearmTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.PitchforkClassTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.SturdyTree
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
			this.Const.Perks.CleaverTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.ButcherClassTree,
			this.Const.Perks.MediumArmorTree,
			//this.Const.Perks.ChefTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.LargeTree
			];
		break;
		case "background.flagellant":
		return [
			this.Const.Perks.FlailTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.NinetailsClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.MartyrTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.SturdyTree
			];
		break;
		case "background.gambler":
		return [
			this.Const.Perks.DaggerTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.gravedigger":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.ShovelClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.SturdyTree
			];
		break;
		case "background.graverobber":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.ShovelClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.DeviousTree
			];
		break;
		case "background.hedge_knight":
		return [
			this.Const.Perks.GreatSwordTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.legend_herbalist":
		return [
			this.Const.Perks.SwordTree,
			this.Const.Perks.SickleClassTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.MysticTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.HealerClassTree
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
			this.Const.Perks.AgileTree,
			this.Const.Perks.FastTree
			];
		break;
		case "background.lumberjack":
		return [
			this.Const.Perks.AxeTree,
			this.Const.Perks.PolearmTree,
			this.Const.Perks.WoodaxeClassTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FitTree
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
			this.Const.Perks.SpearTree,
			this.Const.Perks.ShieldTree,
			this.Const.Perks.MilitiaClassTree,
			this.Const.Perks.HeavyArmorTree,
			this.Const.Perks.OutlandersTree,
			this.Const.Perks.TrainedTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.IndestructibleTree
			];
		break;
		case "background.female_farmhand":
		return [
			this.Const.Perks.PolearmTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.PitchforkClassTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.SturdyTree
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
			this.Const.Perks.HammerTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.PickaxeClassTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.OrcsTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.SturdyTree
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
			this.Const.Perks.StavesTree,
			this.Const.Perks.SlingsTree,
			this.Const.Perks.DaggersTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.OutlandersTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.BarterClassTree,
			this.Const.Perks.DeviousTree
			];
		break;
		case "background.female_thief":
		return [
			this.Const.Perks.KnifeClassTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.DaggersTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.CivilizationTree,
			this.Const.Perks.DeviousTree
			];
		break;
		case "background.pimp":
		return [
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.StavesTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.CivilisationTree,
			this.Const.Perks.DeviousTree
			];
		break;
		case "background.poacher":
		return [
			this.Const.Perks.BowTree,
			this.Const.Perks.SlingsTree,
			this.Const.Perks.ShortbowClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.BeastsTree,
			this.Const.Perks.AgileTree
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
			this.Const.Perks.StavesTree,
			this.Const.Perks.SlingsTree,
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.MartyrTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.AgileTree
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
		case "background.servant":
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
			this.Const.Perks.KnifeClassTree,
			this.Const.Perks.SwordTree,
			this.Const.Perks.DaggersTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.AgileTree,
			this.Const.Perks.CivilizationTree,
			this.Const.Perks.DeviousTree
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
			this.Const.Perks.HammerTree,
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.IndestructibleTree
			];
		break;
		case "background.wildman":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.OrcsTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.FitTree
			];
		break;
		case "background.wildwoman":
		return [
			this.Const.Perks.MaceTree,
			this.Const.Perks.FistsClassTree,
			this.Const.Perks.AxeTree,
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.OrcsTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.FitTree
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
			this.Const.Perks.IntelligentTree
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
