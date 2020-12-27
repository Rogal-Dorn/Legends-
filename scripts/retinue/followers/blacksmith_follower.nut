this.blacksmith_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.blacksmith";
		this.m.Name = "The Blacksmith";
		this.m.Description = "Mercenaries are good at getting arms and armor destroyed, but not at maintaining them. Promoting someone to the Blacksmith role will take care of this tedious task quickly and efficiently, and can mend even equipment otherwise thought lost.";
		this.m.Image = "ui/campfire/blacksmith_01";
		this.m.Cost = 1500;
		this.m.Effects = [
			"Repairs all armor, helmets, weapons and shields worn by your men even if they\'re broken or lost because your man died",
			"Increases repair speed by 33%"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have a mercenary who has taken the Field Repairs perk. Guaranteed on Blacksmiths, Ironmongers, and Crusaders"
			}
		];
	}

	function onUpdate()
	{
		if ("RepairSpeedMult" in this.World.Assets.m)
			this.World.Assets.m.RepairSpeedMult *= 1.33;
		if ("IsBlacksmithed" in this.World.Assets.m)
			this.World.Assets.m.IsBlacksmithed = true;
	}

	function onEvaluate()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local BGs = 0;
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("perk.legend_field_repairs"))
			{
                this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

