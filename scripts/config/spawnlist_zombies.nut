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

gt.Const.World.Spawn.ZombiesAndGhouls <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 50,
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
			Weight = 50,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					Cost = 19
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesOrZombiesAndGhouls <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 75,
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
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					Cost = 19
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesAndGhosts <- 
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
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesOrZombiesAndGhosts <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 85,
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
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		}
	]
}

gt.Const.World.Spawn.Ghosts <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		}
	]
}


gt.Const.World.Spawn.Necromancer <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	Troops = [
		{
			Weight = 65,
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
			Weight = 15,
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
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Necromancer,
					Cost = 30
				}
			]
		}
	]
}