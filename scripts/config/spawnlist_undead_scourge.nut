local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.UndeadScourge <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	Troops = [
		{
			Weight = 75,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 13
				},			
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMedium,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
					Cost = 35
				}
			]
		},
		{
			Weight = 10
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Necromancer,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonPriest,
					Cost = 40
				}
			]
		},
		{
			Weight = 10,
			Types = [

				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					Cost = 12
				},			
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard,
					Cost = 30
				}
			]
		}
	]
}