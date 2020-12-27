this.minstrel_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.minstrel";
		this.m.Name = "The Minstrel";
		this.m.Description = "A good song and story play a large part in creating the reputation of a company. The Minstrel is a master of these crafts and will help to spread the word about your deeds to all ears - willing to hear them or not.";
		this.m.Image = "ui/campfire/minstrel_01";
		this.m.Cost = 1000;
		this.m.Effects = [
			"Makes you earn 15% more renown with every action",
			"Makes tavern rumors more likely to contain useful information"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have someone with the Entice perk. Guaranteed on Minstrels and Troubadours"
			}
		];
	}

	function onUpdate()
	{
		if ("BusinessReputationRate" in this.World.Assets.m)
			this.World.Assets.m.BusinessReputationRate *= 1.15;
		if ("IsNonFlavorRumorsOnly" in this.World.Assets.m)
			this.World.Assets.m.IsNonFlavorRumorsOnly = true;
	}

	function onEvaluate()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("perk.legend_entice"))
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

