this.brigand_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.brigand";
		this.m.Name = "The Brigand";
		this.m.Description = "The Brigand may be old and weak now, but at one point his name was feared across the land. In exchange for a hot meal he happily shares with you what he learns from his contacts about caravans on the road.";
		this.m.Image = "ui/campfire/brigand_01";
		this.m.Cost = 2500;
		this.m.Effects = [
			"Makes you see the position of some caravans at all times and even if outside your sight radius"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = ""
			}
		];
	}

	function onUpdate()
	{
		if ("IsBrigand" in this.World.Assets.m)
			this.World.Assets.m.IsBrigand = true;
	}

	function onEvaluate()
	{
		this.m.Requirements[0].Text = "Have a Raider, Barbarian or Deserter in your company";
		
		local hasRaider = 0;
		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.raider" || bro.getBackground().getID() == "background.barbarian" || bro.getBackground().getID() == "background.deserter" )
			{
		this.m.Requirements[0].IsSatisfied = true;
			}

		}	


	}

});

