local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local BeggarTree = [
	[
		gt.Const.Perks.PerkDefs.Adrenalin,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.BagsAndBelts
	],
	[
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.LegendRoster2
	],
	[
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.LegendRoster3
	],
	[
		gt.Const.Perks.PerkDefs.MasteryDagger,
		gt.Const.Perks.PerkDefs.MasteryThrowing,
		gt.Const.Perks.PerkDefs.LegendRoster4,
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendRoster6
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.LegendRoster7
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerksTreeBeggar <- [];
gt.Const.Perks.TreeBeggarLookupMap <- {};

for( local row = 0; row < BeggarTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < BeggarTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[BeggarTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeBeggarLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeBeggar.push(rowL);
}
