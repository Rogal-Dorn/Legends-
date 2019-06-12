local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local Tree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaption,
		gt.Const.Perks.PerkDefs.CripplingStrikes, 
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.LegendSummonCat,
		gt.Const.Perks.PerkDefs.LegendDaze,
		gt.Const.Perks.PerkDefs.LegendRoster1
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.LegendStunned,
		gt.Const.Perks.PerkDefs.LegendRoster2
	],
	[
		gt.Const.Perks.PerkDefs.Backstabber,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.LegendHorrify,
		gt.Const.Perks.PerkDefs.LegendRoster3
	],
	[
		gt.Const.Perks.PerkDefs.SpecDagger,
		gt.Const.Perks.PerkDefs.SpecThrowing,
		gt.Const.Perks.PerkDefs.LegendMasteryStaves,
		gt.Const.Perks.PerkDefs.LegendEntice,
		gt.Const.Perks.PerkDefs.LegendPush,
		gt.Const.Perks.PerkDefs.LegendRoster4
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendChainLightning,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendRelax,
		gt.Const.Perks.PerkDefs.Rebound,
		gt.Const.Perks.PerkDefs.Ballistics,
		gt.Const.Perks.PerkDefs.LegendLevitate,
		gt.Const.Perks.PerkDefs.LegendScry
	],
	[
		gt.Const.Perks.PerkDefs.BattleFlow,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
		gt.Const.Perks.PerkDefs.PerfectFocus,
		gt.Const.Perks.PerkDefs.LegendSleep,
		gt.Const.Perks.PerkDefs.LegendTeacher,
		gt.Const.Perks.PerkDefs.LegendTeleport,
		gt.Const.Perks.PerkDefs.LegendFirefield,
		gt.Const.Perks.PerkDefs.LegendRoster6
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeSeer <- gt.Const.Perks.BuildCustomPerkTree(Tree)