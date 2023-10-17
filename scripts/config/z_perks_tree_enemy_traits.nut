local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BanditTree <- {
	ID = "BanditTree",
	Name =  "Bandit",
	Attributes = {
		Hitpoints = [
			-3,
			-1
		],
		Bravery = [
			-5,
			-2
		],
		Stamina = [
			0,
			0
		],
		MeleeSkill = [
			1,
			4
		],
		RangedSkill = [
			0,
			0
		],
		MeleeDefense = [
			0,
			0
		],
		RangedDefense = [
			0,
			0
		],
		Initiative = [
			2,
			5
		]
	},
	Tree = [
		[
			gt.Const.Perks.PerkDefs.Feint
		],
		[
			gt.Const.Perks.PerkDefs.Backstabber,
			gt.Const.Perks.PerkDefs.CoupDeGrace
		],
		[],
		[],
		[],
		[],
		[]
	]
};
gt.Const.Perks.AggressiveTree <- {
	ID = "AggressiveTree",
	Name =  "Aggressive",
	Attributes = {
		Hitpoints = [
			0,
			0
		],
		Bravery = [
			1,
			5
		],
		Stamina = [
			0,
			0
		],
		MeleeSkill = [
			2,
			6
		],
		RangedSkill = [
			0,
			0
		],
		MeleeDefense = [
			-7,
			-4
		],
		RangedDefense = [
			-7,
			-4
		],
		Initiative = [
			0,
			0
		]
	},
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[
			gt.Const.Perks.PerkDefs.Berserk
		],
		[
			gt.Const.Perks.PerkDefs.KillingFrenzy,
			gt.Const.Perks.PerkDefs.Fearsome
		]
	]
};
gt.Const.Perks.SparringTree <- {
	ID = "SparringTree",
	Name =  "Sparring",
	Attributes = {
		Hitpoints = [
			1,
			3
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
			0,
			0
		],
		RangedSkill = [
			0,
			0
		],
		MeleeDefense = [
			2,
			4
		],
		RangedDefense = [
			-4,
			-2
		],
		Initiative = [
			0,
			0
		]
	},
	Tree = [
		[
			gt.Const.Perks.PerkDefs.LegendBackToBasics
		],
		[
			gt.Const.Perks.PerkDefs.Rotation,
			gt.Const.Perks.PerkDefs.Anticipation
        ],
		[],
		[],
		[],
		[],
		[]
	]
};
gt.Const.Perks.RangerTree <- {
	ID = "RangerTree",
	Name =  "Ranger",
	Attributes = {
		Hitpoints = [
			-6,
			-2
		],
		Bravery = [
			-3,
			1
		],
		Stamina = [
			0,
			2
		],
		MeleeSkill = [
			0,
			0
		],
		RangedSkill = [
			0,
			3
		],
		MeleeDefense = [
			-4,
			-2
		],
		RangedDefense = [
			1,
			5
		],
		Initiative = [
			0,
			0
		]
	},
	Tree = [
		[
			gt.Const.Perks.PerkDefs.Lookout,
            gt.Const.Perks.PerkDefs.Pathfinder
		],
		[
			gt.Const.Perks.PerkDefs.Anticipation
        ],
		[],
		[],
		[],
		[
			gt.Const.Perks.PerkDefs.Ballistics
		],
		[]
	]
};
gt.Const.Perks.GiantTree <- {
	ID = "GiantTree",
	Name =  "Giant",
	Attributes = {
		Hitpoints = [
			2,
			4
		],
		Bravery = [
			0,
			0
		],
		Stamina = [
			0,
			2
		],
		MeleeSkill = [
			0,
			0
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
		[
			gt.Const.Perks.PerkDefs.Colossus
		],
		[
			gt.Const.Perks.PerkDefs.HoldOut
        ],
		[],
		[],
		[],
		[],
		[
            gt.Const.Perks.PerkDefs.LegendMuscularity,
            gt.Const.Perks.PerkDefs.Indomitable
        ]
	]
};