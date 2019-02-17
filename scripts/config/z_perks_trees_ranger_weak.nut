local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local RangerWeakTree = [
	[
		gt.Const.Perks.PerkDefs.CripplingStrikes,
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.Lookout,
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.Debilitate,
		gt.Const.Perks.PerkDefs.Sprint,
	],
	[
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.DoubleStrike,
		gt.Const.Perks.PerkDefs.DevastatingStrikes,
	],
	[
		gt.Const.Perks.PerkDefs.MasteryPoison,
		gt.Const.Perks.PerkDefs.MasteryBow,
		gt.Const.Perks.PerkDefs.MasteryCrossbow,
		gt.Const.Perks.PerkDefs.MasteryThrowing,
	],
	[
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.CloseCombatArcher,
		gt.Const.Perks.PerkDefs.Ballistics,
	],
	[
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.HeadHunter,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.Rebound,
		gt.Const.Perks.PerkDefs.LegendCascade,
	],
	[
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.LegendPerfectFocus,
		gt.Const.Perks.PerkDefs.BattleFlow,
		gt.Const.Perks.PerkDefs.LegendEvasion,
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerksTreeRangerWeak <- [];
gt.Const.Perks.TreeRangerWeakLookupMap <- {};

for( local row = 0; row < RangerWeakTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < RangerWeakTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[RangerWeakTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeRangerWeakLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeRangerWeak.push(rowL);
}