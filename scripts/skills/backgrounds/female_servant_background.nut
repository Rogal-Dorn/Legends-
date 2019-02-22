this.female_servant_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_servant";
		this.m.Name = "Housemaid";
		this.m.Icon = "ui/backgrounds/housemaid.png";
		this.m.BackgroundDescription = "Housemaids are often not used to hard physical labor.";
		this.m.GoodEnding = "As it turns out, %name% the housemaids had been stowing away every last crown she had earned with the %companyname%. When she had enough, she retired and bought herself some land and slowly worked her way up the social ladder. She died in a comfortable bed, surrounded by friends, family, and loyal servants.";
		this.m.BadEnding = "%name% the servant grew tired of the sellsword life and left the company. She returned to serving nobility. When raiders attacked her liege\'s castle, the nobleman pushed the housemaid out the door with only a kitchen knife to defend herself with. She was found headless in a pile of broken chairs, a few dead raiders littered around her.";
		this.m.HiringCost = 45;
		this.m.DailyCost = 4;
		this.m.Excluded = [
			"trait.huge",
			"trait.hate_undead",
			"trait.hate_greenskins",
			"trait.hate_beasts",
			"trait.impatient",
			"trait.iron_jaw",
			"trait.brute",
			"trait.athletic",
			"trait.strong",
			"trait.disloyal",
			"trait.fat",
			"trait.brave",
			"trait.fearless",
			"trait.optimistic",
			"trait.cocky",
			"trait.bright",
			"trait.determined",
			"trait.greedy",
			"trait.sure_footing",
			"trait.bloodthirsty"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsOffendedByViolence = true;
		this.m.IsFemaleBackground = true;
	}

	function onBuildDescription()
	{
		return "{Life is difficult. Moreso for some than others. | Some women can fall from grace. Other women have nowhere to fall to, having been born already on the ground. | If life is a throw of dice, maybe some are fools to be women rather than mice.} %name% {was a servant to a decadent lord. | served an abusive family where the kids played with fire. | was kidnapped by brigands and forced to serve their every. Last. Need. | worked feverishly for mad men who looked far too long at the stars.}  She rarely made a mistake about her place in the world. One day, though, her masters {beat her unconscious. When she awoke, hse did so in the bed of a benevolent doctor who refused to return her to her \'employers\'. Instead, %name% was free to go and her masters were told she had died. | set her free, no questions asked. Not one to dally on ceremony, %name% left in earnest. | invited her to a party. Believing she was a guest, she showed up in her finest attire - a shirt with hemmed sleeves and a billowy dress that hid her skeletal frame well. Unfortunately, she was but a show for the party - they gave her a wooden shield and sword, threw her into an arena with a wild boar, and took bets as they watched the horrific spectacle. She barely escaped the \'festivities\'.} {%name% has since sworn to never \'serve\' someone again. | The woman, though now free of her duties, still bears a great deal of humiliation and pain from her long, hard life.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				-10
			],
			Bravery = [
				-5,
				-5
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				2,
				0
			],
			Initiative = [
				5,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/sackcloth"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
	}

});
