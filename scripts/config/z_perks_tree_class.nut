local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BeastClassTree <- {
	ID = "BeastClassTree",
	Descriptions = [
		"is skilled catching beasts"
	],
	Tree = [
		[],
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendMasteryNets],
		[],
		[],
		[]
	]
};

gt.Const.Perks.BardClassTree <- {
	ID = "BardClassTree",
	Descriptions = [
		"is skilled in entertaining"
	],
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
	Descriptions = [
		"is skilled in healing"
	],
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
	Descriptions = [
		"is skilled with fists"
	],
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
	Descriptions = [
		"is a good cook"
	],
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
	Descriptions = [
		"is skilled in repairs"
	],
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
	Descriptions = [
		"is skilled in bartering"
	],
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
	Descriptions = [
		"is skilled with knives"
	],
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
	Descriptions = [
		"is skilled in butchery"
	],
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
	Descriptions = [
		"is skilled with hammers"
	],
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
	Descriptions = [
		"is skilled with militia"
	],
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
	Descriptions = [
		"is skilled with pickaxes"
	],
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
	Descriptions = [
		"is skilled with pitchforks"
	],
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
	Descriptions = [
		"is skilled with shortbows"
	],
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
	Descriptions = [
		"is skilled with shovels"
	],
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
	Descriptions = [
		"is skilled with axes"
	],
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
	Descriptions = [
		"is skilled with sickles"
	],
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
	Descriptions = [
		"is skilled with ninetails"
	],
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
		return this.Tree[L[r]];;
	}	
};