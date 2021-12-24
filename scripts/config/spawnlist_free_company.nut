local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.FreeCompany <-
{
	Name = "FreeCompany",
	IsDynamic = true,
	MovementSpeedMult = 0.95,
	VisibilityMult = 200,
	VisionMult = 200,
	Body = "figure_bandit_03",
	MaxR = 690,
	MinR = 97,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.FreeCompanyLeader,
			Cost = 30,
			Weight = 0, //0 Weight guarentees this will be added
		}
	],
	Troops = [ //weights dont add up to 100 but it doesn't really matter : total weight is of 120
		{
			Weight = 60, //frontline shielded units
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySpearman,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanySlayer,
					Cost = 22
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyFootman,
					Cost = 22
				}
			]
		},
		{
			Weight = 10, //just the dog
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 8
				}
			]
		},
		{
			Weight = 20, //backline archers
			Types =
			[
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyArcher,
					Cost = 15
				}
				,
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyCrossbow,
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyLongbow,
					Cost = 25
				}
			]
		},
		{
			Weight = 20, //backline 2tile range
			Types =[
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyBillman,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyPikeman,
					Cost = 20
				}
			]
		},
		{
			Weight = 10, //frontline 2handers
			Types =[
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyInfantry,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.FreeCompanyLeader,
					Cost = 30
				}
			]
		}
	]
}