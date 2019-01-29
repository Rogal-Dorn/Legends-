local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.Tactical <- {};
}

gt.Const.World.SmokeParticles <- [
	{
		Delay = 0,
		Quantity = 250,
		LifeTime = 90000,
		SpawnRate = 25,
		Brushes = [
			"ash_01",
			"ash_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.5,
				LifeTimeMax = 0.699999988,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.5),
				DirectionMax = this.createVec(0.0, 0.5),
				SpawnOffsetMin = this.createVec(-50, -30),
				SpawnOffsetMax = this.createVec(50, 15)
			},
			{
				LifeTimeMin = 6.0,
				LifeTimeMax = 8.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.25,
				ScaleMax = 1.5,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.300000012,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.5,
				ScaleMax = 2.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
gt.Const.World.FireParticles <- [
	{
		Delay = 0,
		Quantity = 60,
		LifeTime = 50000,
		SpawnRate = 60,
		Brushes = [
			"effect_fire_01",
			"effect_fire_02",
			"effect_fire_03"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.100000001,
				ColorMin = this.createColor("ffe7cf00"),
				ColorMax = this.createColor("ffeacf00"),
				ScaleMin = 0.300000012,
				ScaleMax = 0.5,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.5),
				DirectionMax = this.createVec(0.400000006, 0.5),
				SpawnOffsetMin = this.createVec(-70, -30),
				SpawnOffsetMax = this.createVec(70, 20),
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ff813dff"),
				ColorMax = this.createColor("fec19fff"),
				ScaleMin = 0.600000024,
				ScaleMax = 0.600000024,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("fc6a52f0"),
				ColorMax = this.createColor("fcaa52f0"),
				ScaleMin = 0.600000024,
				ScaleMax = 0.600000024,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("d8380000"),
				ColorMax = this.createColor("d8380000"),
				ScaleMin = 0.600000024,
				ScaleMax = 0.600000024,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
gt.Const.World.CampSmokeParticles <- [
	{
		Delay = 0,
		Quantity = 40,
		LifeTime = 10000,
		SpawnRate = 4,
		Brushes = [
			"ash_01",
			"ash_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.5,
				LifeTimeMax = 0.699999988,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.300000012, 0.400000006),
				DirectionMax = this.createVec(0.0, 0.400000006),
				SpawnOffsetMin = this.createVec(0, 25),
				SpawnOffsetMax = this.createVec(0, 25)
			},
			{
				LifeTimeMin = 6.0,
				LifeTimeMax = 8.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.300000012,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
gt.Const.World.CampFireParticles <- [
	{
		Delay = 0,
		Quantity = 20,
		LifeTime = 10000,
		SpawnRate = 20,
		Brushes = [
			"effect_fire_01",
			"effect_fire_02",
			"effect_fire_03"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.100000001,
				ColorMin = this.createColor("ffe7cf00"),
				ColorMax = this.createColor("ffeacf00"),
				ScaleMin = 0.200000003,
				ScaleMax = 0.400000006,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 30,
				VelocityMax = 60,
				DirectionMin = this.createVec(-0.400000006, 0.5),
				DirectionMax = this.createVec(0.400000006, 0.5),
				SpawnOffsetMin = this.createVec(-3, 25),
				SpawnOffsetMax = this.createVec(-3, 25),
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ff813dff"),
				ColorMax = this.createColor("fec19fff"),
				ScaleMin = 0.200000003,
				ScaleMax = 0.400000006,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 30,
				VelocityMax = 60,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("fc6a52f0"),
				ColorMax = this.createColor("fcaa52f0"),
				ScaleMin = 0.200000003,
				ScaleMax = 0.400000006,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 30,
				VelocityMax = 60,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("d8380000"),
				ColorMax = this.createColor("d8380000"),
				ScaleMin = 0.200000003,
				ScaleMax = 0.400000006,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 30,
				VelocityMax = 60,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
gt.Const.World.SmelterSmokeParticles <- [
	{
		Delay = 0,
		Quantity = 40,
		LifeTime = 10000,
		SpawnRate = 4,
		Brushes = [
			"ash_01",
			"ash_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.5,
				LifeTimeMax = 0.699999988,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.300000012, 0.400000006),
				DirectionMax = this.createVec(0.0, 0.400000006),
				SpawnOffsetMin = this.createVec(-30, 25),
				SpawnOffsetMax = this.createVec(30, 25)
			},
			{
				LifeTimeMin = 6.0,
				LifeTimeMax = 8.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.300000012,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
gt.Const.World.BlizzardParticles <- [
	{
		Delay = 0,
		Quantity = 75,
		LifeTime = 1000,
		SpawnRate = 100,
		Brushes = [
			"snow_wind"
		],
		Stages = [
			{
				LifeTimeMin = 1.0,
				LifeTimeMax = 1.0,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 2.0,
				ScaleMax = 2.0,
				RotationMin = 0,
				RotationMax = 0,
				VelocityMin = 60,
				VelocityMax = 120,
				DirectionMin = this.createVec(-0.5, -0.300000012),
				DirectionMax = this.createVec(-0.5, -0.300000012),
				SpawnOffsetMin = this.createVec(-600, -600),
				SpawnOffsetMax = this.createVec(600, 600)
			},
			{
				LifeTimeMin = 46.0,
				LifeTimeMax = 46.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 2.0,
				ScaleMax = 2.0,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 10.0,
				LifeTimeMax = 10.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 2.0,
				ScaleMax = 2.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 1.0,
				LifeTimeMax = 1.0,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 2.0,
				ScaleMax = 2.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	},
	{
		Delay = 0,
		Quantity = 150,
		LifeTime = 1000,
		SpawnRate = 200,
		Brushes = [
			"snow_particle_01"
		],
		Stages = [
			{
				LifeTimeMin = 1.0,
				LifeTimeMax = 1.0,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				RotationMin = 0,
				RotationMax = 359,
				TorqueMin = -20,
				TorqueMax = 20,
				VelocityMin = 80,
				VelocityMax = 120,
				DirectionMin = this.createVec(-0.5, -0.300000012),
				DirectionMax = this.createVec(-0.5, -0.300000012),
				SpawnOffsetMin = this.createVec(-600, -600),
				SpawnOffsetMax = this.createVec(600, 600)
			},
			{
				LifeTimeMin = 46.0,
				LifeTimeMax = 46.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 10.0,
				LifeTimeMax = 10.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 1.0,
				LifeTimeMax = 1.0,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			}
		]
	}
];
