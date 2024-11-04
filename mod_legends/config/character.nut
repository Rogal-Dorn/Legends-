::Const.XP.MaxLevelWithPerkpoints = 12;

::Const.LevelXP = []; // reset for the new max level added
for( local i = 0; i < 88; i = ++i )
{
	::Const.LevelXP.push(this.Const.LevelXP[this.Const.LevelXP.len() - 1] + 4000 + 1000 * i);
}

::Const.Combat.SpawnBloodSameTileChance = 95;
::Const.Combat.SpawnBloodAdjacentTileChance = 80;
::Const.Combat.SpawnBloodAttempts = 4;
::Const.Combat.BloodSplattersAtDeathMult = 2.0;
::Const.Combat.BloodSplattersAtOriginalPosMult = 0.5;
::Const.Combat.DustSplattersAtResurrectionMult = 1.5;
::Const.Combat.BloodPoolsAtDeathMin = 2;
::Const.Combat.BloodiedBustCount = 2;
::Const.Combat.ResurrectAnimationTime = 0.5;

::Const.Corpse.isHuman <- 0;

::Const.ShakeCharacterLayers[0].extend([
	"armor_layer_chain",
	"armor_layer_plate",
	"armor_layer_tabbard",
	"armor_layer_cloak_front",
	"armor_layer_cloak",
]);
::Const.ShakeCharacterLayers[1].extend([
	"helmet_vanity_lower",
	"helmet_vanity_lower_2",
	"helmet_helm",
	"helmet_top",
	"helmet_vanity",
	"helmet_vanity_2",
]);
::Const.ShakeCharacterLayers[2].extend([
	"armor_layer_chain",
	"armor_layer_plate",
	"armor_layer_tabbard",
	"armor_layer_cloak_front",
	"armor_layer_cloak",
	"helmet_vanity_lower",
	"helmet_vanity_lower_2",
	"helmet_helm",
	"helmet_top",
	"helmet_vanity",
	"helmet_vanity_2",
]);
::Const.BackgroundTypeName <- {
	None = "None",
	Crusader = "Crusader",
	Combat = "Combat",
	ConvertedCultist = "Converted Cultist",
	Druid = "Druid",
	Educated = "Educated",
	Female = "Female",
	Noble = "Noble",
	Lowborn = "Lowborn",
	OffendedByViolence = "Offended By Violence",
	Outlaw = "Outlaw",
	Performing = "Performing",
	Scenario = "Scenario",
	Ranger = "Ranger",
	Stabled = "Stabled",
	Untalented = "Untalented",
	Cultist = "Cultist",
	ExpertHunter = "Expert Hunter",
};

// Note: due to limitations of 32-Bit Signed Integers, we can only have up to 31 types
::Const.BackgroundType <- {
	None = 0,
	Crusader = 1,
	Combat = 2,
	ConvertedCultist = 4,
	Druid = 8,
	Educated = 16,
	Female = 32,
	Noble = 64,
	Lowborn = 128,
	OffendedByViolence = 256,
	Outlaw = 512,
	Performing = 1024,
	Scenario = 2048,
	Ranger = 4096,
	Stabled = 8192,
	Untalented = 16384,
	Cultist = 32768,
	ExpertHunter = 65536,
};

::Const.addNewBackgroundType <- function( _typeKey )
{
	local max = 0;
	foreach (btype, value in this.Const.BackgroundType)
	{
		if (max < value)
		{
			max = value;
		}
	}

	this.Const.BackgroundType[_typeKey] <- max << 1;
}

::Const.ProjectileType.Missile <- 11;
::Const.ProjectileType.Blood <- 12;
::Const.ProjectileType.Dart <- 13;
::Const.ProjectileType.COUNT = 14;

::Const.ProjectileSprite.extend([
	"projectile_missile",
	"projectile_blood",
	"projectile_dart"
]);

::Const.HorseMovementAPCost <- [
	0,
	1,
	1,
	3,
	3,
	5,
	5,
	5,
	5
];

::Const.HorsePassageMovementAPCost <- [
	0,
	1,
	1,
	2,
	2,
	4,
	4,
	4,
	4
];

::Const.LegendFlightMovementAPCost <- [
	0,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1
];

::Const.CatapultMovementAPCost <- [
	0,
	10,
	10,
	10,
	10,
	10,
	10,
	10,
	10
];

::Const.HorseMovementFatigueCost <- [
	0,
	1,
	1,
	4,
	4,
	6,
	12,
	10,
	10
];

::Const.HorsePassageMovementFatigueCost <- [
	0,
	1,
	1,
	2,
	2,
	3,
	6,
	5,
	5
];

::Const.LegendFlightMovementFatigueCost <- [
	0,
	2,
	2,
	2,
	2,
	2,
	2,
	2,
	2
];

::Const.CatapultMovementFatigueCost <- [
	0,
	4,
	8,
	12,
	12,
	16,
	28,
	24,
	24
];

::Const.CharacterProperties <- {
::Const.CharacterProperties.FatigueLossOnBeingMissedMult <- 1.0;
::Const.CharacterProperties.IsParrying <- false;
::Const.CharacterProperties.IsEvadingAllAttacks <- false;
::Const.CharacterProperties.IsAffectedByRain <- true;
::Const.CharacterProperties.SurvivesAsUndead <- false;
::Const.CharacterProperties.IsSpecializedInOneHandedSwords <- false;
::Const.CharacterProperties.IsSpecializedInGreatSwords <- false;
::Const.CharacterProperties.IsSpecializedInSpearThrust <- false;
::Const.CharacterProperties.IsSpecializedInShieldPush <- false;
::Const.CharacterProperties.IsSpecializedInNets <- false;
::Const.CharacterProperties.IsSpecializedInNetCasting <- false;
::Const.CharacterProperties.IsSpecializedInFists <- false;
::Const.CharacterProperties.IsSpecializedInSlings <- false;
::Const.CharacterProperties.IsSpecializedInStaves <- false;
::Const.CharacterProperties.IsSpecializedInStaffStun <- false;
::Const.CharacterProperties.IsSpecializedInSummons <- false;
::Const.CharacterProperties.DamageInitiativeMin <- 0;
::Const.CharacterProperties.DamageInitiativeMax <- 0;
::Const.CharacterProperties.DamageInitiativeCutoff <- 100;
::Const.CharacterProperties.FlatOnKillOtherActorModifier <- 0;
::Const.CharacterProperties.PercentOnKillOtherActorModifier <- 1.0;
::Const.CharacterProperties.DailyWageMult = 1.0; //Is not serialised in vanilla. But I have serialised it today because Scenarios were not keeping their wage multiplier modifiers between save/load cycles - Luft 29/12/22

::Const.CharacterProperties[0].getMeleeDefense = function ()
{
	if (this.MeleeDefense >= 0)
	{
		return this.Math.floor(this.MeleeDefense * (this.MeleeDefenseMult >= 0 ? this.MeleeDefenseMult : 1.0 / this.MeleeDefenseMult));
	}
	else
	{
		return this.Math.floor(this.MeleeDefense * (this.MeleeDefenseMult < 0 ? this.MeleeDefenseMult : 1.0 / this.MeleeDefenseMult));
	}
};

::Const.CharacterProperties[0].getRangedDefense = function ()
{
	if (this.RangedDefense >= 0)
	{
		return this.Math.floor(this.RangedDefense * (this.RangedDefenseMult >= 0 ? this.RangedDefenseMult : 1.0 / this.RangedDefenseMult));
	}
	else
	{
		return this.Math.floor(this.RangedDefense * (this.RangedDefenseMult < 0 ? this.RangedDefenseMult : 1.0 / this.RangedDefenseMult));
	}
};

::Const.CharacterProperties[0].getRangedSkill = function ()
{
	return this.Math.floor(this.RangedSkill * (this.RangedSkillMult >= 0 ? this.RangedSkillMult : 1.0 / this.RangedSkillMult));
};

::Const.CharacterProperties[0].getBravery = function ()
{
	return this.Math.floor(this.Bravery * (this.BraveryMult >= 0 ? this.BraveryMult : 1.0 / this.BraveryMult));
};

::Const.CharacterProperties[0].getInitiative = function ()
{
	return this.Math.floor(this.Initiative * (this.InitiativeMult >= 0 ? this.InitiativeMult : 1.0 / this.InitiativeMult));
};

::Const.CharacterProperties[0].getInitiativeMinDamage <- function ()
{
	return this.DamageInitiativeMin + this.Math.max(0, this.getInitiative() - this.DamageInitiativeCutoff);
};

::Const.CharacterProperties[0].getInitiativeMaxDamage <- function ()
{
	return this.DamageInitiativeMax + this.Math.max(0, this.getInitiative() - this.DamageInitiativeCutoff);
};

local onSerialize = ::Const.CharacterProperties[0].onSerialize;
::Const.CharacterProperties[0].onSerialize = function ( _out )
{
	onSerialize( _out );
	_out.writeF32(this.DailyWageMult);
};

local onDeserialize = ::Const.CharacterProperties[0].onDeserialize;
::Const.CharacterProperties[0].onDeserialize = function (_in)
{
	onDeserialize( _in )
	this.DailyWageMult = _in.readF32();
};
