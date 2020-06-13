this.legend_vala_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_vala";
		this.m.Name = "Vala";
		this.m.Icon = "ui/backgrounds/legend_vala.png";
		this.m.BackgroundDescription = "A Vala is a travelling seer, shaman and sorceress.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 20000;
		this.m.DailyCost = 24;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.fainthearted",
			"trait.insecure"
		];
		this.m.Titles = [
			"the Vala"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = this.Const.Bodies.AllFemale[this.Math.rand(0, this.Const.Bodies.AllFemale.len() - 1)];
		this.m.IsFemaleBackground = true;
		this.m.IsPerformingBackground = true;
		this.m.IsUntalented = true;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[3];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[3];
		this.m.Modifiers.Enchanting = 1.0;
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.LegendValaWarden,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.LegendValaInscribeShield
			],
			[
				this.Const.Perks.PerkDefs.LegendValaTranceMalevolent,
				this.Const.Perks.PerkDefs.FastAdaption,
				this.Const.Perks.PerkDefs.Colossus,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.Backstabber,
			],
			[
				this.Const.Perks.PerkDefs.LegendValaChantSenses,
				this.Const.Perks.PerkDefs.LegendValaPremonition,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.LegendValaInscribeHelmet
			],
			[
				this.Const.Perks.PerkDefs.LegendValaChantMastery,
				this.Const.Perks.PerkDefs.LegendValaTranceMastery,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendValaInscriptionMastery
			],
			[
				this.Const.Perks.PerkDefs.LegendValaChantDisharmony,
				this.Const.Perks.PerkDefs.LegendValaInscribeArmor,
				this.Const.Perks.PerkDefs.LegendGatherer
			],
			[
				this.Const.Perks.PerkDefs.LegendValaThreads,
				this.Const.Perks.PerkDefs.LegendMindOverBody,
				this.Const.Perks.PerkDefs.LegendValaSpiritualBond
			],
			[
				this.Const.Perks.PerkDefs.LegendValaChantFury,
				this.Const.Perks.PerkDefs.LegendValaInscribeWeapon,
				this.Const.Perks.PerkDefs.LegendFieldTriage,
				this.Const.Perks.PerkDefs.LegendPotionBrewer,
				this.Const.Perks.PerkDefs.PerfectFocus
			],
			[],
			[],
			[],
			[]
		];

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
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Most of the Vala\'s skills require her staff and scale in one way or another with the strength of her Resolve. Chants are sorcerous incantations delivered by song. These affect an area around the Vala and last until the start of her next turn. Trances are altered states entered into by the Vala. She will remain in these until her task is either completed or interrupted. Receiving damage of any kind, or becoming too fatigued to continue, will drop the Vala out of an active trance. "
			}			
		];
	}

	function onBuildDescription()
	{
		return "{%name% is a travelling seer, shaman and sorceress. Besides the ability to inscribe objects with magical rune sigils she also knows sorcerous incantations in the form of chants, and can induce trance states through which she may perceive and interact with the spirit world and the spirits therein.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-4, -6],
			Bravery = [10, 15],
			Stamina = [8, 12],
			MeleeSkill = [-2, -3],
			RangedSkill = [0, 0],
			MeleeDefense = [0, 0],
			RangedDefense = [0, 0],
			Initiative = [6, 9]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setName(this.Const.Strings.CharacterNamesFemaleNorse[this.Math.rand(0, this.Const.Strings.CharacterNamesFemaleNorse.len() - 1)]);
		actor.setTitle("the Vala");
		//this.m.Container.add(this.new("scripts/skills/perks/legend_vala_information"));
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = this.Math.rand(2, 3);
		this.getContainer().getActor().fillTalentValues(2, true);

		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/legend_staff_vala"));

		local r = this.Math.rand(0, 1);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/legend_vala_cloak"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/legend_vala_dress"));
		}
	}

		function onAddLegendEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = this.Math.rand(2, 3);
		this.getContainer().getActor().fillTalentValues(2, true);

		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/legend_staff_vala"));

		local r = this.Math.rand(0, 1);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/legend_armor/armor/legend_armor_vala_cloak"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/legend_armor/armor/legend_armor_vala_dress"));
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
