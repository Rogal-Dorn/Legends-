local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Barbarians <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_01",
	Troops = [
		{
			Weight = 80,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianThrall,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.BarbarianChampion,
					Cost = 35
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianDrummer,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Warhound,
					Cost = 10
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
					Cost = 70
				},
				{
					Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
					Cost = 15
				}
			]
		}
	]
}

gt.Const.World.Spawn.BarbarianHunters <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_03",
	Troops = [
		{
			Weight = 66,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianThrall,
					Cost = 12
				}
			]
		},
		{
			Weight = 34,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Warhound,
					Cost = 10
				}
			]
		}
	]
}

gt.Const.World.Spawn.BarbarianKing <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_06",
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianChosen,
					Cost = 45
				}
			]
		}
	]
}