this.surgeon_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.surgeon";
		this.m.Name = "The Surgeon";
		this.m.Description = "The Surgeon is a walking tome of anatomical knowledge. A mercenary company seems the perfect place both to apply that knowledge in healing, but also to learn more about how the insides of men are made up.";
		this.m.Image = "ui/campfire/surgeon_01";
		this.m.Cost = 1750;
		this.m.Effects = [
			"Makes every man without a permanent injury guaranteed to survive an otherwise fatal blow",
			"Makes every injury take one less day to heal"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have someone with the Field Triage perk. Guaranteed on Monks and Nuns"
			}
		];
	}

	function onUpdate()
	{
		if ("IsSurvivalGuaranteed" in this.World.Assets.m)
			this.World.Assets.m.IsSurvivalGuaranteed = true;
	}

	function onEvaluate()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("perk.legend_field_triage"))
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

