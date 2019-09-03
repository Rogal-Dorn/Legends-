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
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
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
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
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
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
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
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
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
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
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
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
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
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
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
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
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
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
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
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		]
	}

gt.Const.World.Spawn.BanditsDisguisedAsDireWolves <-
	{
		IsBandit = true,
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_werewolf_01",
		//Weight Order is Melee, Cavalry, Ranged, Leader
		Weights =
		[
			1.0,
			 0,
			 0,
			 0
		],
		Troops =
		[
			//Melee troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderWolf,
					Cost = 25
				}
			],
			//Cavalry troops
			[
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			],
			//Ranged troops
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
			],
			//Leader troops
			[
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 25
				}
			]
		]
	}



gt.Const.World.Spawn.BanditRoamers =
{
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
