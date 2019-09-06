local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.UndeadArmy <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	Troops = [
		{
			Weight = 70,
			Types = [
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
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard,
					Cost = 35
				}
			]
		},
		{
			Weight = 15,
			Types = [
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
			Weight = 20,
			Types =[
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 25
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonPriest,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.Vampires <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_02",
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.VampiresAndSkeletons <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_01",
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 13
				}
			]
		},
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 40
				}
			]
		}
	]
}