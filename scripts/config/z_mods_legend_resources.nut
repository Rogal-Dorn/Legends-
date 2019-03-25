local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.MaxResources <- [
	{
		Food = 300,
		Ammo = 30,
		Medicine = 20,
		ArmorParts = 20,
		Stash = 60
	},
	{
		Food = 250,
		Ammo = 20,
		Medicine = 10,
		ArmorParts = 10,
		Stash = 30
	},
	{
		Food = 200,
		Ammo = 10,
		Medicine = 5,
		ArmorParts = 5,
		Stash = 15
	},
	{
		Food = 50,
		Ammo =  0,
		Medicine = 0,
		ArmorParts = 0,
		Stash = 5
	}
]

gt.Const.LegendMod.StartResources <- [
	{
		Money = 750,
		Ammo = 15,
		Medicine = 10,
		ArmorParts = 10
	},
	{
		Money = 500,
		Ammo = 10,
		Medicine = 5,
		ArmorParts = 5
	},
	{
		Money = 250,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	},
	{
		Money = 0,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	}
]

gt.Const.LegendMod.getMaxAmmo <- function ( _background )
{
	switch ( _background )
	{
		case "background.peddler":
			return 10;
			break;
		case "background.poacher":
		case "background.hunter":
		case "background.legend_commander_noble":
		case "background.legend_noble":
			return 15;
			break;
		case "background.bowyer":
		case "background.legend_commander_ranger":
		case "background.legend_ranger":
			return 30;
			break;
		case "background.legend_donkey":
		case "background.female_bowyer":
			return 50;
			break;

		default:
			return 5;
	}
	return 0;
};

gt.Const.LegendMod.getMaxArmorParts <- function ( _background )
{
	switch ( _background )
	{
		case "background.tailor":
		case "background.female_tailor":
		case "background.peddler":
		case "background.legend_berserker":
		case "background.legend_noble":
			return 5;
			break;

		case "background.legend_commander_noble":
		case "background.legend_commander_berserker":
		case "background.legend_crusader":
		case "background.squire":
			return 10;
			break;
		case "background.apprentice":
		case "background.legend_commander_crusader":
		case "background.vazl_inventor":
			return 15;
			break;
		case "background.legend_ironmonger":
		case "background.legend_blacksmith":
			return 20;
			break;
		case "background.legend_donkey":
			return 30;
			break;
		default:
			return 2;
	}
	return 0;
};

gt.Const.LegendMod.getMaxMedicine <- function ( _background )
{
	switch ( _background )
	{
		case "background.peddler":
		case "background.servant":
		case "background.female_servant":
			return 5;
			break;

		case "background.legend_commander_noble":
		case "background.legend_noble":
		case "background.legend_commander_witch":
		case "background.legend_witch":
		case "background.butcher":
		case "background.female_butcher":
		case "background.legend_taxidermist":
			return 10;
			break;
		case "background.monk":
		case "background.legend_nun":
		case "background.vazl_vala":
			return 15;
			break;
		case "background.legend_donkey":
			return 30;
			break;
		case "background.legend_commander_necro":
		case "background.legend_necro":
			return 42;
			return 15

		default:
			return 5;
	}
	return 0;
};

gt.Const.LegendMod.getMaxStash <- function ( _background )
{
	switch ( _background )
	{
		case "background.vazl_inventor":
		case "background.legend_commander_crusader":
		case "background.legend_noble":
		case "background.mason":
		case "background.miner":
		case "background.lumberjack":
		case "background.legend_blacksmith":
		case "background.legend_ironmonger":
			return 5;
			break;
		case "background.daytaler":
		case "background.peddler":
		case "background.legend_commander_noble":
			return 10;
			break;
		case "background.caravan_hand":
			return 15;
			break;
		case "background.legend_donkey":
			return 30;
			break;
		case "background.legend_commander_ranger":
		case "background.legend_ranger":
		case "background.legend_crusader":
		case "background.legend_berserker":
		case "background.legend_commander_berserker":
		case "background.female_daytaler":
		case "background.farmhand":
		case "background.female_farmhand":
		case "background.brawler":
		case "backgcripplround.wildman":
		case "background.shepard":
		case "background.refugee":
		case "background.servant":
		case "background.eunuch":
		case "background.miller":
		case "background.fisherman":
		case "background.female_servant":
		case "background.gravedigger":
		case "background.squire":
		case "background.thief":
		case "background.vagabond":
			return 3;
			break;
		

		default:
			return 1;
	}
	return 0;
};

gt.Const.LegendMod.getHealingModifier <- function ( _background )
{
		switch ( _background )
	{

		case "background.female_beggar":
		case "background.cripple":
		case "background.flagellant":
			return 0.05;
			break;

		case "background.legend_commander_noble":
		case "background.legend_noble":
		case "background.servant":
		case "background.eunuch":
		case "background.female_servant":
			return 0.1;
			break;

		case "background.legend_witch":
		case "background.legend_necro":
		case "background.legend_herbalist":
			return 0.2;
			break;
		case "background.legend_commander_witch":
		case "background.legend_commander_necro":
			return 0.3;
			break;
		case "background.monk":
		case "background.legend_nun":
		case "background.vazl_vala":
			return 0.5;
			break;

		default:
			return 0.0;
	}
	return 0.0;
}

//Med units / hour in the healing tent
// = BasePoints + BasePoints * Modifier
gt.Const.LegendMod.getInjuryModifier <- function ( _background )
{
		switch ( _background )
	{

		case "background.female_beggar":
		case "background.cripple":
		case "background.flagellant":
		case "background.servant":
		case "background.eunuch":
		case "background.female_servant":
			return 0.25;
			break;

		case "background.legend_witch":
		case "background.legend_necro":
		case "background.legend_herbalist":
		case "background.legend_commander_witch":
		case "background.legend_commander_necro":
			return 0.5;
			break;
		case "background.monk":
		case "background.legend_nun":
		case "background.vazl_vala":
			return 1.0;
			break;

		default:
			return 0.0;
	}
	return 0.0;
}

gt.Const.LegendMod.getRepairModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.servant":
		case "background.eunuch":
		case "background.female_servant":
		return 0.05;
			 break;
		case "background.legend_crusader":
			return 0.25;
			 break;
		case "background.legend_ironmonger":
		case "background.tailor":
		case "background.female_tailor":
			return 0.5;
			break;
		case "background.legend_blacksmith":
		case "background.vazl_inventor":
			return 1.0;
			break;

		default:
			return 0.0;
	}
	return 0.0;
};

gt.Const.LegendMod.getSalvageModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.legend_ironmonger":
		case "background.tailor":
		case "background.female_tailor":
			return 0.5;
			break;
		case "background.legend_blacksmith":
		case "background.vazl_inventor":
			return 1.0;
			break;

		default:
			return 0.0;
	}
	return 0.0;
};

gt.Const.LegendMod.getCraftingModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.legend_ironmonger":
		case "background.tailor":
		case "background.female_tailor":
			return 0.5;
			break;
		case "background.legend_blacksmith":
		case "background.vazl_inventor":
			return 0.75;
			break;
		case "background.legend_taxidermist":
			return 1.0;
			break;

		default:
			return 0.0;
	}
	return 0.0;
};

gt.Const.LegendMod.getBarterModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.legend_commander_noble":
		case "background.legend_noble":
		case "background.minstrel":
		case "background.female_minstrel":
		case "background.thief":
		
			return 0.025
			break;
		case "background.female_thief":
		case "background.peddler":

			return 0.05;
			break;
		case "background.legend_commander_trader":
			return 0.20;
			break;
		default:
			return 0.0;
	}
	return 0.0;
};

gt.Const.LegendMod.getToolConsumptionModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.mason":
		case "background.tailor":
		case "background.female_tailor":
			return 0.05;
			break;

		case "background.legend_commander_noble":
		case "background.legend_crusader":
			return 0.05;
			break;
		case "background.legend_commander_crusader":
		case "background.legend_ironmonger":
			return 0.10;
			break;
		case "background.legend_blacksmith":
			return 0.20;
			break;

		default:
			return 0.0;
	}
	return 0.0;
};

gt.Const.LegendMod.getMedsConsumptionModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.wildman":
		case "background.female_beggar":
			return 0.05;
			break;
		case "background.monk":
		case "background.legend_nun":
			return 0.1;
			break;
		case "background.legend_necro":
			return 0.2;
			break;
		case "background.legend_commander_necro":
		case "background.legend_witch":
			return 0.25;
			break;
	case "background.legend_taxidermist":
			return 0.35;
			break;
		case "background.legend_commander_witch":
		case "background.legend_herbalist":
			return 0.5;
			break;
		default:
			return 0.0;
	}
	return 0.0;
};

// gt.Const.World.TerrainTypeSpeedMult <- [
// 	0.0,
// 	0.0,
// 	1.0,
// 	0.5,
// 	0.64,
// 	0.64,
// 	0.64,
// 	0.64,
// 	0.64,
// 	0.25,
// 	0.5,
// 	1.0,
// 	0.75,
// 	0.9,
// 	0.9,
// 	1.0,
// 	0.5
// ];

//These will add to the base TerrainTypeSpeedMult 
gt.Const.LegendMod.getTerrainSpeedModifier <- function ( _background )
{
	switch ( _background )
	{
		case "background.messenger":
			return [
				0.0, // ?
				0.0, //ocean
				0.05,//plains
				0.01, //swamp
				0.01, //hills
				0.01, //forest
				0.01, //forest
				0.01, //forest_leaves
				0.01, //autumn_forest
				0.01, //mountains
				0.0, // ?
				0.05, //farmland
				0.01, // snow
				0.01, // badlands
				0.01, //highlands
				0.05, //stepps
				0.0 //ocean
			];
			break;
		case "background.vagabond":
			return [
				0.0, // ?
				0.0, //ocean
				0.01,//plains
				0.0, //swamp
				0.0, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.01, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.01, //stepps
				0.0 //ocean
			];
			break;			
		case "background.caravan_hand":
		case "background.legend_commander_noble":
		case "background.legend_noble":
			return [
				0.0, // ?
				0.0, //ocean
				0.025,//plains
				0.01, //swamp
				0.01, //hills
				0.01, //forest
				0.01, //forest
				0.01, //forest_leaves
				0.01, //autumn_forest
				0.01, //mountains
				0.0, // ?
				0.025, //farmland
				0.011, // snow
				0.015, // badlands
				0.015, //highlands
				0.025, //stepps
				0.0 //ocean
			];
			break;		
		case "background.beast_hunter":
		case "background.orc_slayer":
			return [
				0.0, // ?
				0.0, //ocean
				0.00,//plains
				0.025, //swamp
				0.0, //hills
				0.025, //forest
				0.025, //forest
				0.025, //forest_leaves
				0.025, //autumn_forest
				0.01, //mountains
				0.0, // ?
				0.00, //farmland
				0.015, // snow
				0.015, // badlands
				0.015, //highlands
				0.0, //stepps
				0.0 //ocean
			];
			break;
		case "background.farmhand":
		case "background.female_farmhand":
			return [
				0.0, // ?
				0.0, //ocean
				0.00,//plains
				0.0, //swamp
				0.0, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.025, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.0, //stepps
				0.0 //ocean
			];
			break;
		case "background.poacher":
		case "background.hunter":
		case "background.legend_herbalist":
		case "background.legend_commander_ranger":
		case "background.legend_ranger":
			return [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.0, //swamp
				0.0, //hills
				0.05, //forest
				0.05, //forest
				0.05, //forest_leaves
				0.05, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.0, //farmland
				0.01, // snow
				0.01, // badlands
				0.01, //highlands
				0.0, //stepps
				0.0 //ocean
			];
			break;
		case "background.lumberjack":		
			return [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.0, //swamp
				0.0, //hills
				0.05, //forest
				0.05, //forest
				0.05, //forest_leaves
				0.05, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.0, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.0, //stepps
				0.0 //ocean
			];
			break;
		case "background.miner":
			return [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.0, //swamp
				0.1, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.075, //mountains
				0.0, // ?
				0.0, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.0, //stepps
				0.0 //ocean
			];
			break;
		case "background.wildman":
		case "background.legend_berserker":
		case "background.legend_commander_berserker":
			return [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.025, //swamp
				0.025, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.025, //mountains
				0.0, // ?
				0.0, //farmland
				0.025, // snow
				0.025, // badlands
				0.025, //highlands
				0.0, //stepps
				0.0 //ocean
			];			
		case "background.witchhunter":
			return [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.025, //swamp
				0.0, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.0, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.0, //stepps
				0.0 //ocean
			];						
		default:
			return [
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0
			];
	}
	return null
};