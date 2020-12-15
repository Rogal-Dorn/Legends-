this.scavenger_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.scavenger";
		this.m.Name = "The Scavenger";
		this.m.Description = "Whether the son of one of your men or an urchin you took pity on, the Scavenger pulls their weight by collecting bits and pieces from every battlefield.";
		this.m.Image = "ui/campfire/scavenger_01";
		this.m.Cost = 1500;
		this.m.Effects = [
			"Recovers a part of all ammo you use during battle",
			"Recovers tools and supplies from every armor destroyed by you during battle"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have a beggar, cripple, refugee or slave in your company "
			}
		];
	}

	function onUpdate()
	{
		if ("IsRecoveringAmmo" in this.World.Assets.m)
			this.World.Assets.m.IsRecoveringAmmo = true;
		if ("IsRecoveringArmor" in this.World.Assets.m)
			this.World.Assets.m.IsRecoveringArmor = true;
	}

	function onEvaluate()
	{
	
		local hasRaider = 0;
		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.beggar" || bro.getBackground().getID() == "background.cripple" || bro.getBackground().getID() == "background.refugee" || bro.getBackground().getID() == "background.slave" )
			{
			hasRaider++;
			}

		}		
		this.m.Requirements[0].IsSatisfied = true;
	}

});

