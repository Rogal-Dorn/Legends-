this.cartographer_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.cartographer";
		this.m.Name = "The Cartographer";
		this.m.Description = "The Cartographer is a man of culture and knowledge, but he also realizes that traveling in the company of well-armed mercenaries is one of the best ways to safely see the world and explore places that few visited before.";
		this.m.Image = "ui/campfire/cartographer_01";
		this.m.Cost = 1250;
		this.m.Effects = [
			"Pays you between 100 and 400 crowns for every location you discover on your own. The further away from civilization, the more you\'re paid. Legendary locations pay double."
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Discovered a legendary location"
			},
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Adventurous Noble/Lady, Noble Commander, Philosopher, Historian"
			}
		];
	}

	function onUpdate()
	{
	}

	function onEvaluate()
	{
	
		local hasHistorian = false;
		local brothers = this.World.getPlayerRoster().getAll();
		local availableBGs = [
			"background.adventurous_noble",
			"background.historian",
			"background.legend_philosopher",
			"background.female_adventurous_noble",
			"background.legend_commander_noble"
		];

		foreach( bro in brothers )
		{
			local id = bro.getBackground().getID();
			
			if (availableBGs.find(id) != null)
			{
				this.m.Requirements[1].IsSatisfied = true;
				break;
			}
		}	
		
		if (this.World.Flags.getAsInt("LegendaryLocationsDiscovered") >= 1)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}
	}

	function onLocationDiscovered( _location )
	{
		local settlements = this.World.EntityManager.getSettlements();
		local dist = 9999;

		foreach( s in settlements )
		{
			local d = s.getTile().getDistanceTo(_location.getTile());

			if (d < dist)
			{
				dist = d;
			}
		}

		local reward = this.Math.min(400, this.Math.max(100, 10 * dist));

		if (_location.isLocationType(this.Const.World.LocationType.Unique))
		{
			reward = reward * 2;
		}

		this.World.Assets.addMoney(reward);
	}

});

