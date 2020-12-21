this.alchemist_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.alchemist";
		this.m.Name = "The Alchemist";
		this.m.Description = "The Alchemist is knowledgeable in crafting all kinds of mysterious contraptions and concoctions from exotic ingredients when given access to taxidermist equipment, and uses less material to do so.";
		this.m.Image = "ui/campfire/alchemist_01";
		this.m.Cost = 1250;
		this.m.Effects = [
			"Has a 25% chance of not consuming any crafting component used by you",
			"Unlocks \'Snake Oil\' recipe to earn money by crafting from various low tier components"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = ""
			},
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Herbalist, Taxidermist, Druid"
			}
		];
	}

	function isValid()
	{
		return this.Const.DLC.Unhold;
	}

	function onUpdate()
	{
	}

	function onEvaluate()
	{
		this.m.Requirements[0].Text = "Crafted " + this.Math.min(15, this.World.Statistics.getFlags().getAsInt("ItemsCrafted")) + "/10 items";

		local brothers = this.World.getPlayerRoster().getAll();
		local availableBGs = [
			"background.legend_herbalist",
			"background.legend_taxidermist",
			"background.legend_druid",
			"background.legend_commander_druid"
		];

		foreach( bro in brothers )
		{
			local id = bro.getBackground().getID();
			
			if (availableBGs.find(id))
			{
				this.m.Requirements[1].IsSatisfied = true;
				break;
			}
		}	

		if (this.World.Statistics.getFlags().getAsInt("ItemsCrafted") >= 10)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}
		
	}

});

