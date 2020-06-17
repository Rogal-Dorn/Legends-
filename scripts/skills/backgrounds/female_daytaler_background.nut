this.female_daytaler_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_daytaler";
		this.m.Name = "Washerwoman";
		this.m.Icon = "ui/backgrounds/washerwoman.png";
		this.m.BackgroundDescription = "Washerwomen are used to all kinds of physical work, scrubbing isn't easy work.";
		this.m.GoodEnding = "%name% the washerwoman retired from fighting and, well, she keeps working with her hands. Now she\'s back to the scrubbing board and boiling water instead of slaying beasts and crushing heads. She took all his mercenary money to purchase a bit of land and settle down. While not the richest woman, word has it that there is hardly a happier woman in the realm.";
		this.m.BadEnding = "%name% retired from fighting while she still had most of his fingers and toes intact. She went back to working for the nobility. Last you heard she was out {south | north | east | west} running the laundry house for some nobleman. Sadly, you also heard that wash house collapsed halfway through its construction with many workers going down with it.";
		this.m.HiringCost = 60;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.fear_undead",
			"trait.hate_beasts",
			"trait.hate_undead",
			"trait.hate_greenskins"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsLowborn = true;
		this.m.IsFemaleBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Notorious;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[1];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.HammerTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.StavesTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.FitTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.CalmTree
			],
			Enemy = [],
			Class = [this.Const.Perks.FistsClassTree],
			Magic = []
		}
	}

	function onBuildDescription()
	{
		return "{Working here and there | With no steady work | Working on and off | Doing this and that | Having learned no craft}, %name% is known as a washerwoman, someone to ask whenever the linens need their rinse. {Work had been sparse for a while now, so | There was little work to be a had these past weeks, so | %name% wanted to do something she had not done before, so | Despite having no experience in battle, staring too deep into the bottle made her believe that | %name% considered the fighting profession one that doesn\'t run out of work these days, so | %name% lost her loved one to sickness, as befalls so many these days, and broke down. After weeks blurred by drinking her sorrows away,} a travelling mercenary company seemed a good opportunity {to seek redemption | to earn some coin | to see a bit of the world | to clear her head | to get her to the next village while filling her pockets}.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				-5
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				3,
				8
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

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/legend_shovel"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/legend_staff"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0 || r == 1)
		{
			items.equip(this.new("scripts/items/armor/legend_maid_apron"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/legend_maid_dress"));
		}
		else
		{
			local item = this.new("scripts/items/armor/linen_tunic");
			item.setVariant(this.Math.rand(6, 7));
			items.equip(item);
		}


		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/legend_shovel"));
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
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[1, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"],
			[1, "cloth/legend_peasant_dress"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)
		items.equip(armor)

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
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
