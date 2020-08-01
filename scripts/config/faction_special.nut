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
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 115,
	Bravery = 90,
	Stamina = 140,
	MeleeSkill = 110,
	RangedSkill = 85,
	MeleeDefense = 35,
	RangedDefense = 15,
	Initiative = 80,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 20
};