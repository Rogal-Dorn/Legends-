local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.MaceTree <- {
	ID = "Mace",
	Tree = [
		[],
		[],//[gt.Const.Perks.PerkDefs.LegendDaze],
		[],
		[gt.Const.Perks.PerkDefs.SpecMace],
		[],
		[gt.Const.Perks.PerkDefs.ReturnFavor],
		[]
	]
};


gt.Const.Perks.FlailTree <- {
	ID = "Flail",
	Tree = [
		[],//gt.Const.Perks.PerkDefs.ShieldAvoidance],
		[],
		[],
		[gt.Const.Perks.PerkDefs.SpecFlail],
		[],
		[gt.Const.Perks.PerkDefs.HeadHunter],
		[gt.Const.Perks.PerkDefs.BattleFlow]
	]
};

gt.Const.Perks.HammerTree <- {
	ID = "Hammer",
	Tree = [
		[],//gt.Const.Perks.PerkDefs.DestroyArmor
		[gt.Const.Perks.PerkDefs.LegendSmackdown],
		[],
		[gt.Const.Perks.PerkDefs.SpecHammer],
		[],
		[gt.Const.Perks.PerkDefs.SunderingStrikes],
		[]
	]
};

gt.Const.Perks.AxeTree <- {
	ID = "Axe",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.LegendSmashingShields], 
		[],
		[gt.Const.Perks.PerkDefs.SpecAxe],
		[],
		[],
		[gt.Const.Perks.PerkDefs.KillingFrenzy]
	]
};

gt.Const.Perks.CleaverTree <- {
	ID = "Cleaver",
	Tree = [
		[], 
		[], //gt.Const.Perks.PerkDefs.BleedIncrease
		[],
		[gt.Const.Perks.PerkDefs.SpecCleaver],
		[],
		[],
		[gt.Const.Perks.PerkDefs.Fearsome]
	]
};

gt.Const.Perks.GreatSwordTree <- {
	ID = "GreatSword",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.BloodyHarvest],
		[], 
		[gt.Const.Perks.PerkDefs.LegendSpecGreatSword],
		[],
		[gt.Const.Perks.PerkDefs.LegendForcefulSwing],
		[]
	]
};

gt.Const.Perks.SwordTree <- {
	ID = "Sword",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.Feint],
		[],
		[gt.Const.Perks.PerkDefs.SpecSword],
		[],
		[gt.Const.Perks.PerkDefs.Duelist]
	]
};

gt.Const.Perks.DaggerTree <- {
	ID = "Dagger",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.Backstabber],
		[gt.Const.Perks.PerkDefs.SpecDagger],
		[gt.Const.Perks.PerkDefs.DoubleStrike],
		[],
		[]
	]
};
gt.Const.Perks.PolearmTree <- {
	ID = "Polearm",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.Slaughterer],
		[],
		[gt.Const.Perks.PerkDefs.SpecPolearm],
		[gt.Const.Perks.PerkDefs.ReachAdvantage],
		[],
		[]
	]
};

gt.Const.Perks.SpearTree <- {
	ID = "Spear",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecSpearWall],
		[],
		[gt.Const.Perks.PerkDefs.SpecSpear],
		[gt.Const.Perks.PerkDefs.LegendSpecSpearThrust],
		[],
		[]
	]
};

gt.Const.Perks.CrossbowTree <- {
	ID = "Crossbow",
	Tree = [
		[],//gt.Const.Perks.PerkDefs.ArmorPierce
		[],
		[],
		[gt.Const.Perks.PerkDefs.SpecCrossbow],
		[],
		[gt.Const.Perks.PerkDefs.Ballistics],
		[gt.Const.Perks.PerkDefs.LegendPiercingShot]
	]
};

gt.Const.Perks.BowTree <- {
	ID = "Bow",
	Tree = [
		[],//gt.Const.Perks.PerkDefs.BowRange
		[gt.Const.Perks.PerkDefs.Bullseye],
		[],
		[gt.Const.Perks.PerkDefs.SpecBow],
		[],
		[gt.Const.Perks.PerkDefs.Overwhelm],
		[]
	]
};

gt.Const.Perks.ThrowingTree <- {
	ID = "Throwing",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.QuickHands],
		[],
		[gt.Const.Perks.PerkDefs.SpecThrowing],
		[],
		[gt.Const.Perks.PerkDefs.CloseCombatArcher],
		[]
	]
};

gt.Const.Perks.SlingsTree <- {
	ID = "Slings",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistSlingDamage],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistSlingSkill],
		[gt.Const.Perks.PerkDefs.LegendMasterySlings],
		[],
		[],
		[]
	]
};

gt.Const.Perks.StavesTree <- {
	ID = "Staves",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecStaffSkill],
		[gt.Const.Perks.PerkDefs.LegendMasteryStaves],
		[gt.Const.Perks.PerkDefs.LegendSpecStaffStun],
		[],
		[]
	]
};

gt.Const.Perks.WeaponTrees <- {
	Tree = [
		gt.Const.Perks.MaceTree,
		gt.Const.Perks.FlailTree,
		gt.Const.Perks.HammerTree,
		gt.Const.Perks.AxeTree,
		gt.Const.Perks.CleaverTree, 
		gt.Const.Perks.GreatSwordTree,
		gt.Const.Perks.SwordTree,
		gt.Const.Perks.DaggerTree,
		gt.Const.Perks.PolearmTree, 
		gt.Const.Perks.SpearTree,
		gt.Const.Perks.CrossbowTree,
		gt.Const.Perks.BowTree,
		gt.Const.Perks.ThrowingTree,
		gt.Const.Perks.SlingsTree,
		gt.Const.Perks.StavesTree
	],
	function getRandom(_exclude) 
	{
		local L = [];
		foreach (i, t in this.Tree)
		{
			if (_exclude.find(t.ID))
			{
				continue;
			}
			L.push(i);
		}

		local r = this.Math.rand(0, L.len() - 1)
		return this.Tree[r];
	}
};