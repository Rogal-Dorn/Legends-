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