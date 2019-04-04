local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local SeerWeakTree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.CripplingStrikes, 
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.LegendSummonCat,
		gt.Const.Perks.PerkDefs.LegendDaze
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.LegendStun
	],
	[
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.LegendHorrify
	],
	[
		gt.Const.Perks.PerkDefs.MasteryDagger,
		gt.Const.Perks.PerkDefs.MasteryThrowing,
		gt.Const.Perks.PerkDefs.LegendMasteryStaves,
		gt.Const.Perks.PerkDefs.LegendValaInscriptionMastery,
		gt.Const.Perks.PerkDefs.LegendEntice,
		gt.Const.Perks.PerkDefs.LegendPush
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendChainLightning
	],
	[
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendRelax,
		gt.Const.Perks.PerkDefs.Rebound,
		gt.Const.Perks.PerkDefs.Ballistics
		gt.Const.Perks.PerkDefs.LegendLevitate,
		gt.Const.Perks.PerkDefs.LegendScry
	],
	[
		gt.Const.Perks.PerkDefs.BattleFlow,
		gt.Const.Perks.PerkDefs.LegendPerfectFocus,
		gt.Const.Perks.PerkDefs.LegendSleep,
		gt.Const.Perks.PerkDefs.LegendTeleport,
		gt.Const.Perks.PerkDefs.LegendFireField
		
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeSeerWeak <- [];
gt.Const.Perks.TreeSeerWeakLookupMap <- {};

for( local row = 0; row < SeerWeakTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < SeerWeakTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[SeerWeakTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeSeerWeakLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeSeerWeak.push(rowL);
}
