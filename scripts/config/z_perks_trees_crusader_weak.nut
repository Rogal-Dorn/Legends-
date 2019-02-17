local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


local CrusaderWeakTree = [
	[
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.CripplingStrikes,
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
	],
	[
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.ShieldExpert,
		gt.Const.Perks.PerkDefs.Rebound,
	],
	[
		gt.Const.Perks.PerkDefs.MasteryMace,
		gt.Const.Perks.PerkDefs.MasteryFlail,
		gt.Const.Perks.PerkDefs.MasteryHammer,
		gt.Const.Perks.PerkDefs.MasterySword,
		gt.Const.Perks.PerkDefs.MasteryPolearm,
		gt.Const.Perks.PerkDefs.MasteryAxe,
	],
	[
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.FullForce,
		gt.Const.Perks.PerkDefs.ReturnFavor
	],
	[
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.BattleForged,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.Steadfast,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.SunderingStrike
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.Stalwart,
		gt.Const.Perks.PerkDefs.BattleFlow,
		gt.Const.Perks.PerkDefs.InspiringPresence,
		gt.Const.Perks.PerkDefs.LegendPerfectFocus
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeCrusaderWeak <- [];
gt.Const.Perks.TreeCrusaderWeakLookupMap <- {};

for( local row = 0; row < CrusaderWeakTree.len(); row = ++row )
{
	local rowL = [];
	for( local i = 0; i < CrusaderWeakTree[row].len(); i = ++i )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[CrusaderWeakTree[row][i]];
		perk.Row <- row;
		perk.Unlocks <- row;
		rowL.push(perk);
		gt.Const.Perks.TreeCrusaderWeakLookupMap[perk.ID] <- perk;
	}
	gt.Const.Perks.PerksTreeCrusaderWeak.push(rowL);
}
