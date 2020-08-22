local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.NomadRoamers <-
{
	Name = "NomadRoamers",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_03",
	Fixed = [],
	//MinR = 56,
	MaxR = 188,
	Troops = [
		{
			Weight = 80,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadCutthroat,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadOutlaw,
					MinR = 84,
					Cost = 25
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadSlinger,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					MinR = 107,
					Cost = 15
				}
			]
		}
	]
};

gt.Const.World.Spawn.NomadRaiders <-
{
	Name = "NomadRaiders",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	Fixed = [],
	//MinR = 63,
	MaxR = 600
	Troops =
	[
		{
			Weight = 63,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadCutthroat,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadOutlaw,
					MinR = 80,
					Cost = 25
				}
			]
		},
		{
			Weight = 26,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadSlinger,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					MinR = 120,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker, //looks like M.Archer
					MinR = 420,
					Cost = 40,
					Roll = true
				}
			]
		},
		{
			Weight = 7,
			MinR = 140,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,
					Cost = 30,
					Roll = true
				}
			]
		},
		{
			Weight = 2,
			MinR = 300,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.Executioner,
					Cost = 40,
					Roll = true
				}
			]
		},
		{
			Weight = 2,
			MinR = 310,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.DesertDevil,
					Cost = 40,
					Roll = true
				}
			]
		}
	]
};

gt.Const.World.Spawn.NomadDefenders <-
{
	Name = "NomadDefenders",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	Fixed = [],
	//MinR = 63,
	MaxR = 600
	Troops =
	[
		{
			Weight = 67,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadCutthroat,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadOutlaw,
					Cost = 25
				}
			]
		},
		{
			Weight = 24,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadSlinger,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					MinR = 120,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker, //looks like M.Archer
					MinR = 420,
					Cost = 40,
					Roll = true
				}
			]
		},
		{
			Weight = 5,
			MinR = 140,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,
					Cost = 30,
					Roll = true
				}
			]
		},
		{
			Weight = 2,
			MinR = 365,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.Executioner,
					Cost = 40,
					Roll = true
				}
			]
		},
		{
			Weight = 2,
			MinR = 425,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.DesertDevil,
					Cost = 40,
					Roll = true
				}
			]
		}
	]
};