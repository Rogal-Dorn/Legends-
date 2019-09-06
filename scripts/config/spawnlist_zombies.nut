local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Zombies <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					Cost = 25
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieBodyguard,
					Cost = 6
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					Cost = 25
				}
			]
		}
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Necromancer,
					Cost = 30
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesLight <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesOrZombiesAndGhosts <- {};
gt.Const.World.Spawn.ZombiesOrZombiesAndGhouls <- {};

foreach(k, v in this.Const.World.Spawn.Zombies)
{
	this.Const.World.Spawn.ZombiesOrZombiesAndGhosts.rawset(k, v);
	this.Const.World.Spawn.ZombiesOrZombiesAndGhouls.rawset(k, v);
}