local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

if (!("Actor" in gt.Const.Tactical))
{
	gt.Const.Tactical.Actor <- {};
}
gt.Const.Tactical.Actor.Mwah <- {
	XP = 425,
	ActionPoints = 10,
	Hitpoints = 100,
	Bravery = 150,
	Stamina = 145,
	MeleeSkill = 100,
	RangedSkill = 85,
	MeleeDefense = 30,
	RangedDefense = 20,
	Initiative = 80,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 20
};

gt.Const.Tactical.Actor.Freykin <- {
	XP = 425,
	ActionPoints = 9,
	Hitpoints = 115,
	Bravery = 150,
	Stamina = 125,
	MeleeSkill = 100,
	RangedSkill = 85,
	MeleeDefense = 25,
	RangedDefense = 25,
	Initiative = 110,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 20
};

gt.Const.Tactical.Actor.Poss <- {
	XP = 425,
	ActionPoints = 10,
	Hitpoints = 115,
	Bravery = 150,
	Stamina = 100,
	MeleeSkill = 115,
	RangedSkill = 85,
	MeleeDefense = 20,
	RangedDefense = 15,
	Initiative = 130,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		175,
		175
	],
	FatigueRecoveryRate = 25
};