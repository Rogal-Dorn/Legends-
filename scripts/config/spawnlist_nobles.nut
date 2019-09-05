local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Noble <- [
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_noble_01",
	Troops = 
	[
		Melee =
		{
			Weight = 60,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 15
				},				
			]
		},
		// Cavalry =
		// {
		// 		Weight = 5,
		// 		Types = 
		// 		[
		// 			{
		// 				Type = this.Const.World.Spawn.Troops.CaravanDonkey,
		// 				Cost = 5
		// 			}
		//		]
		// },
		Ranged =
		{
			Weight = 15,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.Arbalester,
					Cost = 15
				}
			]
		},
		Leader =
		{
			Weight = 25,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.StandardBearer,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Knight,
					Cost = 25
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
	Troops =
	{
		Melee =
		{
			Weight = 70,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 15
				}
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = 
			[
				{
					Type = this.Const.World.Spawn.Troops.CaravanDonkey,
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
					Type = this.Const.World.Spawn.Troops.Arbalester,
					Cost = 15
				}
			]
		},
		Leader =
		{
			Weight = 10,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 20
				}
			]
		}
	}
}