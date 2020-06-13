this.female_minstrel_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_minstrel";
		this.m.Name = "Troubadour";
		this.m.Icon = "ui/backgrounds/background_42.png";
		this.m.BackgroundDescription = "A good troubadour will sing a saga to inspire the men, play the flute to calm them, or entertain them with poetry around the camp fire. A lute is not a weapon, however, and minstrels are often not used to physical labor or bloodshed.";
		this.m.GoodEnding = "Ah, %name%. What an addition to the %companyname%! The minstrel not only became an excellent fighter, but was crucial in keeping the men\'s spirits high in the toughest of times. A poet and actor at heart, she eventually retired from the company and started up a theater company. She currently performs plays for both the nobility and laymen. The minstrel does not yet realize it, but her playful wit and sharp commentary are slowly bringing the classes together.";
		this.m.BadEnding = "Never a fighter at heart, %name% the minstrel quickly left the declining %companyname%. She and a group of musicians and jesters spend their evenings performing for drunken noblemen. You managed to see one of these performances for yourself. %name% spent much of the time being berated by the inebriated and having half-eaten chicken bones thrown at her. One of the nobles even thought it\'d be funny to set a dog loose on one of the jesters. You could see the minstrel\'s dreams dying in her eyes, but the show went on.";
		this.m.HiringCost = 65;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.huge",
			"trait.iron_jaw",
			"trait.athletic",
			"trait.craven",
			"trait.dumb",
			"trait.strong",
			"trait.tough",
			"trait.dumb",
			"trait.brute",
			"trait.clubfooted",
			"trait.dastard",
			"trait.insecure",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"the Minstrel",
			"the Skjald",
			"the Poet",
			"Songbird",
			"the Troubadour",
			"the Singer",
			"the Lover",
			"the Bard"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Notorious;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.IsFemaleBackground = true;
		this.m.IsCrusaderRecruitBackground = true;
		this.m.IsPerformingBackground = true;
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[1];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.MaceTree,
				this.Const.Perks.StavesTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.DaggerTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.FastTree
			],
			Enemy = [this.Const.Perks.NoblesTree],
			Class = [
					this.Const.Perks.BardClassTree,
					this.Const.Perks.JugglerClassTree],
			Magic = []
		}
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
		return "\"{I can swing a sword and cleave an axe, | One might ask of me a task, | Right with god, but in the left a flask,} {and I say, \'You question a woman who wears no mask?\'. | and so I have to move quick, but not quite fast.} {Stare down the stuffed bears I did, | Into my frayed pantaloons I bid, | Along the muddy roads my boots skid,} {and so of many things I am rid. | truth! My shameful talent is to - ferociously! - knit.} {So take me along your adventure, | Bring me with your men who clatter and clamber, | Hand me your shield and that thing shaped like a member,} {and let us go and bid fear a farewell to remember! | and let\'s - oh, ow! I have a splinter! | and may we come, one and all, to a healthy next-winter!}\". {The woman speaks gibberish. | It rhymes!}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-15,
				-15
			],
			Bravery = [
				10,
				15
			],
			Stamina = [
				-5,
				 0
			],
			MeleeSkill = [
				-5,
				-5
			],
			RangedSkill = [
				10,
				10
			],
			MeleeDefense = [
				-10,
				-10
			],
			RangedDefense = [
				5,
				10
			],
			Initiative = [
				5,
				5
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local armor = this.new("scripts/items/armor/linen_tunic");
		armor.setVariant(this.Math.rand(3, 4));
		items.equip(armor);
		local r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}

		local r = this.Math.rand(0, 4);
		if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/lute"));
		}
		if (r >= 2)
		{
			items.equip(this.new("scripts/items/weapons/legend_drum"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/legend_armor/cloth/legend_tunic"));
		local r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}

		local r = this.Math.rand(0, 4);
		if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/lute"));
		}
		if (r >= 2)
		{
			items.equip(this.new("scripts/items/weapons/legend_drum"));
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
