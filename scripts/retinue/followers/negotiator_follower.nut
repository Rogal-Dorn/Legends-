this.negotiator_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.negotiator";
		this.m.Name = "The Negotiator";
		this.m.Description = "The Negotiator is home to noble courts and fancy halls, and not used to travelling with a band of sellswords with muddy boots, but he is an expert on negotiating for the best prices and conditions when it comes to contracts.";
		this.m.Image = "ui/campfire/negotiator_01";
		this.m.Cost = 1500;
		this.m.Effects = [
			"Allows for more rounds of contract negotiations with your potential employers before they abort, and without any hit to relations"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have someone with the Pacifist perk, available on Widow, Inventor, Tailor and many others"
			}
		];
	}

	function onUpdate()
	{
		if ("NegotiationAnnoyanceMult" in this.World.Assets.m)
			this.World.Assets.m.NegotiationAnnoyanceMult = 0.5;
		if ("AdvancePaymentCap" in this.World.Assets.m)
			this.World.Assets.m.AdvancePaymentCap = 0.75;
	}

	function onNewDay()
	{
		this.onUpdate();
	}

	function onEvaluate()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("perk.legend_pacifist"))
			{
			this.m.Requirements[0].IsSatisfied = true;
			}

		}
	}

});

