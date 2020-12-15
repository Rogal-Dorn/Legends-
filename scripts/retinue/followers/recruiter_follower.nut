this.recruiter_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.recruiter";
		this.m.Name = "The Recruiter";
		this.m.Description = "The Recruiter is a sleazy jawsmith that tricks desperate people into joining a mercenary company to escape their poor lives, only to find their demise. Quite useful for anyone running a mercenary company.";
		this.m.Image = "ui/campfire/recruiter_01";
		this.m.Cost = 1500;
		this.m.Effects = [
			"Makes you pay 10% less up front for hiring new men, and 50% less for tryouts",
			"Makes between 2 and 4 additional men available to recruit in every settlement"
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
		if ("RosterSizeAdditionalMin" in this.World.Assets.m)
			this.World.Assets.m.RosterSizeAdditionalMin += 2;
		if ("RosterSizeAdditionalMax" in this.World.Assets.m)
			this.World.Assets.m.RosterSizeAdditionalMax  += 4;
		if ("HiringCostMult" in this.World.Assets.m)
			this.World.Assets.m.HiringCostMult *= 0.9;
		if ("TryoutPriceMult" in this.World.Assets.m)
			this.World.Assets.m.TryoutPriceMult *= 0.5;
	}

	function onEvaluate()
	{
		this.m.Requirements[0].Text = "Have a mercenary who has taken the Inspiring Presence perk, available from Cultists, Pimps, Retired Soldiers and many others.";

		local brothers = this.World.getPlayerRoster().getAll();
		
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("perk.inspiring_presence"))
			{
			this.m.Requirements[0].IsSatisfied = true;
			}

		}
	}

});

