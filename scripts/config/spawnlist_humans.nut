local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Cultists <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_civilian_03",
	Troops = 
	[
		Melee =
		{
			Weight = 100,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.CultistAmbush,
					Cost = 5
				}
			]
		}
	]
}

gt.Const.World.Spawn.Peasants <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.75,
	VisibilityMult = 1.0,
	VisionMult = 0.75,
	Body = "figure_civilian_03",
	Troops = 
	[
		Melee =
		{
			Weight = 100,
			Types =		
			{
				Type = this.Const.World.Spawn.Troops.Peasant,			
				Cost = 2
			}
		}
	]
}
gt.Const.World.Spawn.PeasantsArmed <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.75,
	VisibilityMult = 1.0,
	VisionMult = 0.75,
	Body = "figure_civilian_03",
	Troops = 
	[
		Melee =
		{
			Weight = 100,
			Types =		
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,				
				Cost = 5
			}
		}
	]
}	
gt.Const.World.Spawn.BountyHunters <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	Troops = 
	[
		Melee =
		{
			Weight = 70,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.BountyHunter,
					Cost = 10
				}
			]
		},
		Cavalry =
		{
			Weight = 10,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			]
		},
		Ranged =
		{
			Weight = 20,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
					Cost = 12
				}
			]
		}
	]
}	

gt.Const.World.Spawn.Mercenaries <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_03",
	Troops = 
	{
		Melee =
		{
			Weight = 70,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.MercenaryLOW,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.Mercenary,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 20
				}				
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			]
		},
		Ranged =
		{
			Weight = 20,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.MercenaryRanged,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 20
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 20
				}
			]
		}
	}
}	

gt.Const.World.Spawn.Militia <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.899999976,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_militia_01",
	Troops = 
	{
		Melee =
		{
			Weight = 70,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.Militia,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
					Cost = 15
				}		
			]
		},
		// Cavalry =
		// {
		//	Weight = 0,
		//	Types = [
		//		{
		//			Type = this.Const.World.Spawn.Troops.Wardog,
		//			Cost = 5
		//		}
		//	]
		// },
		Ranged =
		{
			Weight = 20,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.MilitiaRanged,
					Cost = 12
				}
			]
		},
		Leader =
		{
			Weight = 10,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
					Cost = 15
				}
			]
		}
	}
}
