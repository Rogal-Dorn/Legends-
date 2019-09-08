local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Kraken <-
{
	IsDynamic = true,
	MovementSpeedMult = 0.0,
	VisibilityMult = 0.5,
	VisionMult = 1.0,
	Body = "figure_kraken_01",
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Kraken
			Cost = 9999
		}
	],
	Troops = []
}


gt.Const.World.Spawn.Direwolves <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_werewolf_01",
	MaxR = 535,
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
			MinR = 0.85 * 535,
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
	MaxR = 535,
	Troops = [
		{
			Weight = 80,
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
			Weight = 19,
			MinR = 0.15 * 535,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				}
			]
		},
		{
			Weight = 1,
			MinR = 0.85 * 535,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendSkinGhoulLOW,
					Cost = 100
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
	MaxR = 800,
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
			MinR = 1.0 * 800,
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
	MaxR = 500,
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
			MinR = 1.0 * 500,
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
	MaxR = 550,
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
			MinR = 1.0 * 550,
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
	MaxR = 500,
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
			MinR = 1.0 * 500,
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
	Body = "figure_spider_01",
	MaxR = 384,
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
			MinR = 1.0 * 384,
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
	MaxR = 480,
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
			MinR = 1.0 * 480,
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
	MaxR = 800,
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
			MinR = 1.0 * 800,
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
	MinR = 100,
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Hexe,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 66,
			Weight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
					Cost = 20,
					function Weight(scale) {
						return 50;
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
					Cost = 20,
					function Weight(scale) {
						return 50;
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 21
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					MinR = 0.3 * 500,
					Cost = 25
				}
			]
		},
		{
			Weight = 25,
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
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
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
					MinR = 0.6 * 500,
					Cost = 30
				}
			]
		},
		{
			Weight = 5,
			MinR = 0.75 * 500,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 51
				}
			]
		},
		{
			Weight = 5,
			MinR = 0.75 * 500,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Hexe,
					Cost = 50,
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					MinR = 1.0 * 500,
					Cost = 200,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
				}
			]
		}
	]
}

gt.Const.World.Spawn.HexenAndNoSpiders <-
{
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_hexe_01",
	MinR = 100,
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Hexe,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 66,
			Weight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
					Cost = 20,
					function Weight(scale) {
						return 50;
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
					Cost = 20,
					function Weight(scale) {
						return 50;
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 40,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 21
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					MinR = 0.3 * 500,
					Cost = 25
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		{
			Weight = 15,
			Types = [
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
					MinR = 0.6 * 500,
					Cost = 30
				}
			]
		},
		{
			Weight = 10,
			MinR = 0.75 * 500,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 51
				}
			]
		},
		{
			Weight = 5,
			MinR = 0.75 * 500,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Hexe,
					Cost = 50,
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					MinR = 1.0 * 500,
					Cost = 200,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
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
	Body = "figure_hexe_01",
	MinR = 100,
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
			Cost = 200,
			MinGuards = 2,
			MaxGuards = 3,
			MaxGuardsWeight = 50,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
					Cost = 20,
					function Weight(scale) {
						return 50;
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 21
				},
				{
					Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
					Cost = 75
				}
			]
		},
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
					Cost = 100
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
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
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 51
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
					Cost = 210
				},
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Hexe,
					Cost = 50,
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.SpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					MinR = 1.0 * 500,
					Cost = 200,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 20,
							function Weight(scale) {
								return 50;
							}
						}
					]
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
	MaxR = 1000,
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
	MaxR = 1000,
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
	MaxR = 1000,
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
	MaxR = 500,
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
	MaxR = 500,
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
	MaxR = 500,
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
	MaxR = 500,
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