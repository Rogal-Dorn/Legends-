local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Kraken <- [
	{
		MovementSpeedMult = 0.0,
		VisibilityMult = 0.5,
		VisionMult = 1.0,
		Body = "figure_kraken_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Kraken,
				Num = 1
			}
		]
	}
];

gt.Const.World.Spawn.Direwolves <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_werewolf_01",
	Troops = [
		{
			Weight = 79,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					Cost = 25
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
					Cost = 75
				}
			]
		}
	]
}

gt.Const.World.Spawn.Ghouls <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_ghoul_01",
	Troops = [
		{
			Weight = 79,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					Cost = 19
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 100
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulHIGH,
					Cost = 200
				}
			]
		}
	]
}


gt.Const.World.Spawn.Lindwurm <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_lindwurm_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Cost = 80
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendStollwurm,
					Cost = 270
				}
			]
		}
	]
}

gt.Const.World.Spawn.Unhold <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		}
	]
}

gt.Const.World.Spawn.UnholdFrost <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_02",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.UnholdFrost,
					Cost = 60
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		}
	]
}

gt.Const.World.Spawn.UnholdBog <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_03",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 50
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		}
	]
}

gt.Const.World.Spawn.Spiders <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_spiders_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
					Cost = 100
				}
			]
		}
	]
}

gt.Const.World.Spawn.Alps <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_alp_01",
	Troops = [
		{
			Weight = 85,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Alp,
					Cost = 30
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
					Cost = 105
				}
			]
		}
	]
}

gt.Const.World.Spawn.Schrats <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_schrat_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
					Cost = 210
				}
			]
		}
	]
}

gt.Const.World.Spawn.HexenAndMore <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_hexe_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					Cost = 19
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				},
			]
		},
		{
			Weight = 20
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Hexe,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					Cost = 200
				}
			]
		}
	]
}


gt.Const.World.Spawn.LegendHexeLeader <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_hexe_leader_01",
	Troops = [
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					Cost = 19
				},
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				},
				{
					Type = this.Const.World.Spawn.Troops.Alp,
					Cost = 30
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
					Cost = 75
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
					Cost = 100
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
					Cost = 210
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
					Cost = 105
				}
			]
		},
		{
			Weight = 20
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Hexe,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					Cost = 200
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendRockUnhold <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_rock_unhold_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.UnholdFrost,
					Cost = 60
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendSkinGhouls <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_ghoul_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulMED,
					Cost = 100
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulHIGH,
					Cost = 200
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendWhiteDirewolf <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_white_direwolf_01",
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					Cost = 25
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
					Cost = 75
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendRedbackSpider <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_redback_spider_01",
	Troops = [
		{
			Weight = 85,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				}
			]
		},
		{
			Weight = 5
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
					Cost = 100
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendDemonAlp <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.1,
	VisibilityMult = 0.7,
	VisionMult = 1.3,
	Body = "figure_demonalp_01",
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Alp,
					Cost = 30
				}
			]
		},
		{
			Weight = 40,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
					Cost = 105
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendStollwurm <-
{
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.1,
	Body = "figure_stollwurm_01",
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Cost = 80
				}
			]
		},
		{
			Weight = 40,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendStollwurm,
					Cost = 270
				}
			]
		}
	]
}

gt.Const.World.Spawn.LegendGreenwoodSchrat <-
{
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 0.9,
	VisionMult = 1.2,
	Body = "figure_greenwood_schrat_01",
	Troops = [
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		},
		{
			Weight = 40,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
					Cost = 210
				}
			]
		}
	]
}

this.Const.World.Spawn.Beasts <- [];
this.Const.World.Spawn.Beasts.extend(this.Const.World.Spawn.Direwolves);
this.Const.World.Spawn.Beasts.extend(this.Const.World.Spawn.Ghouls);