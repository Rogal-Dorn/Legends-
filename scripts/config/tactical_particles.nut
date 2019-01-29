local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

gt.Const.Tactical.DustParticles <- [
	{
		Delay = 0,
		Quantity = 30,
		LifeTimeQuantity = 30,
		SpawnRate = 600,
		Brushes = [
			"dust_01",
			"dust_02"
		],
		Stages = [
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 30,
				VelocityMax = 50,
				DirectionMin = this.createVec(-0.5, 0.400000006),
				DirectionMax = this.createVec(0.5, 0.400000006),
				SpawnOffsetMin = this.createVec(-30, -30),
				SpawnOffsetMax = this.createVec(30, 0)
			},
			{
				LifeTimeMin = 3.0,
				LifeTimeMax = 4.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 1.0,
				ScaleMax = 1.0,
				VelocityMin = 30,
				VelocityMax = 50,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 0)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 1.25,
				ScaleMax = 1.5,
				VelocityMin = 30,
				VelocityMax = 50,
				ForceMin = this.createVec(0, -60),
				ForceMax = this.createVec(0, -60)
			}
		]
	}
];
gt.Const.Tactical.BloodEffects <- [
	[],
	[
		{
			Delay = 0,
			Quantity = 10,
			LifeTimeQuantity = 10,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 100,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.600000024),
					DirectionMax = this.createVec(0.200000003, 0.600000024),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 10,
			LifeTimeQuantity = 10,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_dark_01",
				"blood_splatter_dark_05",
				"blood_splatter_dark_06",
				"blood_splatter_dark_07",
				"blood_splatter_dark_08",
				"blood_splatter_dark_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 100,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.600000024),
					DirectionMax = this.createVec(0.200000003, 0.600000024),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 3,
			LifeTimeQuantity = 3,
			SpawnRate = 600,
			Brushes = [
				"blood_splatter_bones_04",
				"blood_splatter_bones_05",
				"blood_splatter_bones_06"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 100,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.699999988),
					DirectionMax = this.createVec(0.200000003, 0.699999988),
					SpawnOffsetMin = this.createVec(-15, -15),
					SpawnOffsetMax = this.createVec(15, 15)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 100,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -175),
					ForceMax = this.createVec(0, -175)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[],
	[
		{
			Delay = 0,
			Quantity = 10,
			LifeTimeQuantity = 10,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 100,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.600000024),
					DirectionMax = this.createVec(0.200000003, 0.600000024),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 3,
			LifeTimeQuantity = 3,
			SpawnRate = 600,
			Brushes = [
				"blood_splatter_wood_04",
				"blood_splatter_wood_05",
				"blood_splatter_wood_06"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 100,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.699999988),
					DirectionMax = this.createVec(0.200000003, 0.699999988),
					SpawnOffsetMin = this.createVec(-15, -15),
					SpawnOffsetMax = this.createVec(15, 15)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 100,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -175),
					ForceMax = this.createVec(0, -175)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	]
];
gt.Const.Tactical.BloodSplatters <- [
	[],
	[
		{
			Delay = 0,
			Quantity = 20,
			LifeTimeQuantity = 20,
			SpawnRate = 80,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.699999988),
					DirectionMax = this.createVec(0.100000001, 0.699999988),
					SpawnOffsetMin = this.createVec(10, 0),
					SpawnOffsetMax = this.createVec(10, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		},
		{
			Delay = 600,
			Quantity = 15,
			LifeTimeQuantity = 15,
			SpawnRate = 60,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.600000024),
					DirectionMax = this.createVec(0.100000001, 0.600000024),
					SpawnOffsetMin = this.createVec(-5, 10),
					SpawnOffsetMax = this.createVec(-5, 10)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		},
		{
			Delay = 1200,
			Quantity = 15,
			LifeTimeQuantity = 15,
			SpawnRate = 60,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.600000024),
					DirectionMax = this.createVec(0.100000001, 0.600000024),
					SpawnOffsetMin = this.createVec(-20, 20),
					SpawnOffsetMax = this.createVec(-20, 20)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 30,
			LifeTimeQuantity = 30,
			SpawnRate = 120,
			Brushes = [
				"blood_splatter_dark_01",
				"blood_splatter_dark_05",
				"blood_splatter_dark_06",
				"blood_splatter_dark_07",
				"blood_splatter_dark_08",
				"blood_splatter_dark_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 30,
					VelocityMax = 90,
					DirectionMin = this.createVec(-0.100000001, 0.800000012),
					DirectionMax = this.createVec(0.100000001, 0.800000012),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0),
					ForceMin = this.createVec(-20, 0),
					ForceMax = this.createVec(-20, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.300000012,
					ScaleMax = 0.600000024,
					VelocityMin = 100,
					VelocityMax = 100,
					ForceMin = this.createVec(-20, 0),
					ForceMax = this.createVec(-20, 0)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.800000012,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(-20, -150),
					ForceMax = this.createVec(-20, -150)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 40,
			LifeTimeQuantity = 40,
			SpawnRate = 600,
			Brushes = [
				"dust_01",
				"dust_02"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.5,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					DirectionMin = this.createVec(-0.400000006, 0.600000024),
					DirectionMax = this.createVec(0.400000006, 0.600000024),
					SpawnOffsetMin = this.createVec(-20, -20),
					SpawnOffsetMax = this.createVec(20, 20)
				},
				{
					LifeTimeMin = 2.0,
					LifeTimeMax = 3.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 60,
					VelocityMax = 100,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -100),
					ForceMax = this.createVec(0, -100)
				}
			]
		},
		{
			Delay = 0,
			Quantity = 6,
			LifeTimeQuantity = 6,
			SpawnRate = 600,
			Brushes = [
				"blood_splatter_bones_04",
				"blood_splatter_bones_05",
				"blood_splatter_bones_06"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 70,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.800000012),
					DirectionMax = this.createVec(0.200000003, 0.800000012),
					SpawnOffsetMin = this.createVec(-15, -15),
					SpawnOffsetMax = this.createVec(15, 15)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.5,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 70,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -175),
					ForceMax = this.createVec(0, -175)
				},
				{
					LifeTimeMin = 0.0500000007,
					LifeTimeMax = 0.0500000007,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 190,
			LifeTimeQuantity = 190,
			SpawnRate = 126,
			Brushes = [
				"effect_fire_01",
				"effect_fire_02",
				"effect_fire_03"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("f8fbff00"),
					ColorMax = this.createColor("f8fbff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					DirectionMin = this.createVec(-0.400000006, 0.600000024),
					DirectionMax = this.createVec(0.400000006, 0.600000024),
					SpawnOffsetMin = this.createVec(-25, -15),
					SpawnOffsetMax = this.createVec(25, 20),
					ForceMin = this.createVec(0, 50),
					ForceMax = this.createVec(0, 80)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.5,
					ColorMin = this.createColor("ddecffff"),
					ColorMax = this.createColor("f8fbffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					DirectionMin = this.createVec(-0.400000006, 0.600000024),
					DirectionMax = this.createVec(0.400000006, 0.600000024),
					ForceMin = this.createVec(0, 50),
					ForceMax = this.createVec(0, 80)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.5,
					ColorMin = this.createColor("8abbf8f0"),
					ColorMax = this.createColor("c4dcf9f0"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					ForceMin = this.createVec(0, 50),
					ForceMax = this.createVec(0, 80)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("3a89e900"),
					ColorMax = this.createColor("559ef700"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					ForceMin = this.createVec(0, 50),
					ForceMax = this.createVec(0, 80)
				}
			]
		},
		{
			Delay = 0,
			Quantity = 70,
			LifeTimeQuantity = 70,
			SpawnRate = 84,
			Brushes = [
				"ash_01"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.5,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					DirectionMin = this.createVec(-0.400000006, 0.600000024),
					DirectionMax = this.createVec(0.400000006, 0.600000024),
					SpawnOffsetMin = this.createVec(-35, -30),
					SpawnOffsetMax = this.createVec(35, 15)
				},
				{
					LifeTimeMin = 2.0,
					LifeTimeMax = 3.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 60,
					VelocityMax = 100,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 10)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -80),
					ForceMax = this.createVec(0, -80)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 20,
			LifeTimeQuantity = 20,
			SpawnRate = 80,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.699999988),
					DirectionMax = this.createVec(0.100000001, 0.699999988),
					SpawnOffsetMin = this.createVec(10, 0),
					SpawnOffsetMax = this.createVec(10, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		},
		{
			Delay = 600,
			Quantity = 15,
			LifeTimeQuantity = 15,
			SpawnRate = 60,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.600000024),
					DirectionMax = this.createVec(0.100000001, 0.600000024),
					SpawnOffsetMin = this.createVec(-5, 10),
					SpawnOffsetMax = this.createVec(-5, 10)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		},
		{
			Delay = 1200,
			Quantity = 15,
			LifeTimeQuantity = 15,
			SpawnRate = 60,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.100000001, 0.600000024),
					DirectionMax = this.createVec(0.100000001, 0.600000024),
					SpawnOffsetMin = this.createVec(-20, 20),
					SpawnOffsetMax = this.createVec(-20, 20)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-30, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 70,
			LifeTimeQuantity = 70,
			SpawnRate = 600,
			Brushes = [
				"dust_01",
				"dust_02"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.5,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 60,
					VelocityMax = 100,
					DirectionMin = this.createVec(-0.400000006, 0.600000024),
					DirectionMax = this.createVec(0.400000006, 0.600000024),
					SpawnOffsetMin = this.createVec(-60, -50),
					SpawnOffsetMax = this.createVec(60, 20)
				},
				{
					LifeTimeMin = 2.0,
					LifeTimeMax = 3.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 60,
					VelocityMax = 100,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -100),
					ForceMax = this.createVec(0, -100)
				}
			]
		},
		{
			Delay = 0,
			Quantity = 8,
			LifeTimeQuantity = 8,
			SpawnRate = 600,
			Brushes = [
				"blood_splatter_wood_04",
				"blood_splatter_wood_05",
				"blood_splatter_wood_06"
			],
			Stages = [
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.200000003,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 70,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.800000012),
					DirectionMax = this.createVec(0.200000003, 0.800000012),
					SpawnOffsetMin = this.createVec(-30, 10),
					SpawnOffsetMax = this.createVec(30, 50)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.5,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 70,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.200000003,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -175),
					ForceMax = this.createVec(0, -175)
				},
				{
					LifeTimeMin = 0.0500000007,
					LifeTimeMax = 0.0500000007,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.660000026,
					ScaleMax = 0.660000026,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	]
];
gt.Const.Tactical.DecapitateSplatters <- [
	[],
	[
		{
			Delay = 0,
			Quantity = 40,
			LifeTimeQuantity = 40,
			SpawnRate = 25,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.00800000038, 0.800000012),
					DirectionMax = this.createVec(0.00800000038, 0.899999976),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-10, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -200),
					ForceMax = this.createVec(0, -200)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 30,
			LifeTimeQuantity = 30,
			SpawnRate = 20,
			Brushes = [
				"blood_splatter_dark_01",
				"blood_splatter_dark_05",
				"blood_splatter_dark_06",
				"blood_splatter_dark_07",
				"blood_splatter_dark_08",
				"blood_splatter_dark_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.00999999978, 0.699999988),
					DirectionMax = this.createVec(0.00999999978, 0.699999988),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-10, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	this.Const.Tactical.BloodSplatters[3],
	this.Const.Tactical.BloodSplatters[4],
	[
		{
			Delay = 0,
			Quantity = 40,
			LifeTimeQuantity = 40,
			SpawnRate = 25,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.00800000038, 0.800000012),
					DirectionMax = this.createVec(0.00800000038, 0.899999976),
					SpawnOffsetMin = this.createVec(0, 0),
					SpawnOffsetMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(-10, 0),
					ForceMax = this.createVec(-10, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -200),
					ForceMax = this.createVec(0, -200)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	this.Const.Tactical.BloodSplatters[6]
];
gt.Const.Tactical.SmashSplatters <- [
	[],
	[
		{
			Delay = 0,
			Quantity = 80,
			LifeTimeQuantity = 80,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_red_01",
				"blood_splatter_red_02",
				"blood_splatter_red_05",
				"blood_splatter_red_06",
				"blood_splatter_red_07",
				"blood_splatter_red_08",
				"blood_splatter_red_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.699999988),
					DirectionMax = this.createVec(0.200000003, 0.699999988),
					SpawnOffsetMin = this.createVec(-5, 5),
					SpawnOffsetMax = this.createVec(-5, 5)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	[
		{
			Delay = 0,
			Quantity = 80,
			LifeTimeQuantity = 80,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_dark_01",
				"blood_splatter_dark_05",
				"blood_splatter_dark_06",
				"blood_splatter_dark_07",
				"blood_splatter_dark_08",
				"blood_splatter_dark_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.699999988),
					DirectionMax = this.createVec(0.200000003, 0.699999988),
					SpawnOffsetMin = this.createVec(-5, 5),
					SpawnOffsetMax = this.createVec(-5, 5)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	this.Const.Tactical.BloodSplatters[3],
	this.Const.Tactical.BloodSplatters[4],
	[
		{
			Delay = 0,
			Quantity = 80,
			LifeTimeQuantity = 80,
			SpawnRate = 200,
			Brushes = [
				"blood_splatter_green_01",
				"blood_splatter_green_02",
				"blood_splatter_green_05",
				"blood_splatter_green_06",
				"blood_splatter_green_07",
				"blood_splatter_green_08",
				"blood_splatter_green_09"
			],
			Stages = [
				{
					LifeTimeMin = 0.300000012,
					LifeTimeMax = 0.300000012,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.00999999978,
					ScaleMax = 0.00999999978,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = 10,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 150,
					DirectionMin = this.createVec(-0.200000003, 0.699999988),
					DirectionMax = this.createVec(0.200000003, 0.699999988),
					SpawnOffsetMin = this.createVec(-5, 5),
					SpawnOffsetMax = this.createVec(-5, 5)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.0,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.330000013,
					ScaleMax = 0.75,
					VelocityMin = 150,
					VelocityMax = 150,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff7f"),
					ColorMax = this.createColor("ffffff7f"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, -180),
					ForceMax = this.createVec(0, -180)
				},
				{
					LifeTimeMin = 0.0199999996,
					LifeTimeMax = 0.0399999991,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					VelocityMin = 0,
					VelocityMax = 0,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				}
			]
		}
	],
	this.Const.Tactical.BloodSplatters[6]
];
gt.Const.Tactical.TerrainDropdownParticles <- [
	[],
	[],
	[],
	[],
	[],
	[
		{
			ApplyOnRain = false,
			Delay = 0,
			Quantity = 9,
			LifeTimeQuantity = 9,
			SpawnRate = 600,
			Brushes = [
				"dust_01"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 40,
					VelocityMax = 60,
					DirectionMin = this.createVec(-0.699999988, 0.200000003),
					DirectionMax = this.createVec(0.699999988, 0.200000003),
					SpawnOffsetMin = this.createVec(-35, -40),
					SpawnOffsetMax = this.createVec(35, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.5,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 40,
					VelocityMax = 60,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 20,
					VelocityMax = 40,
					ForceMin = this.createVec(0, -50),
					ForceMax = this.createVec(0, -50)
				}
			]
		}
	],
	[],
	[],
	[],
	[
		{
			ApplyOnRain = true,
			Delay = 0,
			Quantity = 40,
			LifeTimeQuantity = 40,
			SpawnRate = 600,
			Brushes = [
				"swamp_splatter_01"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					RotationMin = 0,
					RotationMax = 359,
					TorqueMin = -20,
					TorqueMax = 20,
					VelocityMin = 60,
					VelocityMax = 90,
					DirectionMin = this.createVec(-0.600000024, 0.400000006),
					DirectionMax = this.createVec(0.600000024, 0.400000006),
					SpawnOffsetMin = this.createVec(-10, -40),
					SpawnOffsetMax = this.createVec(10, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.5,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 0.75,
					ScaleMax = 1.0,
					VelocityMin = 60,
					VelocityMax = 90,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.75,
					ScaleMax = 0.75,
					VelocityMin = 50,
					VelocityMax = 50,
					ForceMin = this.createVec(0, -60),
					ForceMax = this.createVec(0, -60)
				}
			]
		}
	],
	[],
	[
		{
			ApplyOnRain = false,
			Delay = 0,
			Quantity = 9,
			LifeTimeQuantity = 9,
			SpawnRate = 600,
			Brushes = [
				"dust_01"
			],
			Stages = [
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 0.5,
					ScaleMax = 0.75,
					RotationMin = 0,
					RotationMax = 359,
					VelocityMin = 40,
					VelocityMax = 60,
					DirectionMin = this.createVec(-0.699999988, 0.200000003),
					DirectionMax = this.createVec(0.699999988, 0.200000003),
					SpawnOffsetMin = this.createVec(-35, -40),
					SpawnOffsetMax = this.createVec(35, 0)
				},
				{
					LifeTimeMin = 1.5,
					LifeTimeMax = 2.5,
					ColorMin = this.createColor("ffffffff"),
					ColorMax = this.createColor("ffffffff"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 40,
					VelocityMax = 60,
					ForceMin = this.createVec(0, 0),
					ForceMax = this.createVec(0, 0)
				},
				{
					LifeTimeMin = 0.100000001,
					LifeTimeMax = 0.100000001,
					ColorMin = this.createColor("ffffff00"),
					ColorMax = this.createColor("ffffff00"),
					ScaleMin = 1.0,
					ScaleMax = 1.0,
					VelocityMin = 20,
					VelocityMax = 40,
					ForceMin = this.createVec(0, -50),
					ForceMax = this.createVec(0, -50)
				}
			]
		}
	],
	[],
	[],
	[],
	[],
	[]
];
gt.Const.Tactical.BurnParticles <- [
	{
		Delay = 100,
		Quantity = 230,
		LifeTimeQuantity = 230,
		SpawnRate = 156,
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
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				SpawnOffsetMin = this.createVec(-50, -30),
				SpawnOffsetMax = this.createVec(50, 20),
				ForceMin = this.createVec(0, 50),
				ForceMax = this.createVec(0, 80)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("ff813dff"),
				ColorMax = this.createColor("fec19fff"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				ForceMin = this.createVec(0, 50),
				ForceMax = this.createVec(0, 80)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.5,
				ColorMin = this.createColor("fc6a52f0"),
				ColorMax = this.createColor("fcaa52f0"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 50),
				ForceMax = this.createVec(0, 80)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("d8380000"),
				ColorMax = this.createColor("d8380000"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 50),
				ForceMax = this.createVec(0, 80)
			}
		]
	},
	{
		Delay = 100,
		Quantity = 80,
		LifeTimeQuantity = 80,
		SpawnRate = 84,
		Brushes = [
			"ash_01"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.5,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				SpawnOffsetMin = this.createVec(-35, -30),
				SpawnOffsetMax = this.createVec(35, 15)
			},
			{
				LifeTimeMin = 2.0,
				LifeTimeMax = 3.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 10)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, -80),
				ForceMax = this.createVec(0, -80)
			}
		]
	}
];
gt.Const.Tactical.AcidParticles <- [
	{
		Delay = 0,
		Quantity = 20,
		LifeTimeQuantity = 20,
		SpawnRate = 20,
		Brushes = [
			"ash_01"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.5,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				SpawnOffsetMin = this.createVec(-15, -15),
				SpawnOffsetMax = this.createVec(15, 0)
			},
			{
				LifeTimeMin = 2.0,
				LifeTimeMax = 3.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 10)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, -80),
				ForceMax = this.createVec(0, -80)
			}
		]
	}
];
gt.Const.Tactical.LightningParticles <- [
	{
		Delay = 0,
		Quantity = 10,
		LifeTimeQuantity = 10,
		SpawnRate = 156,
		Brushes = [
			"effect_lightning_01",
			"effect_lightning_02",
			"effect_lightning_03"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.100000001,
				ColorMin = this.createColor("fffffff00"),
				ColorMax = this.createColor("fffffff00"),
				ScaleMin = 0.25,
				ScaleMax = 0.5,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.100000001, -0.899999976),
				DirectionMax = this.createVec(0.100000001, -0.899999976),
				SpawnOffsetMin = this.createVec(-10, 90),
				SpawnOffsetMax = this.createVec(10, 140),
				ForceMin = this.createVec(0, -50),
				ForceMax = this.createVec(0, -80)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("fffffffe0"),
				ColorMax = this.createColor("ffffffff0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.200000003, -0.899999976),
				DirectionMax = this.createVec(0.200000003, -0.899999976),
				ForceMin = this.createVec(0, -50),
				ForceMax = this.createVec(0, -80)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("ffffffe0"),
				ColorMax = this.createColor("ffffffe0"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, -50),
				ForceMax = this.createVec(0, -80)
			},
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				RotationMin = -10,
				RotationMax = 10,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, -50),
				ForceMax = this.createVec(0, -80)
			}
		]
	},
	{
		Delay = 100,
		Quantity = 80,
		LifeTimeQuantity = 80,
		SpawnRate = 84,
		Brushes = [
			"ash_01"
		],
		Stages = [
			{
				LifeTimeMin = 0.100000001,
				LifeTimeMax = 0.200000003,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.5,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.400000006, 0.600000024),
				DirectionMax = this.createVec(0.400000006, 0.600000024),
				SpawnOffsetMin = this.createVec(-35, -30),
				SpawnOffsetMax = this.createVec(35, 15)
			},
			{
				LifeTimeMin = 2.0,
				LifeTimeMax = 3.0,
				ColorMin = this.createColor("ffffffff"),
				ColorMax = this.createColor("ffffffff"),
				ScaleMin = 0.5,
				ScaleMax = 0.75,
				VelocityMin = 60,
				VelocityMax = 100,
				ForceMin = this.createVec(0, 0),
				ForceMax = this.createVec(0, 10)
			},
			{
				LifeTimeMin = 0.200000003,
				LifeTimeMax = 0.300000012,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.75,
				ScaleMax = 1.0,
				VelocityMin = 0,
				VelocityMax = 0,
				ForceMin = this.createVec(0, -80),
				ForceMax = this.createVec(0, -80)
			}
		]
	}
];
