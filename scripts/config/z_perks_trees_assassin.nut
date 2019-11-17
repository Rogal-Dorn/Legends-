local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local Tree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaption,
		gt.Const.Perks.PerkDefs.CripplingStrikes,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.LegendBackToBasics,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Adrenalin,
		gt.Const.Perks.PerkDefs.Alert,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.LegendSpecialistKnifeSkill
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.Gifted,
		gt.Const.Perks.PerkDefs.LegendKick,
		gt.Const.Perks.PerkDefs.LegendPrepareBleed,
		gt.Const.Perks.PerkDefs.Sprint
	],
	[
		gt.Const.Perks.PerkDefs.Backstabber,	
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Relentless,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.Taunt,
		gt.Const.Perks.PerkDefs.LegendGrapple,
		gt.Const.Perks.PerkDefs.LegendSpecialistKnifeDamage
	],
	[
		gt.Const.Perks.PerkDefs.SpecCleaver,
		gt.Const.Perks.PerkDefs.SpecSword,
		gt.Const.Perks.PerkDefs.SpecDagger,
		gt.Const.Perks.PerkDefs.SpecCrossbow,
		gt.Const.Perks.PerkDefs.SpecBow,
		gt.Const.Perks.PerkDefs.SpecThrowing,
		gt.Const.Perks.PerkDefs.LegendSpecFists,
		gt.Const.Perks.PerkDefs.LegendEscapeArtist,
		gt.Const.Perks.PerkDefs.LegendPoisonImmunity,
		gt.Const.Perks.PerkDefs.LegendSpecPoison

	],
	[
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.Footwork,
		gt.Const.Perks.PerkDefs.PushTheAdvantage,
		gt.Const.Perks.PerkDefs.LegendSlaughter,
		gt.Const.Perks.PerkDefs.LegendSecondWind,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNoble

	],
	[
		gt.Const.Perks.PerkDefs.HeadHunter,
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.LegendClarity,
		gt.Const.Perks.PerkDefs.LegendUntouchable,
		gt.Const.Perks.PerkDefs.LegendEvasion,
		gt.Const.Perks.PerkDefs.BattleForged

	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.LegendFreedomOfMovement,
		gt.Const.Perks.PerkDefs.LegendAssassinate
		
		
	],
	[],
	[],
	[],
	[]	
];

gt.Const.Perks.PerksTreeAssassin <- gt.Const.Perks.BuildCustomPerkTree(Tree)