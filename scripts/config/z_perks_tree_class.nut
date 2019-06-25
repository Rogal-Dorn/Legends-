local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BeastClassTree <- {
	ID = "BeastClassTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.BardClassTree <- {
	ID = "BardClassTree",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.LegendDaze],
		[],
		[gt.Const.Perks.PerkDefs.LegendEntice],
		[],
		[gt.Const.Perks.PerkDefs.LegendDrumsOfWar],
		[]
	]
};

gt.Const.Perks.HealerClassTree <- {
	ID = "HealerClassTree",
	Tree = [
		[],
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecBandage],
		[gt.Const.Perks.PerkDefs.LegendMedIngredients],
		[],
		[gt.Const.Perks.PerkDefs.LegendFieldTriage]
	]
};

gt.Const.Perks.FistsClassTree <- {
	ID = "FistsClassTree",
	Tree = [
		[],
		[gt.Const.Perks.PerkDefs.LegendKick],
		[gt.Const.Perks.PerkDefs.LegendGrapple],
		[gt.Const.Perks.PerkDefs.LegendSpecFists],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ChefClassTree <- {
	ID = "ChefClassTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendFieldTreats]
	]
};

gt.Const.Perks.RepairClassTree <- {
	ID = "RepairClassTree",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendToolsDrawers],
		[],
		[gt.Const.Perks.PerkDefs.LegendToolsSpares],
		[],
		[gt.Const.Perks.PerkDefs.LegendFieldRepairs]
	]
};

gt.Const.Perks.BarterClassTree <- {
	ID = "BarterClassTree",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendBarterConvincing],
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendBarterTrustworthy],
		[gt.Const.Perks.PerkDefs.LegendBribe]
	]
};

gt.Const.Perks.KnifeClassTree <- {
	ID = "KnifeClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistKnifeSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistKnifeDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ButcherClassTree <- {
	ID = "ButcherClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistButcherSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistButcherDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.HammerClassTree <- {
	ID = "HammerClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistHammerSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistHammerDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.MilitiaClassTree <- {
	ID = "MilitiaClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistMilitiaSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistMilitiaDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.PickaxeClassTree <- {
	ID = "PickaxeClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistPickaxeSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistPickaxeDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.PitchforkClassTree <- {
	ID = "PitchforkClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistPitchforkSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistPitchforkDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ShortbowClassTree <- {
	ID = "ShortbowClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistShortbowSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistShortbowDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ShovelClassTree <- {
	ID = "ShovelClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistShovelSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistShovelDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.WoodaxeClassTree <- {
	ID = "WoodaxeClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.SickleClassTree <- {
	ID = "SickleClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.NinetailsClassTree <- {
	ID = "NinetailsClassTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.LegendSpecialistNinetailsSkill],
		[],
		[gt.Const.Perks.PerkDefs.LegendSpecialistNinetailsDamage],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ClassTrees <- {
	Tree = [
		gt.Const.Perks.BeastClassTree,
		gt.Const.Perks.BardClassTree,
		gt.Const.Perks.HealerClassTree,
		gt.Const.Perks.FistsClassTree,
		gt.Const.Perks.ChefClassTree, 
		gt.Const.Perks.RepairClassTree,
		gt.Const.Perks.BarterClassTree,
		gt.Const.Perks.KnifeClassTree,
		gt.Const.Perks.ButcherClassTree,
		gt.Const.Perks.HammerClassTree,
		gt.Const.Perks.MilitiaClassTree,
		gt.Const.Perks.PickaxeClassTree,
		gt.Const.Perks.PitchforkClassTree,
		gt.Const.Perks.ShortbowClassTree,
		gt.Const.Perks.WoodaxeClassTree,
		gt.Const.Perks.SickleClassTree,
		gt.Const.Perks.NinetailsClassTree
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