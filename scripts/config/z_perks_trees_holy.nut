local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local HolyTree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Adrenalin,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.Student
	],
	[
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.Gifted

	],
	[	
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.ShieldExpert,
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Relentless,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.LegendMedPackages,
		gt.Const.Perks.PerkDefs.Taunt
	],
	[
		gt.Const.Perks.PerkDefs.MasteryMace,
		gt.Const.Perks.PerkDefs.MasteryFlail,
		gt.Const.Perks.PerkDefs.MasteryHammer,
		gt.Const.Perks.PerkDefs.LegendMasteryBandage,
		gt.Const.Perks.PerkDefs.MasteryCrossbow,
		gt.Const.Perks.PerkDefs.MasteryThrowing

	],
	[
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.ReachAdvantage,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.LegendMedIngredients,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyAlps,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyVampire
	],
	[
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.BattleForged,
		gt.Const.Perks.PerkDefs.LegendRelax
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Indomitable,
		gt.Const.Perks.PerkDefs.LegendFieldTriage
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeHoly <- [];
gt.Const.Perks.TreeHolyLookupMap <- {};

for( local row = 0; row < HolyTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < HolyTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[HolyTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeHolyLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeHoly.push(rowL);
}
