local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.OrcRoamers <- [
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 3
			}
		]
	},
		{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_06",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			}
		]
	},
		{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			}
		]
	},
		{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 17
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 19
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 21
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 21
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 15
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 17
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 19
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 21
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 23
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			}
		]
	}

];
gt.Const.World.Spawn.OrcScouts <- [
			{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
		{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	}
];
gt.Const.World.Spawn.OrcRaiders <- [
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},

	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	
	
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},

	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 17
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_06",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 17
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 4
			}
		]
	}

];
gt.Const.World.Spawn.OrcDefenders <- [
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 9
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 14
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 2
			}
		]
	}
	,
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 34
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 34
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 6
			}
		]
	}
	,
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 44
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 44
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 44
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 48
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 48
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 48
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_orc_05",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 12
			}
		]
	}

];
gt.Const.World.Spawn.OrcBoss <- [
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 19
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 26
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	}
	,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 38
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 30
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 32
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 44
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 50
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 36
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 50
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 40
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarlord,
				Num = 1
			}
		]
	}
];
gt.Const.World.Spawn.YoungOrcsOnly <- [
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 13
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 15
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 17
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			}
		]
	}
];
gt.Const.World.Spawn.YoungOrcsAndBerserkers <- [
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},

	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},

	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},

	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 4
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 7
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 8
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 9
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 10
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 11
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 12
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 13
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 14
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 15
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 16
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 17
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 18
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 5
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			}
		]
	}
];
,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 9
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 11
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 13
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 15
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 17
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 19
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 21
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 23
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 25
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 26
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 27
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 29
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 30
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 31
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 32
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 33
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 34
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 35
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 36
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 37
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 38
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 39
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 42
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 44
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 46
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 48
			}
		]
	}
];,
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 50
			}
		]
	}
];
gt.Const.World.Spawn.BerserkersOnly <- [
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 1
			}
		]
	},

	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 1
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 4
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 2
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 3
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 5
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 6
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 7
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 8
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 9
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 10
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 11
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 12
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 14
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 16
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 18
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 20
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 22
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 24
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 26
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 28
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 30
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 32
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 34
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 36
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 38
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 40
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 42
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 44
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 46
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 48
			}
		]
	},
	{
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 50
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

this.calculateCosts(this.Const.World.Spawn.OrcRoamers);
this.calculateCosts(this.Const.World.Spawn.OrcScouts);
this.calculateCosts(this.Const.World.Spawn.OrcRaiders);
this.calculateCosts(this.Const.World.Spawn.OrcDefenders);
this.calculateCosts(this.Const.World.Spawn.OrcBoss);
this.calculateCosts(this.Const.World.Spawn.YoungOrcsOnly);
this.calculateCosts(this.Const.World.Spawn.YoungOrcsAndBerserkers);
this.calculateCosts(this.Const.World.Spawn.BerserkersOnly);
