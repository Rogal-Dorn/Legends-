local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local DeserterTree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.CripplingStrikes,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Adrenalin,
		gt.Const.Perks.PerkDefs.Recover
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.LegendComposure

	],
	[
		gt.Const.Perks.PerkDefs.BackStabber,	
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.ShieldExpert,
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Relentless,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt
		
	],
	[
		gt.Const.Perks.PerkDefs.MasteryMace,
		gt.Const.Perks.PerkDefs.MasteryFlail,
		gt.Const.Perks.PerkDefs.MasteryHammer,
		gt.Const.Perks.PerkDefs.MasteryAxe,
		gt.Const.Perks.PerkDefs.MasteryCleaver,
		gt.Const.Perks.PerkDefs.MasterySword,
		gt.Const.Perks.PerkDefs.MasteryPolearm,
		gt.Const.Perks.PerkDefs.MasterySpear,
		gt.Const.Perks.PerkDefs.MasteryCrossbow,
		gt.Const.Perks.PerkDefs.MasteryBow,
		gt.Const.Perks.PerkDefs.MasteryThrowing

	],
	[
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.ReachAdvantage,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.Steadfast

	],
	[
		gt.Const.Perks.PerkDefs.HeadHunter,
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.BattleForged,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyMercenary,
		gt.Const.Perks.PerkDefs.SunderingStrike
		
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
		gt.Const.Perks.PerkDefs.Indomitable
		
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeDeserter <- [];
gt.Const.Perks.TreeDeserterLookupMap <- {};

for( local row = 0; row < DeserterTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < DeserterTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[DeserterTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeDeserterLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeDeserter.push(rowL);
}
