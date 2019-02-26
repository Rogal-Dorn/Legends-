local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local NobleTree = [
	[
		gt.Const.Perks.PerkDefs.Adrenalin,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.BagsAndBelts

	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.LegendComposure

	],
	[
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.InspiringPresence

	],
	[
		gt.Const.Perks.PerkDefs.MasteryPolearm,
		gt.Const.Perks.PerkDefs.MasterySword,
		gt.Const.Perks.PerkDefs.LegendMasteryBandage,
		gt.Const.Perks.PerkDefs.LegendRoster4
	],
	[
		gt.Const.Perks.PerkDefs.ReachAdvantage,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[
		gt.Const.Perks.PerkDefs.BattleForged,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendHoldTheLine,
		gt.Const.Perks.PerkDefs.LegendPushForward,
		gt.Const.Perks.PerkDefs.CoordinatedVolleys,
		gt.Const.Perks.PerkDefs.LegendRoster6
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.Inspire,
		gt.Const.Perks.PerkDefs.LegendRelax,
		gt.Const.Perks.PerkDefs.LegendRoster7
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeNoble <- [];
gt.Const.Perks.TreeNobleLookupMap <- {};

for( local row = 0; row < NobleTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < NobleTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[NobleTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeNobleLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeNoble.push(rowL);
}