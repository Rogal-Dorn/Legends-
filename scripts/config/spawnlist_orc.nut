local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.OrcRoamers <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_02",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				}
			]
		}
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 80
				}
			]
		}
	]
}

gt.Const.World.Spawn.OrcScouts <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				}
			]
		}
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 80
				}
			]
		}
	]
}

gt.Const.World.Spawn.OrcRaiders <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				}
			]
		}
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		},
		{
			Weight = 4,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 80
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarlord,
					Cost = 50
				}
			]
		}
	]
}

gt.Const.World.Spawn.OrcDefenders <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				}
			]
		}
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 80
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarlord,
					Cost = 50
				}
			]
		}
	]
}

gt.Const.World.Spawn.OrcBoss <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				}
			]
		}
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		},
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 80
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarlord,
					Cost = 50
				}
			]
		}
	]
}

gt.Const.World.Spawn.YoungOrcsOnly <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		}
	]
}

gt.Const.World.Spawn.YoungOrcsAndBerserkers <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoungLOW,
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				}
			]
		},
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		}
	]
}

gt.Const.World.Spawn.BerserkersOnly <- 
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 25
				}
			]
		}
	]
}