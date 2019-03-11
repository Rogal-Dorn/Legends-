local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local DonkeyTree = [
	[
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Steadfast,
		gt.Const.Perks.PerkDefs.Recover
	],
	[
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.LegendComposure,
		gt.Const.Perks.PerkDefs.SteelBrow
	],
	[
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.Sprint
	],
	[
		gt.Const.Perks.PerkDefs.LegendEfficientPacking,
		gt.Const.Perks.PerkDefs.LegendAmmoBinding,
		gt.Const.Perks.PerkDefs.LegendMedPackages,
		gt.Const.Perks.PerkDefs.LegendtoolsDrawers
		
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendBattleheart,
	],
	[
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LastStand,
		gt.Const.Perks.PerkDefs.Rebound,
		gt.Const.Perks.PerkDefs.LegendMuscularity
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Stalwart,
		gt.Const.Perks.PerkDefs.LegendSkillfulStacking
		gt.Const.Perks.PerkDefs.LegendAmmoBundles,
		gt.Const.Perks.PerkDefs.LegendMedIngredients,
		gt.Const.Perks.PerkDefs.LegendtoolsSpares

	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeDonkey <- [];
gt.Const.Perks.TreeDonkeyLookupMap <- {};

for( local row = 0; row < DonkeyTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < DonkeyTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[DonkeyTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeDonkeyLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeDonkey.push(rowL);
}