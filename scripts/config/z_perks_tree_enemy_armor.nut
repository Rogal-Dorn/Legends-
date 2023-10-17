local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.ForcefulTree <- {
	ID = "ForcefulTree",
	Name =  "Forceful",
	Attributes = {
		Hitpoints = [
			0,
			0
		],
		Bravery = [
			0,
			0
		],
		Stamina = [
			1,
			4
		],
		MeleeSkill = [
			1,
			5
		],
		RangedSkill = [
			0,
			0
		],
		MeleeDefense = [
			-4,
			-2
		],
		RangedDefense = [
			-4,
			-2
		],
		Initiative = [
			-5,
			-1
		]
	},
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[
            gt.Const.Perks.PerkDefs.BattleForged
        ],
		[
            gt.Const.Perks.PerkDefs.LegendMuscularity,
            gt.Const.Perks.PerkDefs.LegendFullForce
        ]
	]
};