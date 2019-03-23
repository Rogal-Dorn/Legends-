local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


local ValaTree = [
	[
		gt.Const.Perks.PerkDefs.LegendValaWarden,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.LegendValaInscribeShield
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaTranceMalevolent,
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.BackStabber
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaPremonition,
		gt.Const.Perks.PerkDefs.LegendValaInscribeHelmet
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantMastery,
		gt.Const.Perks.PerkDefs.LegendValaTranceMastery,
		gt.Const.Perks.PerkDefs.LegendValaInscriptionMastery
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantDisharmony,
		gt.Const.Perks.PerkDefs.LegendValaInscribeArmor
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaThreads,
		gt.Const.Perks.PerkDefs.LegendValaSpiritualBond
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaInscribeWeapon
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
