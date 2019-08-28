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
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_01",
		Troops = [
			Melee = 
			{
				Weight = 0.4,
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
			},
			Cavalry =
			{
				Weight = 0.4,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0.2,
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
			},
			Leader =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}

gt.Const.World.Spawn.BanditScouts <- 
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_01",
		Troops = [
			Melee = 
			{
				Weight = 0.5,
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
			},
			Cavalry =
			{
				Weight = 0.25,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0.25,
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					Cost = 8
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				}
			},
			Leader =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}

gt.Const.World.Spawn.BanditRaiders <- 
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_01",
		Troops = [
			Melee = 
			{
				Weight = 0.6,
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
				},
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 40
				}
			},
			Cavalry =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0.3,
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
			},
			Leader =
			{
				Weight = 0.1,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}

gt.Const.World.Spawn.BanditDefenders <- 
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_01",
		Troops = [
			Melee = 
			{
				Weight = 0.6,
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
				},
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 40
				}
			},
			Cavalry =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0.3,
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
			},
			Leader =
			{
				Weight = 0.1,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}

gt.Const.World.Spawn.BanditBoss <- 
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_01",
		Troops = [
			Melee = 
			{
				Weight = 0.41,
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
			},
			Cavalry =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0.41,
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
			},
			Leader =
			{
				Weight = 0.16,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}

gt.Const.World.Spawn.BanditsDisguisedAsDirewolves <- 
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_werewolf_01",
		Troops = [
			Melee = 
			{
				Weight = 1.0,
				{
					Type = this.Const.World.Spawn.Troops.BanditsDisguisedAsDireWolves,
					Cost = 25
				}
			},
			Cavalry =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			},
			Ranged = 
			{
				Weight = 0,
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
			},
			Leader =
			{
				Weight = 0,
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			}
		]
	}