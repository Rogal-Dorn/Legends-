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
	Troops = 
	[
		Melee =
		{
			Weight = 70,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMedium,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
					Cost = 18
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 15,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 25
				}				
			]
		},
		Ranged =
		{
			Weight = 20,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 7
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.SkeletonPriest,
					Cost = 25
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
	Troops =
	{
		Leader =
		{
			Weight = 100,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 20
				},			
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.VampiresAndSkeletons <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_01",
	Troops = 
	{
		Melee =
		{
			Weight = 70,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 5
				}
			]
		},	
		Leader =
		{
			Weight = 30,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 20
				},			
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 25
				}
			]
		}
	}
}
