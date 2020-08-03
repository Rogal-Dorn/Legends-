local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

gt.Const.Tactical.MisarmeParticles <- [
	{
		Delay = 0,
		Quantity = 150,
		LifeTimeQuantity = 150,
		SpawnRate = 150,
		Brushes = [
			"effect_fire_01",
			"effect_fire_02"
			"effect_fire_03"
		],
		Stages = [
		{
			LifeTimeMin = 0.1,
			LifeTimeMax = 0.1,
			ColorMin = this.createColor("4169E100"),
			ColorMax = this.createColor("4169E100"),
			ScaleMin = 0.5,
			ScaleMax = 0.75,
			RotationMin = 0,
			RotationMax = 359,
			VelocityMin = 60,
			VelocityMax = 100,
			DirectionMin = this.createVec(-0.4, 0.6),
			DirectionMax = this.createVec(0.4, 0.6),
			SpawnOffsetMin = this.createVec(-25, -15),
			SpawnOffsetMax = this.createVec(25, 20),
			ForceMin = this.createVec(0, 50),
			ForceMax = this.createVec(0, 80)
		},
		{
			LifeTimeMin = 0.2,
			LifeTimeMax = 0.5,
			ColorMin = this.createColor("800080ff"),
			ColorMax = this.createColor("8A2BE2ff"),
			ScaleMin = 0.5,
			ScaleMax = 0.75,
			RotationMin = 0,
			RotationMax = 359,
			VelocityMin = 60,
			VelocityMax = 100,
			DirectionMin = this.createVec(-0.4, 0.6),
			DirectionMax = this.createVec(0.4, 0.6),
			ForceMin = this.createVec(0, 50),
			ForceMax = this.createVec(0, 80)
		},
		{
			LifeTimeMin = 0.2,
			LifeTimeMax = 0.5,
			ColorMin = this.createColor("DDA0DDf0"),
			ColorMax = this.createColor("FF00FFf0"),
			ScaleMin = 0.85,
			ScaleMax = 1.4,
			RotationMin = 0,
			RotationMax = 359,
			VelocityMin = 60,
			VelocityMax = 100,
			ForceMin = this.createVec(0, 50),
			ForceMax = this.createVec(0, 80)
		},
		{
			LifeTimeMin = 0.1,
			LifeTimeMax = 0.2,
			ColorMin = this.createColor("9932CC00"),
			ColorMax = this.createColor("483D8B00"),
			ScaleMin = 0.85,
			ScaleMax = 1.4,
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
				LifeTimeMin = 0.1,
				LifeTimeMax = 0.2,
				ColorMin = this.createColor("ffffff00"),
				ColorMax = this.createColor("ffffff00"),
				ScaleMin = 0.5,
				ScaleMax = 0.5,
				RotationMin = 0,
				RotationMax = 359,
				VelocityMin = 60,
				VelocityMax = 100,
				DirectionMin = this.createVec(-0.4, 0.6),
				DirectionMax = this.createVec(0.4, 0.6),
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
				LifeTimeMin = 0.2,
				LifeTimeMax = 0.3,
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


