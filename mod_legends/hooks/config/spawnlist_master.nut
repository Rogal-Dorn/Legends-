::Const.World.Spawn.Troops.Zombie.Strength = 5;
::Const.World.Spawn.Troops.Zombie.Cost = 5;

::Const.World.Spawn.Troops.Schrat.Variant = 1;

::Const.World.Spawn.Troops.Orcwarrior.TitleList = this.Const.Strings.GoblinTitles;

::Const.World.Spawn.Troops.OrcWarlord.TitleList = this.Const.Strings.GoblinTitles;

::Const.World.Spawn.Troops.Peasant.Script = "scripts/entity/tactical/humans/legend_peasant";

::Const.World.Spawn.Troops.CaravanHand.Script = "scripts/entity/tactical/humans/legend_caravan_hand";

::Const.World.Spawn.Troops.CaravanGuard.Script = "scripts/entity/tactical/humans/legend_caravan_guard";

::Const.World.Spawn.Troops.BanditThug.Strength = 8;
::Const.World.Spawn.Troops.BanditThug.Cost = 8;
::Const.World.Spawn.Troops.BanditThug.Script = "scripts/entity/tactical/humans/legend_bandit_thug";

::Const.World.Spawn.Troops.BanditMarksmanLOW.Strength = 8;
::Const.World.Spawn.Troops.BanditMarksmanLOW.Cost = 8;
::Const.World.Spawn.Troops.BanditMarksmanLOW.Script = "scripts/entity/tactical/enemies/legend_bandit_poacher";

::Const.World.Spawn.Troops.BanditRaider.Script = "scripts/entity/tactical/enemies/legend_bandit_raider";

::Const.World.Spawn.Troops.BanditRaiderLOW.Script = "scripts/entity/tactical/enemies/legend_bandit_raider_low";

::Const.World.Spawn.Troops.BanditRaiderWolf.Script = "scripts/entity/tactical/enemies/legend_bandit_raider_wolf";

::Const.World.Spawn.Caravan =
{
	Name = "Caravan",
	IsDynamic = true,
	MovementSpeedMult = 0.5,
	VisibilityMult = 1.0,
	VisionMult = 0.25,
	Body = "cart_02",
	MaxR = 250,
	MinR = 30,
	Fixed = [
		{
			MinCount = 2,
			MaxCount = 3,
			Weight = 30
			Type = this.Const.World.Spawn.Troops.CaravanDonkey,
			Cost = 0
		}
	],
	Troops = [
		{
			Weight = 100,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.CaravanHand,
					Cost = 14
				},
				{
					Type = this.Const.World.Spawn.Troops.CaravanGuard,
					Cost = 17
				},
				{
					Type = this.Const.World.Spawn.Troops.MilitiaVeteran,
					Cost = 25
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendCaravanPolearm,
					Cost = 12
				}
			]
		}
	]
};

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

this.calculateCosts(this.Const.World.Spawn.Caravan);
