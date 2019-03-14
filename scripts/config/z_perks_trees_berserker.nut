local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local BerserkerTree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.CripplingStrikes,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Steadfast,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.BloodyHarvest,
		gt.Const.Perks.PerkDefs.LegendRoster1
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.LegendComposure,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.DevastatingStrikes
		
	],
	[
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.Debilitate,
		gt.Const.Perks.PerkDefs.LegendTrueBeliever,
		gt.Const.Perks.PerkDefs.Sprint,
		gt.Const.Perks.PerkDefs.LegendRoster2
	],
	[
		gt.Const.Perks.PerkDefs.MasteryMace,
		gt.Const.Perks.PerkDefs.MasteryFlail,
		gt.Const.Perks.PerkDefs.MasteryHammer,
		gt.Const.Perks.PerkDefs.MasteryAxe,
		gt.Const.Perks.PerkDefs.MasteryCleaver,
		gt.Const.Perks.PerkDefs.MasterySword,
		gt.Const.Perks.PerkDefs.LegendPoisonImmunity,
		gt.Const.Perks.PerkDefs.MasteryThrowing
		
	],
	[
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.Slaughter,
		gt.Const.Perks.PerkDefs.Vengeance,
		gt.Const.Perks.PerkDefs.LegendBattleheart,
		gt.Const.Perks.PerkDefs.SunderingStrike,
		gt.Const.Perks.PerkDefs.LegendRoster3
	],
	[
		// This hard crashes the game // gt.Const.Perks.PerkDefs.Ironside,
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.ReturnFavor,
		gt.Const.Perks.PerkDefs.LastStand,
		gt.Const.Perks.PerkDefs.Rebound,
		gt.Const.Perks.PerkDefs.LegendMuscularity,
		gt.Const.Perks.PerkDefs.LegendPushForward,
		gt.Const.Perks.PerkDefs.LegendRoster4
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.BattleFlow,
		gt.Const.Perks.PerkDefs.Stalwart,
		gt.Const.Perks.PerkDefs.LegendBerserkerRage,
		gt.Const.Perks.PerkDefs.LegendUberNimble,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeBerserker <- [];
gt.Const.Perks.TreeBerserkerLookupMap <- {};

for( local row = 0; row < BerserkerTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < BerserkerTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[BerserkerTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeBerserkerLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeBerserker.push(rowL);
}