local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.GreenskinHorde <-
{
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_02",
	Troops = [
		{
			Weight = 70,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
					Cost = 30
				},			
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					Cost = 40
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 60
				}				
			]
		},
		{
			Weight = 20
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 20
				},
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
					Type = this.Const.World.Spawn.Troops.GoblinOverseer,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 35
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 80
				},
				{
					Type = this.Const.World.Spawn.Troops.OrcWarlord,
					Cost = 50
				}
			]
		}		
	]
}