local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Noble <- {
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_noble_01",
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 25
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Arbalester,
					Cost = 20
				}
			]
		},
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.StandardBearer,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.Knight,
					Cost = 35
				}
			]
		}
	]
}

gt.Const.World.Spawn.NobleCaravan <- 
{
	IsDynamic = true,
	MovementSpeedMult = 0.5,
	VisibilityMult = 1.0,
	VisionMult = 0.25,
	Body = "cart_01",
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 25
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.CaravanDonkey,
					Cost = 0
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Arbalester,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 25
				}
			]
		}
	]
}