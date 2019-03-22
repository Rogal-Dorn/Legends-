local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


local ValaTree = [
	[
		gt.Const.Perks.PerkDefs.LegendValaWarden,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover
	],
	[
		gt.Const.Perks.PerkDefs.VazlInscribeWeapon,
		gt.Const.Perks.PerkDefs.VazlInscribeHelmet,
		gt.Const.Perks.PerkDefs.VazlInscribeArmor,
		gt.Const.Perks.PerkDefs.VazlInscribeShield
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaThreads,
		gt.Const.Perks.PerkDefs.LegendValaPremonition
	],
	[
		gt.Const.Perks.PerkDefs.VazlInscribeMastery,
		gt.Const.Perks.PerkDefs.LegendValaChantMastery,
		gt.Const.Perks.PerkDefs.LegendValaTranceMastery
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantDisharmony
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaSpiritualBond
	],
	[
		gt.Const.Perks.PerkDefs.Indomitable
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
