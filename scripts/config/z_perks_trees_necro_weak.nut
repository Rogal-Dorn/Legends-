local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local NecroWeakTree = [
	[
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.LegendWither
	],
	[
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.LegendComposure,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.LegendRust
	],
	[
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.LegendDeathTouch,
		gt.Const.Perks.PerkDefs.Lookout
	],
	[
		gt.Const.Perks.PerkDefs.MasteryDagger,
		gt.Const.Perks.PerkDefs.MasteryMace,
		gt.Const.Perks.PerkDefs.MasteryThrowing,
		gt.Const.Perks.PerkDefs.MasteryPoison,
		gt.Const.Perks.PerkDefs.LegendRaiseUndead
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendPossessUndead
	],
	[
		gt.Const.Perks.PerkDefs.HeadHunter,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendMiasma,
		gt.Const.Perks.PerkDefs.LegendHex,
		gt.Const.Perks.PerkDefs.Rebound
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.LegendInsects,
		gt.Const.Perks.PerkDefs.LegendDarkflight,
		gt.Const.Perks.PerkDefs.LegendGruesomeFeast,
		gt.Const.Perks.PerkDefs.LegendPerfectFocus
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.PerksTreeNecromancerWeak <- [];
gt.Const.Perks.TreeNecromancerWeakLookupMap <- {};

for( local row = 0; row < NecroWeakTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < NecroWeakTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[NecroWeakTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeNecromancerWeakLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeNecromancerWeak.push(rowL);
}