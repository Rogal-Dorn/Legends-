local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.GoblinRoamers <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_01",
	Troops = [
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisherLOW,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				}
			]
		},
		{
			Weight = 55,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusherLOW,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.GoblinScouts <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_02",
	Troops = [
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisherLOW,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				}
			]
		},
		{
			Weight = 55,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusherLOW,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.GoblinRaiders <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_05",
	Troops = [
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisherLOW,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				}
			]
		},
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusherLOW,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinOverseer,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 35
				}
			]
		}
	]
}

gt.Const.World.Spawn.GoblinDefenders <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_04",
	Troops = [
		{
			Weight = 45,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisherLOW,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusherLOW,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinOverseer,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 35
				}
			]
		}
	]
}

gt.Const.World.Spawn.GoblinBoss <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_04",
	Troops = [
		{
			Weight = 55,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinOverseer,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 35
				}
			]
		}
	]
}