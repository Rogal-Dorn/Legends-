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
	Name = "UndeadArmy",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	MaxR = 625,
	MinR = 52,
	Troops = [
		{
			Weight = 50,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 13
				},
				{
					MinR = 200,
					Type = this.Const.World.Spawn.Troops.SkeletonMedium,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
					MinR = 500,
					Cost = 35
				}
			]
		},
		{
			Weight = 35,
			MinR = 250,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyPolearm,
					MinR = 800,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
					MinR = 1200,
					Cost = 40
				},
			]
		},
		{
			Weight = 3,
			MinR = 0.75 * 1200,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonPriest,
					Cost = 40,
					Roll = true
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 33,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard,
							Cost = 30,
							function Weight(scale) {
								return 100;
							}
						}
					]
				}
			]
		},
		{
			Weight = 5
			MinR = 0.20 * 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					MinR = 400,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendVampireLord,
					MinR = 1200,
					Cost = 70
				}
			]
		},
		{
			Weight = 5,
			MinR = 0.15 * 625,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 800,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.Vampires <-
{
	Name = "Vampires",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_02",
	MaxR = 340,
	MinR = 40,
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.VampireLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 40
					MinR = 400,
				}
			]
		},
		{
			Weight = 10,
			MinR = 1200,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendVampireLord,
					Cost = 70
				}
			]
		}
	]
}

gt.Const.World.Spawn.VampiresAndSkeletons <-
{
	Name = "VampiresAndSkeletons",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_01",
	MaxR = 521,
	MinR = 108,
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMedium,
					MinR = 200,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
					MinR = 600,
					Cost = 35
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
					MinR = 400,
					Cost = 40
				},
				{
					MinR = 1200,
					Type = this.Const.World.Spawn.Troops.LegendVampireLord,
					Cost = 70
				}
			]
		}
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 800,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.Mummies <-
{
	Name = "Mummies",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_vampire_01",
	MaxR = 521,
	MinR = 108,
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendMummyLight,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendMummyMedium,
					MinR = 200,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendMummyHeavy,
					MinR = 600,
					Cost = 35
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
					MinR = 400,
					Cost = 40
				},
				{
					MinR = 1200,
					Type = this.Const.World.Spawn.Troops.LegendMummyQueen,
					Cost = 70
				}
			]
		}
	]
}