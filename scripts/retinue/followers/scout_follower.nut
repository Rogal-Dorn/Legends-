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
				Text = "Have a Wildling, Hunter, Lumberjack or Ranger"
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
		this.m.Requirements[0].Text = "Have a Raider, Barbarian or Deserter in your company";
		
		local hasRaider = 0;
		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.wildman" ||bro.getBackground().getID() == "background.wildwoman" || bro.getBackground().getID() == "background.hunter" || bro.getBackground().getID() == "background.lumberjack" || bro.getBackground().getID() == "background.legend_ranger"  || bro.getBackground().getID() == "background.legend_commander_ranger")
			{
		this.m.Requirements[0].IsSatisfied = true;
			}

		}	
	}

});

