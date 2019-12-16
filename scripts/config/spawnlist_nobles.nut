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
	Name = "Noble",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_noble_01",
	MinR = 75,
	MaxR = 555,
	Fixed = [
		{
			Weight = 100 //percentage chance after min count is met
			Type = this.Const.World.Spawn.Troops.StandardBearer,
			Cost = 20
		}
	],
	Troops = [
		{
			Weight = 44,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 15
				}
			]
		},
		{
			Weight = 21,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 15
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
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 30
				}
			]
		},
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 30,
					Roll = true
				}
			]
		},
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Knight,
					Cost = 50,
					Roll = true
				}
			]
		},
		{
			Weight = 6,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ArmoredWardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendHalberdier,
					Cost = 40
				}
			]
		},
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendFencer,
					Cost = 40
				}
			]
		},
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSlinger,
					Cost = 40
				}
			]
		},
		{
			Weight = 1,
			MinR = 0.85 * 300,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendCatapult,
					Cost = 60
				}
			]
		}
	]
}

gt.Const.World.Spawn.NobleCaravan <-
{
	Name = "NobleCaravan",
	IsDynamic = true,
	MovementSpeedMult = 0.5,
	VisibilityMult = 1.0,
	VisionMult = 0.25,
	Body = "cart_01",
	MinR = 110,
	MaxR = 365,
	Fixed = [
		{
			MinCount = 1,
			MaxCount = 3,
			Weight = 30 //percentage chance after min count is met
			Type = this.Const.World.Spawn.Troops.CaravanDonkey,
			Cost = 0
		}
	],
	Troops = [
		{
			Weight = 62,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 20
				}
			]
		},
		{
			Weight = 17,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 15
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
			Weight = 2,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 25
				}
			]
		},
		{
			Weight = 2,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 25,
					Roll = true
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendHalberdier,
					Cost = 40
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendFencer,
					Cost = 40
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSlinger,
					Cost = 40
				}
			]
		}
	]
}