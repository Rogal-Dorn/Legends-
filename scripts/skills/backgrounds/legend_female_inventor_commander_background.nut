this.legend_female_inventor_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_female_commander_inventor";
		this.m.Name = "Inventor";
		this.m.Icon = "ui/backgrounds/legend_inventor.png";
		this.m.BackgroundDescription = "Inventors are trenchant problem solvers, fueled by a burning passion for knowledge.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 120;
		this.m.DailyCost = 12;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.dumb",
			"trait.superstitious"
		];
		this.m.Titles = [
			"the Inventor",
			"the Curious",
			"the Peculiar",
			"the Inquisitive",
			"the Utilitarian",
			"the Serendipitous",
			"the Eclectic",
			"the Tinkerer"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[3];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.FastAdaption,
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendDaze
			],
			[
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.Bullseye,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.SteelBrow,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.Gifted,
			],
			[
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Brawny,
				this.Const.Perks.PerkDefs.Relentless,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.LegendEntice,
				this.Const.Perks.PerkDefs.LegendPush
			],
			[
				this.Const.Perks.PerkDefs.SpecMace,
				this.Const.Perks.PerkDefs.SpecFlail,
				this.Const.Perks.PerkDefs.SpecHammer,
				this.Const.Perks.PerkDefs.SpecAxe,
				this.Const.Perks.PerkDefs.SpecCleaver,
				this.Const.Perks.PerkDefs.SpecSword,
				this.Const.Perks.PerkDefs.SpecDagger,
				this.Const.Perks.PerkDefs.SpecPolearm,
				this.Const.Perks.PerkDefs.SpecSpear,
				this.Const.Perks.PerkDefs.SpecCrossbow,
				this.Const.Perks.PerkDefs.SpecBow,
				this.Const.Perks.PerkDefs.SpecThrowing
				this.Const.Perks.PerkDefs.SpecThrowing,
			],
			[
				this.Const.Perks.PerkDefs.LoneWolf,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.ReachAdvantage,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LegendStunned
			],
			[
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.Nimble,
				this.Const.Perks.PerkDefs.BattleForged,
				this.Const.Perks.PerkDefs.Ballistics,
				this.Const.Perks.PerkDefs.LegendScry
			],
			[
				this.Const.Perks.PerkDefs.Fearsome,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.KillingFrenzy,
				this.Const.Perks.PerkDefs.Indomitable
				this.Const.Perks.PerkDefs.LegendRelax,
				this.Const.Perks.PerkDefs.LegendFirefield
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
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] Experience Gain"
			}
		];
	}

	function onBuildDescription()
	{
		return "{Having spent most of his life in and around %townname%, covered in books, conducting various experiments and creating all sort of contraptions, %name% eventually turned his eyes towards knights, soldiers, sellswords, brigands and others that live and die by the sword. Perhaps his knowledge could be applied to their circumstances? Could he possibly become a great fighter himself? Tempted and intrigued by his own thoughts, he wasted no time setting out to look for a mercenary company that would consider taking him in. What could go wrong?}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
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
		actor.setTitle(this.Const.Strings.InventorTitles[this.Math.rand(0, this.Const.Strings.InventorTitles.len() - 1)]);
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 1);

		if (r <= 1)
		{
			items.equip(this.new("scripts/items/armor/apron"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/mouth_piece"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		local cloths = [
            [0, ""],
			[0, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[0, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[1, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[0, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)
		items.equip(armor)

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/mouth_piece"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
	}
	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.XPGainMult *= 1.2;
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

