local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


local ValaTree = [
	[
		gt.Const.Perks.PerkDefs.LegendValaWarden,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.LegendValaInscribeShield,
		gt.Const.Perks.PerkDefs.LegendRoster1
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaTranceMalevolent,
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.LegendRoster3
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaPremonition,
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.LegendValaInscribeHelmet,
		gt.Const.Perks.PerkDefs.LegendRoster4
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantMastery,
		gt.Const.Perks.PerkDefs.LegendValaTranceMastery,
		gt.Const.Perks.PerkDefs.LegendValaInscriptionMastery
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantDisharmony,
		gt.Const.Perks.PerkDefs.LegendValaInscribeArmor,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaThreads,
		gt.Const.Perks.PerkDefs.LegendValaSpiritualBond,
		gt.Const.Perks.PerkDefs.LegendRoster6
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantFury,
		gt.Const.Perks.PerkDefs.LegendValaInscribeWeapon,
		gt.Const.Perks.PerkDefs.LegendRoster7
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeVala <- [];
gt.Const.Perks.TreeValaLookupMap <- {};

for( local row = 0; row < ValaTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < ValaTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[ValaTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeValaLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeVala.push(rowL);
}
