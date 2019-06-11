local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


local Tree = [
	[
		gt.Const.Perks.PerkDefs.LegendValaWarden,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.Student,
		gt.Const.Perks.PerkDefs.LegendValaInscribeShield,
		gt.Const.Perks.PerkDefs.LegendRoster1
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaTranceMalevolent,
		gt.Const.Perks.PerkDefs.FastAdaptation,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.LegendRoster2
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantSenses,
		gt.Const.Perks.PerkDefs.LegendValaPremonition,
		gt.Const.Perks.PerkDefs.BackStabber,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.LegendValaInscribeHelmet,
		gt.Const.Perks.PerkDefs.LegendRoster3
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantMastery,
		gt.Const.Perks.PerkDefs.LegendValaTranceMastery,
		gt.Const.Perks.PerkDefs.LegendValaInscriptionMastery
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantDisharmony,
		gt.Const.Perks.PerkDefs.LegendValaInscribeArmor,
		gt.Const.Perks.PerkDefs.LegendRoster4
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaThreads,
		gt.Const.Perks.PerkDefs.LegendValaSpiritualBond,
		gt.Const.Perks.PerkDefs.LegendRoster5
	],
	[
		gt.Const.Perks.PerkDefs.LegendValaChantFury,
		gt.Const.Perks.PerkDefs.LegendValaInscribeWeapon,
		gt.Const.Perks.PerkDefs.LegendRoster6
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeVala <- gt.Const.Perks.BuildCustomPerkTree(Tree)