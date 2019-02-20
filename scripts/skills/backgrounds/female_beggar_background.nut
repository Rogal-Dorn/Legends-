this.female_beggar_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_beggar";
		this.m.Name = "Widow";
		this.m.Icon = "ui/backgrounds/background_18.png";
		this.m.BackgroundDescription = "Widows are in a bad situation, and living on the street tends to be detrimental to their health.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the woman made a pretty crown in his time with the mercenary company, yet the other day you saw her out begging again. You asked if she\'d wasted all his money and he laughed. He said she\'d purchased land and was doing just fine. Then she held out her little tin and asked for a crown. You gave her two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, she went back to begging. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to her finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 3;
		this.m.Excluded = [
			"trait.iron_jaw",
			"trait.tough",
			"trait.strong",
			"trait.cocky",
			"trait.fat",
			"trait.bright",
			"trait.fearless",
			"trait.brave",
			"trait.determined",
			"trait.deathwish",
			"trait.greedy",
			"trait.athletic"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Dirty",
			"the Poor",
			"the Ragged",
			"the Sick",
			"the Liar",
			"the Idle",
			"the Sloth",
			"the Useless",
			"the Beggar",
			"the Weasel",
			"the Skunk",
			"the Sluggard",
			"the Homeless"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.Body = "bust_naked_body_03";
		this.m.IsLowborn = true;
		this.m.IsFemaleBackground = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onBuildDescription()
	{
		return "{After losing her husband to a fire | After her husband\'s gambling addiction got the better of him | Her husband was framed for a crime he didn\'t commit, and having to pay the constable everything to keep herself out of the dungeons | A refugee and widow after her village was burned to the ground | Banished from her home after a violent struggle with her husband | A woman with few talents and no husband | After being released alone from a lord\'s dungeon where she spent countless years chained to a wall | After giving all her worldly possessions to an obscure cult that took her husband and promised salvation of her eternal soul | Married to a very intelligent man until a brigand knocked him over the head}, {%name% found herself on the streets, | %name% was forced onto the streets,} {having to beg for bread | depending on the goodwill of others | being beaten and resigned to her fate | spending what little coin she had to drink the days away | digging into the trash of others and scurrying away from lawmen | avoiding ruffians and thugs while she begged for crowns}. {While she seems earnest in becoming a mercenary, there is little doubt that all his time on the street, and her former marriage, have robbed %name% of her best years. | Years have passed and took a toll on her health by now. | Once a woman like %name% has spent a few days on the streets, much less a few years, even the very dangerous job of being a sellsword seems like the greenest of pastures. | Only the gods know what %name% has done to survive, but she is a frail woman standing before you now. | At the sight of you she rises with open arms to embrace you, claiming to know you well from years past and many a shared adventure, although your name escapes her at the moment.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-15,
				-15
			],
			Bravery = [
				-10,
				-5
			],
			Stamina = [
				-5,
				-5
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
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local dirt = actor.getSprite("dirt");
		dirt.Visible = true;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_wraps"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			local item = this.new("scripts/items/helmets/hood");
			item.setVariant(38);
			items.equip(item);
		}
	}

});
