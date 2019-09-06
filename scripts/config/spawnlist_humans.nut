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
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.CultistAmbush,
					Cost = 15
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
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Peasant,
					Cost = 10
				}
			]
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
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.PeasantArmed,
					Cost = 10
				}
			]
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
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BountyHunter,
					Cost = 25
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
					Cost = 20
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
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.MercenaryLOW,
					Cost = 18
				},
				{
					Type = this.Const.World.Spawn.Troops.Mercenary,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 40
				},
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.MercenaryRanged,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			Types =[
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 40
				},
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.Militia <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.899999976,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_militia_01",
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Militia,
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
					Cost = 12
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.MilitiaRanged,
					Cost = 10
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
					Cost = 20
				}
			]
		}
	]
}