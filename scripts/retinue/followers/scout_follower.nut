this.scout_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.scout";
		this.m.Name = "The Scout";
		this.m.Description = "The Scout is an expert in finding mountain passes, navigating through treacherous swamps, and guiding anyone safely through the darkest of forests.";
		this.m.Image = "ui/campfire/scout_01";
		this.m.Cost = 1250;
		this.m.Effects = [
			"Makes the company travel 15% faster on any terrain",
			"Prevents sickness and accidents due to terrain"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Wildman/Wildwoman, Hunter, Lumberjack, Ranger"
			}
		];
	}

	function onUpdate()
	{
		if ("TerrainTypeSpeedMult" in this.World.Assets.m) {
			for( local i = 0; i < this.World.Assets.m.TerrainTypeSpeedMult.len(); i = ++i )
			{
				this.World.Assets.m.TerrainTypeSpeedMult[i] *= 1.15;
			}
		}
	}

	function onEvaluate()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		local availableBGs = [
			"background.wildman",
			"background.wildwoman",
			"background.hunter",
			"background.lumberjack",
			"background.legend_ranger",
			"background.legend_commander_ranger"
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

