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
				Text = "Have at least one of the following backgrounds: Beggar, Cripple, Refugee, Slave"
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
		local brothers = this.World.getPlayerRoster().getAll();

		local availableBGs = [
			"background.beggar",
			"background.cripple",
			"background.refugee",
			"background.slave",
			"background.female_beggar",
			"background.legend_commander_beggar",
			"background.legend_commander_beggar_female"
		];

		foreach( bro in brothers )
		{
			local id = bro.getBackground().getID();

			if (availableBGs.find(id) != null)
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

