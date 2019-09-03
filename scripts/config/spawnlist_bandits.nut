local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.BanditRoamers <-
{
	IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRabble,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditThug,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = [
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
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.BanditScouts <-
{
IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRabble,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditThug,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			]
		},
		Ranged =
		{
			Weight = 25,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.BanditRaiders <-
{
IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRabble,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditThug,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = [
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
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.BanditDefenders <-
{
IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRabble,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditThug,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = [
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
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.BanditBoss <-
{
IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRabble,
					Cost = 5
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditThug,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		Cavalry =
		{
			Weight = 5,
			Types = [
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
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 5,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}

gt.Const.World.Spawn.BanditsDisguisedAsDireWolves <-
{
IsBandit = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	Troops =
	{
		Melee =
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderWolf,
					Cost = 25
				}
			]
		},
		Cavalry =
		{
			Weight = 0,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			]
		},
		Ranged =
		{
			Weight = 0,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40
				}
			]
		},
		Leader =
		{
			Weight = 0,
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		}
	}
}