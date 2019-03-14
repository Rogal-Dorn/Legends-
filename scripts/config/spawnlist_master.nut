local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Unit <- {
	ID = 0,
	Variant = 0,
	Strength = 0.0,
	Row = 0,
	Party = null,
	Faction = null,
	Tag = null,
	Script = ""
};
gt.Const.World.Spawn.Troops <- {
	Necromancer = {
		ID = this.Const.EntityType.Necromancer,
		Variant = 0,
		Strength = 35,
		Cost = 30,
		Row = 3,
		Script = "scripts/entity/tactical/enemies/necromancer"
	},
	Zombie = {
		ID = this.Const.EntityType.Zombie,
		Variant = 0,
		Strength = 5,
		Cost = 5,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/zombie"
	},
	ZombieYeoman = {
		ID = this.Const.EntityType.ZombieYeoman,
		Variant = 0,
		Strength = 10,
		Cost = 12,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/zombie_yeoman"
	},
	ZombieKnight = {
		ID = this.Const.EntityType.ZombieKnight,
		Variant = 0,
		Strength = 20,
		Cost = 25,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/zombie_knight"
	},
	ZombieBodyguard = {
		ID = this.Const.EntityType.Zombie,
		Variant = 0,
		Strength = 6,
		Cost = 6,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/zombie_bodyguard"
	},
	ZombieYeomanBodyguard = {
		ID = this.Const.EntityType.ZombieYeoman,
		Variant = 0,
		Strength = 12,
		Cost = 12,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/zombie_yeoman_bodyguard"
	},
	ZombieKnightBodyguard = {
		ID = this.Const.EntityType.ZombieKnight,
		Variant = 0,
		Strength = 20,
		Cost = 25,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/zombie_knight_bodyguard"
	},
	ZombieBetrayer = {
		ID = this.Const.EntityType.ZombieBetrayer,
		Variant = 0,
		Strength = 25,
		Cost = 30,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/zombie_betrayer"
	},
	ZombieBoss = {
		ID = this.Const.EntityType.ZombieBoss,
		Variant = 0,
		Strength = 80,
		Cost = 80,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/zombie_boss"
	},
	Ghost = {
		ID = this.Const.EntityType.Ghost,
		Variant = 0,
		Strength = 25,
		Cost = 20,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/ghost"
	},
	SkeletonLight = {
		ID = this.Const.EntityType.SkeletonLight,
		Variant = 0,
		Strength = 14,
		Cost = 13,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/skeleton_light"
	},
	SkeletonMedium = {
		ID = this.Const.EntityType.SkeletonMedium,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/skeleton_medium"
	},
	SkeletonMediumPolearm = {
		ID = this.Const.EntityType.SkeletonMedium,
		Variant = 0,
		Strength = 20,
		Cost = 25,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/skeleton_medium_polearm"
	},
	SkeletonHeavy = {
		ID = this.Const.EntityType.SkeletonHeavy,
		Variant = 0,
		Strength = 30,
		Cost = 35,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/skeleton_heavy"
	},
	SkeletonHeavyPolearm = {
		ID = this.Const.EntityType.SkeletonHeavy,
		Variant = 0,
		Strength = 30,
		Cost = 35,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/skeleton_heavy_polearm"
	},
	SkeletonHeavyBodyguard = {
		ID = this.Const.EntityType.SkeletonHeavy,
		Variant = 0,
		Strength = 30,
		Cost = 30,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/skeleton_heavy_bodyguard"
	},
	SkeletonPriest = {
		ID = this.Const.EntityType.SkeletonPriest,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/skeleton_priest"
	},
	SkeletonBoss = {
		ID = this.Const.EntityType.SkeletonBoss,
		Variant = 0,
		Strength = 80,
		Cost = 80,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/skeleton_boss"
	},
	Vampire = {
		ID = this.Const.EntityType.Vampire,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/vampire"
	},
	VampireLOW = {
		ID = this.Const.EntityType.Vampire,
		Variant = 0,
		Strength = 30,
		Cost = 30,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/vampire_low"
	},
	OrcYoung = {
		ID = this.Const.EntityType.OrcYoung,
		Variant = 0,
		Strength = 16,
		Cost = 16,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/orc_young"
	},
	OrcYoungLOW = {
		ID = this.Const.EntityType.OrcYoung,
		Variant = 0,
		Strength = 14,
		Cost = 13,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/orc_young"
	},
	OrcBerserker = {
		ID = this.Const.EntityType.OrcBerserker,
		Variant = 0,
		Strength = 25,
		Cost = 25,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/orc_berserker"
	},
	LegendOrcElite = {
		ID = this.Const.EntityType.LegendOrcElite,
		Variant = 0,
		Strength = 60,
		Cost = 60,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/legend_orc_elite"
	},
	OrcWarrior = {
		ID = this.Const.EntityType.OrcWarrior,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/orc_warrior"
	},
	OrcWarriorLOW = {
		ID = this.Const.EntityType.OrcWarrior,
		Variant = 0,
		Strength = 30,
		Cost = 30,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/orc_warrior_low"
	},
	OrcWarlord = {
		ID = this.Const.EntityType.OrcWarlord,
		Variant = 0,
		Strength = 45,
		Cost = 50,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/orc_warlord"
	},
	GreenskinCatapult = {
		ID = this.Const.EntityType.GreenskinCatapult,
		Variant = 0,
		Strength = 50,
		Cost = 25,
		Row = 2,
		Script = "scripts/entity/tactical/objective/greenskin_catapult"
	},
	GoblinSkirmisher = {
		ID = this.Const.EntityType.GoblinFighter,
		Variant = 0,
		Strength = 18,
		Cost = 15,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/goblin_fighter"
	},
	GoblinSkirmisherLOW = {
		ID = this.Const.EntityType.GoblinFighter,
		Variant = 0,
		Strength = 14,
		Cost = 10,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/goblin_fighter_low"
	},
	GoblinAmbusher = {
		ID = this.Const.EntityType.GoblinAmbusher,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/goblin_ambusher"
	},
	GoblinAmbusherLOW = {
		ID = this.Const.EntityType.GoblinAmbusher,
		Variant = 0,
		Strength = 15,
		Cost = 15,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/goblin_ambusher_low"
	},
	GoblinShaman = {
		ID = this.Const.EntityType.GoblinShaman,
		Variant = 0,
		Strength = 35,
		Cost = 35,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/goblin_shaman"
	},
	GoblinOverseer = {
		ID = this.Const.EntityType.GoblinLeader,
		Variant = 0,
		Strength = 35,
		Cost = 35,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/goblin_leader"
	},
	GoblinWolfrider = {
		ID = this.Const.EntityType.GoblinWolfrider,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/goblin_wolfrider"
	},
	Direwolf = {
		ID = this.Const.EntityType.Direwolf,
		Variant = 0,
		Strength = 15,
		Cost = 20,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/direwolf"
	},
	DirewolfHIGH = {
		ID = this.Const.EntityType.Direwolf,
		Variant = 0,
		Strength = 20,
		Cost = 25,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/direwolf_high"
	},
	DirewolfBodyguard = {
		ID = this.Const.EntityType.Direwolf,
		Variant = 0,
		Strength = 20,
		Cost = 25,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/direwolf_bodyguard"
	},
	GhoulLOW = {
		ID = this.Const.EntityType.Ghoul,
		Variant = 0,
		Strength = 10,
		Cost = 9,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/ghoul"
	},
	Ghoul = {
		ID = this.Const.EntityType.Ghoul,
		Variant = 0,
		Strength = 15,
		Cost = 19,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/ghoul_medium"
	},
	GhoulHIGH = {
		ID = this.Const.EntityType.Ghoul,
		Variant = 0,
		Strength = 25,
		Cost = 30,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/ghoul_high"
	},
	Lindwurm = {
		ID = this.Const.EntityType.Lindwurm,
		Variant = 0,
		Strength = 90,
		Cost = 80,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/lindwurm"
	},
	Unhold = {
		ID = this.Const.EntityType.Unhold,
		Variant = 0,
		Strength = 50,
		Cost = 50,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/unhold"
	},
	UnholdFrost = {
		ID = this.Const.EntityType.UnholdFrost,
		Variant = 0,
		Strength = 60,
		Cost = 60,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/unhold_frost"
	},
	UnholdBog = {
		ID = this.Const.EntityType.UnholdBog,
		Variant = 0,
		Strength = 50,
		Cost = 50,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/unhold_bog"
	},
	Spider = {
		ID = this.Const.EntityType.Spider,
		Variant = 0,
		Strength = 12,
		Cost = 12,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/spider"
	},
	SpiderBodyguard = {
		ID = this.Const.EntityType.Spider,
		Variant = 0,
		Strength = 12,
		Cost = 12,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/spider_bodyguard"
	},
	Alp = {
		ID = this.Const.EntityType.Alp,
		Variant = 0,
		Strength = 35,
		Cost = 35,
		Row = -2,
		Script = "scripts/entity/tactical/enemies/alp"
	},
	Hexe = {
		ID = this.Const.EntityType.Hexe,
		Variant = 0,
		Strength = 50,
		Cost = 50,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/hexe"
	},
	Schrat = {
		ID = this.Const.EntityType.Schrat,
		Variant = 0,
		Strength = 70,
		Cost = 70,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/schrat"
	},
	Kraken = {
		ID = this.Const.EntityType.Kraken,
		Variant = 0,
		Strength = 200,
		Cost = 200,
		Row = -1,
		Script = "scripts/entity/tactical/enemies/kraken"
	},
	Wildman = {
		ID = this.Const.EntityType.Wildman,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = -1,
		Script = "scripts/entity/tactical/humans/wildman"
	},
	Militia = {
		ID = this.Const.EntityType.Militia,
		Variant = 0,
		Strength = 9,
		Cost = 10,
		Row = 0,
		Script = "scripts/entity/tactical/humans/militia"
	},
	MilitiaRanged = {
		ID = this.Const.EntityType.MilitiaRanged,
		Variant = 0,
		Strength = 12,
		Cost = 10,
		Row = 1,
		Script = "scripts/entity/tactical/humans/militia_ranged"
	},
	MilitiaVeteran = {
		ID = this.Const.EntityType.MilitiaVeteran,
		Variant = 0,
		Strength = 14,
		Cost = 12,
		Row = 0,
		Script = "scripts/entity/tactical/humans/militia_veteran"
	},
	MilitiaCaptain = {
		ID = this.Const.EntityType.MilitiaCaptain,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 2,
		Script = "scripts/entity/tactical/humans/militia_captain"
	},
	BountyHunter = {
		ID = this.Const.EntityType.BountyHunter,
		Variant = 0,
		Strength = 25,
		Cost = 25,
		Row = 0,
		Script = "scripts/entity/tactical/humans/bounty_hunter"
	},
	BountyHunterRanged = {
		ID = this.Const.EntityType.BountyHunter,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 1,
		Script = "scripts/entity/tactical/humans/bounty_hunter_ranged"
	},
	Peasant = {
		ID = this.Const.EntityType.Peasant,
		Variant = 0,
		Strength = 4,
		Cost = 10,
		Row = -1,
		Script = "scripts/entity/tactical/humans/peasant"
	},
	PeasantArmed = {
		ID = this.Const.EntityType.Peasant,
		Variant = 0,
		Strength = 5,
		Cost = 10,
		Row = -1,
		Script = "scripts/entity/tactical/humans/peasant_armed"
	},
	Mercenary = {
		ID = this.Const.EntityType.Mercenary,
		Variant = 0,
		Strength = 30,
		Cost = 25,
		Row = 0,
		Script = "scripts/entity/tactical/humans/mercenary"
	},
	MercenaryLOW = {
		ID = this.Const.EntityType.Mercenary,
		Variant = 0,
		Strength = 20,
		Cost = 18,
		Row = 0,
		Script = "scripts/entity/tactical/humans/mercenary_low"
	},
	MercenaryRanged = {
		ID = this.Const.EntityType.Mercenary,
		Variant = 0,
		Strength = 25,
		Cost = 25,
		Row = 1,
		Script = "scripts/entity/tactical/humans/mercenary_ranged"
	},
	Swordmaster = {
		ID = this.Const.EntityType.Swordmaster,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 0,
		Script = "scripts/entity/tactical/humans/swordmaster"
	},
	HedgeKnight = {
		ID = this.Const.EntityType.HedgeKnight,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 0,
		Script = "scripts/entity/tactical/humans/hedge_knight"
	},
	MasterArcher = {
		ID = this.Const.EntityType.MasterArcher,
		Variant = 0,
		Strength = 40,
		Cost = 40,
		Row = 1,
		Script = "scripts/entity/tactical/humans/master_archer"
	},
	Cultist = {
		ID = this.Const.EntityType.Cultist,
		Variant = 0,
		Strength = 15,
		Cost = 15,
		Row = -1,
		Script = "scripts/entity/tactical/humans/cultist"
	},
	CultistAmbush = {
		ID = this.Const.EntityType.Cultist,
		Variant = 0,
		Strength = 15,
		Cost = 15,
		Row = -2,
		Script = "scripts/entity/tactical/humans/cultist"
	},
	CaravanHand = {
		ID = this.Const.EntityType.CaravanHand,
		Variant = 0,
		Strength = 9,
		Cost = 10,
		Row = 2,
		Script = "scripts/entity/tactical/humans/caravan_hand"
	},
	CaravanGuard = {
		ID = this.Const.EntityType.CaravanGuard,
		Variant = 0,
		Strength = 15,
		Cost = 15,
		Row = 2,
		Script = "scripts/entity/tactical/humans/caravan_guard"
	},
	CaravanDonkey = {
		ID = this.Const.EntityType.CaravanDonkey,
		Variant = 0,
		Strength = 10,
		Cost = 0,
		Row = 3,
		Script = "scripts/entity/tactical/objective/donkey"
	},
	ArmoredWardog = {
		ID = this.Const.EntityType.Wardog,
		Variant = 0,
		Strength = 9,
		Cost = 8,
		Row = 0,
		Script = "scripts/entity/tactical/armored_wardog"
	},
	Footman = {
		ID = this.Const.EntityType.Footman,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 0,
		Script = "scripts/entity/tactical/humans/noble_footman"
	},
	Greatsword = {
		ID = this.Const.EntityType.Greatsword,
		Variant = 0,
		Strength = 25,
		Cost = 25,
		Row = 1,
		Script = "scripts/entity/tactical/humans/noble_greatsword"
	},
	Billman = {
		ID = this.Const.EntityType.Billman,
		Variant = 0,
		Strength = 20,
		Cost = 15,
		Row = 1,
		Script = "scripts/entity/tactical/humans/noble_billman"
	},
	Arbalester = {
		ID = this.Const.EntityType.Arbalester,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 1,
		Script = "scripts/entity/tactical/humans/noble_arbalester"
	},
	StandardBearer = {
		ID = this.Const.EntityType.StandardBearer,
		Variant = 0,
		Strength = 25,
		Cost = 20,
		Row = 2,
		Script = "scripts/entity/tactical/humans/standard_bearer"
	},
	Sergeant = {
		ID = this.Const.EntityType.Sergeant,
		Variant = 0,
		Strength = 30,
		Cost = 25,
		Row = 0,
		Script = "scripts/entity/tactical/humans/noble_sergeant"
	},
	Knight = {
		ID = this.Const.EntityType.Knight,
		Variant = 0,
		Strength = 40,
		Cost = 35,
		Row = 2,
		Script = "scripts/entity/tactical/humans/knight"
	},
	MilitaryDonkey = {
		ID = this.Const.EntityType.MilitaryDonkey,
		Variant = 0,
		Strength = 10,
		Cost = 0,
		Row = 3,
		Script = "scripts/entity/tactical/objective/donkey_military"
	},
	Wardog = {
		ID = this.Const.EntityType.Wardog,
		Variant = 0,
		Strength = 9,
		Cost = 8,
		Row = 0,
		Script = "scripts/entity/tactical/wardog"
	},
		BanditRabble = {
		ID = this.Const.EntityType.BanditRabble,
		Variant = 0,
		Strength = 3,
		Cost = 3,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/bandit_rabble"
	},
	BanditThug = {
		ID = this.Const.EntityType.BanditThug,
		Variant = 0,
		Strength = 8,
		Cost = 8,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/bandit_thug"
	},
	BanditMarksman = {
		ID = this.Const.EntityType.BanditMarksman,
		Variant = 0,
		Strength = 15,
		Cost = 15,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/bandit_marksman"
	},
	BanditMarksmanLOW = {
		ID = this.Const.EntityType.BanditPoacher,
		Variant = 0,
		Strength = 8,
		Cost = 8,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/bandit_poacher"
	},
	BanditRaider = {
		ID = this.Const.EntityType.BanditRaider,
		Variant = 0,
		Strength = 20,
		Cost = 20,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/bandit_raider"
	},
	BanditRaiderLOW = {
		ID = this.Const.EntityType.BanditRaider,
		Variant = 0,
		Strength = 15,
		Cost = 16,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/bandit_raider_low"
	},
	BanditRaiderWolf = {
		ID = this.Const.EntityType.Direwolf,
		Variant = 0,
		Strength = 25,
		Cost = 25,
		Row = 0,
		Script = "scripts/entity/tactical/enemies/bandit_raider_wolf"
	},
	BanditLeader = {
		ID = this.Const.EntityType.BanditLeader,
		Variant = 0,
		Strength = 30,
		Cost = 25,
		Row = 2,
		Script = "scripts/entity/tactical/enemies/bandit_leader"
	}
};
gt.Const.World.Spawn.Caravan <- [
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanGuard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	}
];
gt.Const.World.Spawn.CaravanEscort <- [
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.5,
		VisibilityMult = 1.0,
		VisionMult = 0.25,
		Body = "cart_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CaravanHand,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
				Num = 3
			}
		]
	}
];
function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
		{
			p.Cost += t.Type.Cost * t.Num;
		}

		if (!("MovementSpeedMult" in p))
		{
			p.MovementSpeedMult <- 1.0;
		}
	}

	_p.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.Caravan);
this.calculateCosts(this.Const.World.Spawn.CaravanEscort);
