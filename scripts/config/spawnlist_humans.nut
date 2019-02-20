local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Cultists <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.CultistAmbush,
				Num = 7
			}
		]
	}
];
gt.Const.World.Spawn.Peasants <- [
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 2
			}
		]
	},

	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 7
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 12
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 16
			}
		]
	}
	,
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 20
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 22
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 24
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 26
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 28
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 30
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 32
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 36
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 40
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 44
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 48
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 52
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 56
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Peasant,
				Num = 60
			}
		]
	}
];
gt.Const.World.Spawn.PeasantsArmed <- [
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 1
			}
		]
	},

	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 7
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 12
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 16
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 20
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 22
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 24
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 26
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 28
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 30
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 32
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 36
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 40
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 44
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 48
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 52
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 60
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 64
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 70
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 80
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 90
			}
		]
	},
	{
		MovementSpeedMult = 0.75,
		VisibilityMult = 1.0,
		VisionMult = 0.75,
		Body = "figure_civilian_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.PeasantArmed,
				Num = 100
			}
		]
	}
];
gt.Const.World.Spawn.BountyHunters <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			}
		]
	},	
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 15
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 17
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 17
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 7
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 19
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 21
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 23
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 25
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 27
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 29
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 17
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 33
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 19
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 35
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 21
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 37
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 23
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 25
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 42
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 28
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BountyHunter,
				Num = 45
			},
			{
				Type = this.Const.World.Spawn.Troops.BountyHunterRanged,
				Num = 30
			}
		]
	}
];
gt.Const.World.Spawn.Mercenaries <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 1
			}
		]
	},	
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 1
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Wardog,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.MercenaryLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MercenaryRanged,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Mercenary,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 16
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 20
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 22
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 24
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 26
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_bandit_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HedgeKnight,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.Swordmaster,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MasterArcher,
				Num = 28
			}
		]
	}

];
gt.Const.World.Spawn.Militia <- [
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 1
			}
		]
	},	
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			}
		]
	},	
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			}
		]
	},	
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.899999976,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 15
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 15
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 17
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 34
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 34
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeed = 0.800000012,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_militia_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Militia,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaRanged,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.MilitiaCaptain,
				Num = 5
			}
		]
	}

];
function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
		{
			p.Cost += t.Type.Cost * t.Num;
		}

		if (!("MovementSpeedMult" in p))
		{
			p.MovementSpeedMult <- 1.0;
		}
	}

	_p.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.Cultists);
this.calculateCosts(this.Const.World.Spawn.Peasants);
this.calculateCosts(this.Const.World.Spawn.PeasantsArmed);
this.calculateCosts(this.Const.World.Spawn.BountyHunters);
this.calculateCosts(this.Const.World.Spawn.Mercenaries);
this.calculateCosts(this.Const.World.Spawn.Militia);
