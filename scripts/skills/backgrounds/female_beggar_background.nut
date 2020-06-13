this.female_beggar_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_beggar";
		this.m.Name = "Widow";
		this.m.Icon = "ui/backgrounds/widow.png";
		this.m.BackgroundDescription = "Widows who can\'t find another husband have few choices, mercenary work is a last resort of the hopeless.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the woman made a pretty crown in her time with the mercenary company, yet the other day you saw her out begging again. You asked if she\'d wasted all his money and he laughed. He said she\'d purchased land and was doing just fine. Then she held out her little tin and asked for a crown. You gave her two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, she went back to begging. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to her finger.";
		this.m.HiringCost = 30;
		this.m.DailyCost = 3;
		this.m.Excluded = [
			"trait.optimist",
			"trait.tough",
			"trait.strong",
			"trait.cocky",
			"trait.fat",
			"trait.bright",
			"trait.greedy",
			"trait.athletic"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Jilted",
			"the Alone",
			"the Rejected",
			"the Abandoned",
			"the Broken Heart",
			"the Neglected",
			"the Discarded",
			"the Forsaken",
			"the Spurned",
			"the Rebuffed",
			"the Melancholy",
			"the Sorrowful",
			"the Downcast"
		];
		this.m.Faces = this.Const.Faces.OldFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.NeutralMax;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.IsLowborn = true;
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SlingsTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.MartyrTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.OrganisedTree
			],
			Enemy = [],
			Class = [],
			Magic = []
		}
	}

	//Default Female
	function setGender(_gender = -1)
	{
		local r = _gender;
		if (_gender == -1)
		{
			r = 1;
			if (this.Const.LegendMod.Configs.LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r == 1)
		{
			return;
		}
		this.m.IsFemaleBackground = false;
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.All;
		this.m.Body = "bust_naked_body_01";
		this.m.Name = "Widower";
		this.m.BackgroundDescription = "Widowers who are too old or poor to find another wife have few ties, mercenary work is a last resort of the hopeless.";
		this.m.GoodEnding = "Having enough of all the fighting, %name% the once-beggar retired from the %companyname%. You know the man made a pretty crown in his time with the mercenary company, yet the other day you saw him out begging again. You asked if he\'d wasted all his money and he laughed. He said he\'d purchased land and was doing just fine. Then he held out his little tin and asked for a crown. You gave him two.";
		this.m.BadEnding = "The fighting life is a rough one, and %name% the once-beggar saw fit to retire from it before it became a deadly one. Unfortunately, he went back to beggaring. Word has it that a nobleman cleaned a city of riff-raff and sent them marching north despite it being winter. Cold and hungry, %name% died on the side of a road, a tin cup frozen to his finger.";

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
		if(this.m.IsFemaleBackground == true)
		{
			return "{After losing her husband to a fire | After her husband\'s gambling addiction got the better of him | Her husband was framed for a crime he didn\'t commit, and having to pay the constable everything to keep herself out of the dungeons | A refugee and widow after her village was burned to the ground | Banished from her home after a violent struggle with her husband | A woman with few talents and no husband | After being released alone from a lord\'s dungeon where she spent countless years chained to a wall | After giving all her worldly possessions to an obscure cult that took her husband and promised salvation of her eternal soul | Married to a very intelligent man until a brigand knocked him over the head}, {%name% found herself on the streets, | %name% was forced onto the streets,} {having to beg for bread | depending on the goodwill of others | being beaten and resigned to her fate | spending what little coin she had to drink the days away | digging into the trash of others and scurrying away from lawmen | avoiding ruffians and thugs while she begged for crowns}. {While she seems earnest in becoming a mercenary, there is little doubt that all his time on the street, and her former marriage, have robbed %name% of her best years. | Years have passed and took a toll on her health by now. | Once a woman like %name% has spent a few days on the streets, much less a few years, even the very dangerous job of being a sellsword seems like the greenest of pastures. | Only the gods know what %name% has done to survive, but she is a frail woman standing before you now. | At the sight of you she rises with open arms to embrace you, claiming to know you well from years past and many a shared adventure, although your name escapes her at the moment.}";
		}
		else
		{
			return "{After losing his wife to a fire | After his wife\'s gambling addiction got the better of her | His wife was framed for a crime she didn\'t commit, and having to pay the constable everything to keep himself out of the dungeons | A refugee and widower after his village was burned to the ground | Banished from his home after a violent struggle with his wife | A man with few talents and no wife | After being released alone from a lord\'s dungeon where he spent countless years chained to a wall | After giving all his worldly possessions to an obscure cult that took his wife and promised salvation of his eternal soul | Married to a very intelligent woman until a brigand knocked her over the head}, {%name% found himself on the streets, | %name% was forced onto the streets,} {having to beg for bread | depending on the goodwill of others | being beaten and resigned to his fate | spending what little coin he had to drink the days away | digging into the trash of others and scurrying away from lawmen | avoiding ruffians and thugs while he begged for crowns}. {While he seems earnest in becoming a mercenary, there is little doubt that all his time on the street, and his former marriage, have robbed %name% of his best years. | Years have passed and took a toll on his health by now. | Once a man like %name% has spent a few days on the streets, much less a few years, even the very dangerous job of being a sellsword seems like the greenest of pastures. | Only the gods know what %name% has done to survive, but he is a frail man standing before you now. | At the sight of you he rises with open arms to embrace you, claiming to know you well from years past and many a shared adventure, although your name escapes him at the moment.}";
		}
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
				5,
				5
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

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();

		if(this.m.IsFemaleBackground == true)
		{
			actor.setName(this.Const.Strings.CharacterNamesFemale[this.Math.rand(0, this.Const.Strings.CharacterNamesFemale.len() - 1)]);
		}
		else
		{
			actor.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
		}
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
			items.equip(this.new("scripts/items/weapons/legend_staff"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_wraps"));
		}
		if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/legend_maid_dress"));
		}
		if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/legend_maid_apron"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			local item = this.new("scripts/items/helmets/hood");
			item.setVariant(38);
			items.equip(item);
		}
	}

	function onAddLegendEquipment()
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
			items.equip(this.new("scripts/items/weapons/legend_staff"));
		}

		local cloths = [
            [0, ""],
			[0, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[0, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[1, "cloth/legend_sackcloth"],
			[1, "cloth/legend_sackcloth_patched"],
			[1, "cloth/legend_sackcloth_tattered"],
			[0, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)
		items.equip(armor)


		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			local item = this.new("scripts/items/helmets/hood");
			item.setVariant(38);
			items.equip(item);
		}
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();

		if (actor.getTags().has("IsPlayerCharacter"))
		{
			actor.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
				"sounds/humans/f2_little_damage_taken_1.wav",
				"sounds/humans/f2_little_damage_taken_2.wav",
				"sounds/humans/f2_little_damage_taken_3.wav",
				"sounds/humans/f2_little_damage_taken_4.wav",
				"sounds/humans/f2_little_damage_taken_5.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
				"sounds/humans/f2_damage_taken_1.wav",
				"sounds/humans/f2_damage_taken_2.wav",
				"sounds/humans/f2_damage_taken_3.wav",
				"sounds/humans/f2_damage_taken_4.wav",
				"sounds/humans/f2_damage_taken_5.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Death] = [
				"sounds/humans/f2_death_1.wav",
				"sounds/humans/f2_death_1.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Fatigue] = [
				"sounds/humans/f2_fatigue_1.wav",
				"sounds/humans/f2_fatigue_2.wav",
				"sounds/humans/f2_fatigue_3.wav",
				"sounds/humans/f2_fatigue_4.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
				"sounds/humans/f2_move_5.wav",
				"sounds/humans/f2_fatigue_3.wav",
				"sounds/humans/f2_fatigue_4.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
				"sounds/humans/f2_idle_1.wav",
				"sounds/humans/f2_idle_2.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Move] = [
				"sounds/humans/f2_move_1.wav",
				"sounds/humans/f2_move_2.wav",
				"sounds/humans/f2_move_3.wav",
				"sounds/humans/f2_move_4.wav",
				"sounds/humans/f2_move_5.wav",
				"sounds/humans/f2_move_6.wav"
			];
		}
		else
		{
			actor.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
				"sounds/humans/legends/woman_light_01.wav",
				"sounds/humans/legends/woman_light_02.wav",
				"sounds/humans/legends/woman_light_03.wav",
				"sounds/humans/legends/woman_light_04.wav",
				"sounds/humans/legends/woman_light_05.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
				"sounds/humans/legends/woman_injury_01.wav",
				"sounds/humans/legends/woman_injury_02.wav",
				"sounds/humans/legends/woman_injury_03.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Death] = [
				"sounds/humans/legends/woman_death_01.wav",
				"sounds/humans/legends/woman_death_02.wav",
				"sounds/humans/legends/woman_death_03.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Fatigue] = [
				"sounds/humans/legends/woman_fatigue_01.wav",
				"sounds/humans/legends/woman_fatigue_02.wav",
				"sounds/humans/legends/woman_fatigue_03.wav",
				"sounds/humans/legends/woman_fatigue_04.wav",
				"sounds/humans/legends/woman_fatigue_05.wav",
				"sounds/humans/legends/woman_fatigue_06.wav",
				"sounds/humans/legends/woman_fatigue_07.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
				"sounds/humans/legends/woman_flee_01.wav",
				"sounds/humans/legends/woman_flee_02.wav",
				"sounds/humans/legends/woman_flee_03.wav",
				"sounds/humans/legends/woman_flee_04.wav",
				"sounds/humans/legends/woman_flee_05.wav",
				"sounds/humans/legends/woman_flee_06.wav"
			];
			actor.m.SoundPitch = this.Math.rand(105, 115) * 0.01;
		}
	}

});
