local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.Zombies <-
{
	Name = "Zombies",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 521,
	MinR = 35,
	Troops = [
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 40
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesLight <-
{
	Name = "ZombiesLight",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 124,
	MinR = 36,
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesAndGhouls <-
{
	Name = "ZombiesAndGhouls",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 441,
	MinR = 54,
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 40
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					MinR = 200,
					Cost = 19
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesOrZombiesAndGhouls <-
{
	Name = "ZombiesOrZombiesAndGhouls",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 441,
	MinR = 54,
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 40
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GhoulLOW,
					Cost = 9
				},
				{
					Type = this.Const.World.Spawn.Troops.Ghoul,
					MinR = 200,
					Cost = 19
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesAndGhosts <-
{
	Name = "ZombiesAndGhosts",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 441,
	MinR = 54,
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 30
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 400,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			MinR = 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBanshee,
					Cost = 70
				}
			]
		}
	]
}

gt.Const.World.Spawn.ZombiesOrZombiesAndGhosts <-
{
	Name = "ZombiesOrZombiesAndGhosts",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 441,
	MinR = 54,
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 60,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 40
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 400,
					Cost = 40
				}
			]
		},
		{
			Weight = 5,
			MinR = 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBanshee,
					Cost = 70
				}
			]
		}
	]
}

gt.Const.World.Spawn.Ghosts <-
{
	Name = "Ghosts",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 460,
	MinR = 80,
	Troops = [
		{
			Weight = 80,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 400,
					Cost = 40
				}
			]
		}
		{
			Weight = 10,
			MinR = 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBanshee,
					Cost = 70
				}
			]
		}
	]
}

gt.Const.World.Spawn.Necromancer <-
{
	Name = "Necromancer",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 706,
	MinR = 102,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 30,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Weight = 0,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieBodyguard,
					MaxR = 200,
					Cost = 6,
					function Weight(scale) {
						local c = 100 - (scale * 100)
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					MinR = 200,
					Cost = 12,
					function Weight(scale) {
						local c = 100 - (scale * 100)
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					MinR = 400,
					Cost = 25,
					function Weight(scale) {
						local c = 100 - ((1.0 - scale) * 100)
						return this.Math.min(100, c);
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Zombie,
					Cost = 5
				}
			]
		},
		{
			Weight = 65,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MinR = 200,
					Cost = 20
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,
					Cost = 30
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Necromancer,
					Cost = 30,
					Roll = true
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
							Cost = 12,
							function Weight(scale) {
								local c = 100 - (scale * 100)
								return this.Math.max(0, c);
							}
						},
						{
							Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
							Cost = 25,
							function Weight(scale) {
								local c = 100 - ((1.0 - scale) * 100)
								return this.Math.min(100, c);
							}
						}
					]
				}
			]
		},
		{
			Weight = 4,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		},
		{
			Weight = 4,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					MinR = 400,
					Cost = 40
				}
			]
		}
		{
			Weight = 2,
			MinR = 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendBanshee,
					Cost = 70
				}
			]
		}
	]
}


gt.Const.World.Spawn.NecromancerSouthern <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 3
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 4
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 5
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 6
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 7
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 8
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 9
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 10
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 11
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 12
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 12
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieYeoman,
				Num = 2
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 13
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 15
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 14
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 16
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 17
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 4
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 18
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 19
			}
		]
	},
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_zombie_04",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomadBodyguard,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieNomad,
				Num = 21
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

this.calculateCosts(this.Const.World.Spawn.NecromancerSouthern);