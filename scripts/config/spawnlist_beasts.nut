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
	Name = "Kraken",
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
	Name = "Direwolves",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_werewolf_01",
	MaxR = 535,
	Troops = [
		{
			Weight = 100,
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
		}
	]
}

gt.Const.World.Spawn.Ghouls <-
{
	Name = "Ghouls",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_ghoul_01",
	MaxR = 484,
	MinR = 30,
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
			Weight = 20,
			MinR = 0.15 * 535,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					Cost = 30
				}
			]
		}
	]
}

gt.Const.World.Spawn.Lindwurm <-
{
	Name = "Lindwurm",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_lindwurm_01",
	MaxR = 800,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Cost = 80
				}
			]
		}
	]
}

gt.Const.World.Spawn.Unhold <-
{
	Name = "Unhold",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_01",
	MaxR = 500,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 50
				}
			]
		}
	]
}

gt.Const.World.Spawn.UnholdFrost <-
{
	Name = "UnholdFrost",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_02",
	MaxR = 550,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.UnholdFrost,
					Cost = 60
				}
			]
		}
	]
}

gt.Const.World.Spawn.UnholdBog <-
{
	Name = "UnholdBog",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_unhold_03",
	MaxR = 500,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 50
				}
			]
		}
	]
}

gt.Const.World.Spawn.Spiders <-
{
	Name = "Spiders",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_spider_01",
	MaxR = 384,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				}
			]
		}
	]
}

//Kept alps the same because they're cool already and I dunno what demon alps terrain would reall be
gt.Const.World.Spawn.Alps <-
{
	Name = "Alps",
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
			MinR = 1.0 * 4000,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
					Cost = 800
				}
			]
		}
	]
}

gt.Const.World.Spawn.Schrats <-
{
	Name = "Schrats",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_schrat_01",
	MaxR = 800,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		}
	]
}

gt.Const.World.Spawn.HexenAndMore <-
{
	Name = "HexenAndMore",
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
			Weight = 0, //0 Weight guarentees this will be added
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
			Weight = 22,
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
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBear,
					Cost = 90
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
					MinR = 1.0 * 1000,
					Cost = 400,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 250,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 150,
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
	Name = "HexenAndNoSpiders",
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
			Weight = 0, // 0 guarentees this will be added
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DirewolfBodyguard,
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
			Weight = 35,
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
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBear,
					MinR = 0.3 * 100,
					Cost = 30
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
						}
					]
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
					MinR = 1.0 * 3000,
					Cost = 200,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 250,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 200,
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
	Name = "LegendHexeLeader",
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
			Weight = 0, // 0 guarentees this will be added
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
					Cost = 200,
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
					Cost = 200
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
					Cost = 200
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
					Cost = 400
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
					Cost = 400
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
					MinR = 1.0 * 2000,
					Cost = 300,
					MinGuards = 2,
					MaxGuards = 3,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolfBodyguard,
							Cost = 200,
							function Weight(scale) {
								return 50;
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.LegendRedbackSpiderBodyguard,
							Cost = 200,
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

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendRockUnhold <-
{
	Name = "LegendRockUnhold",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_rock_unhold_01",
	MaxR = 1000,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
			Cost = 180,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 90,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
					Cost = 180
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Unhold,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdBog,
					Cost = 60
				},
				{
					Type = this.Const.World.Spawn.Troops.UnholdFrost,
					Cost = 60
				}
			]
		}
	]
}

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendSkinGhouls <-
{
	Name = "LegendSkinGhouls",
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

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendWhiteDirewolf <-
{
	Name = "LegendWhiteDirewolf",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_white_direwolf_01",
	MaxR = 1000, //this may need to be changed i have no idea if this is good or not
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
			Cost = 150,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 90
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
					Cost = 150
				}
			]
		},
		{
			Weight = 10
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
		}
	]
}

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendRedbackSpider <-
{
	Name = "LegendRedbackSpider",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_redback_spider_01",
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
			Cost = 100,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 90
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
					Cost = 100
				}
			]
		},
		{
			Weight = 10
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Spider,
					Cost = 12
				}
			]
		}
	]
}

//May need MinR && Legend Beast Cost Change
//May want to be kept non-changed too
//Probably won't add these to the beast_roamers_action.nut
gt.Const.World.Spawn.LegendDemonAlp <-
{
	Name = "LegendDemonAlp",
	IsDynamic = true,
	MovementSpeedMult = 1.1,
	VisibilityMult = 0.7,
	VisionMult = 1.3,
	Body = "figure_demonalp_01",
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
			Cost = 105,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Alp,
					Cost = 30
				}
			]
		},
		{
			Weight = 40
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonAlp,
					Cost = 105
				}
			]
		}
	]
}

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendStollwurm <-
{
	Name = "LegendStollwurm",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.1,
	Body = "figure_stollwurm_01",
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendStollwurm,
			Cost = 270,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Cost = 80
				}
			]
		},
		{
			Weight = 40
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendStollwurm,
					Cost = 270
				}
			]
		}
	]
}

//May need MinR && Legend Beast Cost Change
gt.Const.World.Spawn.LegendGreenwoodSchrat <-
{
	Name = "LegendGreenwoodSchrat",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 0.9,
	VisionMult = 1.2,
	Body = "figure_greenwood_schrat_01",
	MaxR = 500,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
			Cost = 210,
            Weight = 0
		}
	],
	Troops = [
		{
			Weight = 60
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Schrat,
					Cost = 70
				}
			]
		},
		{
			Weight = 40
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
					Cost = 210
				}
			]
		}
	]
}

//TODO run Rmin and Rmax calculations and ratios and convert these
gt.Const.World.Spawn.Hyenas <- [
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 9
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 14
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 17
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 19
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 20
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 21
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 22
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 23
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 1
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 2
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 10
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 14
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 13
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Hyena,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 17
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 19
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 20
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 21
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 22
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 23
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 25
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_hyena_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.HyenaHIGH,
				Num = 26
			}
		]
	}
];
gt.Const.World.Spawn.Serpents <- [
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 3
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 4
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 5
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 6
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 7
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 8
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 9
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 10
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 11
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 12
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 13
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 14
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 15
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 16
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 17
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 18
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 19
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 20
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 21
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 22
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 23
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 24
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 25
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 26
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 27
			}
		]
	},
	{
		Cost = 0,
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_serpent_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Serpent,
				Num = 28
			}
		]
	}
];
gt.Const.World.Spawn.SandGolems <- [
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 12
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 16
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 17
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 19
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 20
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 21
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 22
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 23
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 24
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 25
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 26
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 27
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 28
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 29
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 30
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 31
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 32
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 33
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 34
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 35
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 36
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 37
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 38
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 39
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 40
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 41
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 42
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 7
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 12
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 7
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 16
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 17
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 8
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 19
			}
		]
	},
	{
		MovementSpeedMult = 0.9,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_golem_02",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.SandGolem,
				Num = 20
			}
		]
	}
];