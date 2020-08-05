this.legend_crusader_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_crusader";
		this.m.Name = "Holy Crusader";
		this.m.Icon = "ui/backgrounds/crusader.png";
		this.m.HiringCost = 1000;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.paranoid",
			"trait.night_blind",
			"trait.swift",
			"trait.ailing",
			"trait.brute",
			"trait.bloodthirsty",
			"trait.greedy",
			"trait.gluttonous",
			"trait.dumb",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.asthmatic",
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Body = "bust_naked_body_02";
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Good;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Level = 1;
		this.m.IsCombatBackground = true;
		this.m.IsOffendedByViolence = true;
		this.m.IsUntalented = true;
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[2];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.GreatSwordTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.ShieldTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.TrainedTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.MartyrTree,
				this.Const.Perks.InspirationalTree
				this.Const.Perks.FitTree
			],
			Enemy = [
					this.Const.Perks.ZombieTree,
					this.Const.Perks.SkeletonTree
					],
			Class = [this.Const.Perks.FaithClassTree],
			Magic = []
		}

	}

	//Default Male
	function setGender(_gender = -1)
	{
		local r = _gender;
		if (_gender == -1)
		{
			r = 0;
			if (this.World.LegendsMod.Configs().LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r != 1)
		{
			return
		}
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
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
		if (this.m.IsFemaleBackground == true)
		{
			return "%name% lives to fight the undead scourge. Little is known about her and she almost never talks save for the occasional grunt while swinging her sword. Her language seems to be codified into one simple structure: killing creatures of evil.";
		}
		else
		{
			return "%name% lives to fight the undead scourge. Little is known about him and he almost never talks save for the occasional grunt while swinging his sword. His language seems to be codified into one simple structure: killing creatures of evil.";
		}
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				10,
				10
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				10,
				10
			],
			RangedSkill = [
				-10,
				-10
			],
			MeleeDefense = [
				15,
				15
			],
			RangedDefense = [
				-10,
				-10
			],
			Initiative = [
				-10,
				-10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Crusader");
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
		this.m.Container.add(this.new("scripts/skills/traits/legend_undead_killer_trait"));
		//this.m.Container.add(this.new("scripts/skills/perks/perk_rebound"));

		if(this.m.IsFemaleBackground == true)
		{
			actor.setName(this.Const.Strings.LadyNames[this.Math.rand(0, this.Const.Strings.LadyNames.len() - 1)]);
		}
		else
		{
			actor.setName(this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
		}
	}

function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		local r;

		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/weapons/flail"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/warhammer"));
		}

		local shield;
		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			shield = this.new("scripts/items/shields/legend_tower_shield");

		}
		else if (r == 3)
		{
			shield = this.new("scripts/items/shields/heater_shield");
		}
		else if (r == 4)
		{
			shield = this.new("scripts/items/shields/kite_shield");
		}
		shield.onPaintSpecificColor(23);
		items.equip(shield);


		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/scale_armor"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
		}

		local item = this.Const.World.Common.pickHelmet([
			[1, "nasal_helmet"],
			[1, "nasal_helmet_with_mail"],
			[1, "mail_coif"],
			[1, "bascinet_with_mail"],
			[1, "closed_flat_top_helmet"]
		])
		if (item != null)
		{
			item.onPaint(this.Const.Items.Paint.None);
			items.equip(item);
		}

	}

	function onAddLegendEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/weapons/flail"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/warhammer"));
		}

		local shield;
		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			shield = this.new("scripts/items/shields/legend_tower_shield");

		}
		else if (r == 3)
		{
			shield = this.new("scripts/items/shields/heater_shield");
		}
		else if (r == 4)
		{
			shield = this.new("scripts/items/shields/kite_shield");
		}
		shield.onPaintSpecificColor(23);
		items.equip(shield);



		local item = this.Const.World.Common.pickHelmet([
			[1, "nasal_helmet"],
			[1, "nasal_helmet_with_mail"],
			[1, "mail_coif"],
			[1, "bascinet_with_mail"],
			[1, "closed_flat_top_helmet"]
		])
		if (item != null)
		{
			item.onPaint(this.Const.Items.Paint.Black);
			items.equip(item);
		}

		local cloths = [
            [0, ""],
			[0, "cloth/legend_gambeson"],
			[1, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[1, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[0, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)

		if (armor != null)
		{
			local chains = [
                [0, ""],
                [1, "chain/legend_armor_mail_shirt"],
				[1, "chain/legend_armor_mail_shirt_simple"],
				[0, "chain/legend_armor_rusty_mail_shirt"],
				[0, "chain/legend_armor_ancient_double_mail"],
				[0, "chain/legend_armor_ancient_mail"],
				[1, "chain/legend_armor_basic_mail"],
				[1, "chain/legend_armor_hauberk"],
				[1, "chain/legend_armor_hauberk_full"],
				[1, "chain/legend_armor_hauberk_sleevless"],
				[1, "chain/legend_armor_reinforced_mail"],
				[1, "chain/legend_armor_reinforced_mail_shirt"],
				[1, "chain/legend_armor_reinforced_rotten_mail_shirt"],
				[1, "chain/legend_armor_reinforced_worn_mail"],
				[1, "chain/legend_armor_reinforced_worn_mail_shirt"],
				[1, "chain/legend_armor_short_mail"]
			]
			local chain = this.Const.World.Common.pickLegendArmor(chains)
			if (chain != null)
			{
				armor.setUpgrade(chain)
			}

			local plates = [
                [0, ""],
				[1, "plate/legend_armor_leather_brigandine"],
				[1, "plate/legend_armor_leather_brigandine_hardened"],
				[0, "plate/legend_armor_leather_brigandine_hardened_full"],
				[0, "plate/legend_armor_leather_jacket"],
				[0, "plate/legend_armor_leather_jacket_simple"],
				[0, "plate/legend_armor_leather_lamellar"],
				[0, "plate/legend_armor_leather_lamellar_harness_heavy"],
				[0, "plate/legend_armor_leather_lamellar_harness_reinforced"],
				[0, "plate/legend_armor_leather_lamellar_heavy"],
				[0, "plate/legend_armor_leather_lamellar_reinforced"],
				[0, "plate/legend_armor_leather_noble"],
				[0, "plate/legend_armor_leather_padded"],
				[1, "plate/legend_armor_leather_riveted"],
				[0, "plate/legend_armor_leather_riveted_light"],
				[0, "plate/legend_armor_leather_scale"],
				[0, "plate/legend_armor_plate_ancient_chest"],
				[0, "plate/legend_armor_plate_ancient_harness"],
				[0, "plate/legend_armor_plate_ancient_mail"],
				[0, "plate/legend_armor_plate_ancient_scale"],
				[0, "plate/legend_armor_plate_ancient_scale_coat"],
				[0, "plate/legend_armor_plate_ancient_scale_harness"],
				[1, "plate/legend_armor_plate_chest"],
				[1, "plate/legend_armor_plate_chest_rotten"],
				[1, "plate/legend_armor_plate_cuirass"],
				[1, "plate/legend_armor_plate_full"],
				[1, "plate/legend_armor_scale"],
				[0, "plate/legend_armor_scale_coat"],
				[1, "plate/legend_armor_scale_coat_rotten"],
				[1, "plate/legend_armor_scale_shirt"]
			]
			local plate = this.Const.World.Common.pickLegendArmor(plates)
			if (plate != null)
			{
				armor.setUpgrade(plate)
			}
			local tabards = [
						[0, ""],
						[1, "tabard/legend_armor_tabard_crusader"]
					]
					local tabard = this.Const.World.Common.pickLegendArmor(tabards)
			if (tabard != null && armor != null)
			{
				armor.setUpgrade(tabard)
			}
			local cloaks = [
						[0, ""],
						[1, "cloak/legend_armor_cloak_crusader"]
					]
					local cloak = this.Const.World.Common.pickLegendArmor(cloaks)
			if (tabard != null && armor != null)
			{
				armor.setUpgrade(cloak)
			}
			items.equip(armor);
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/bascinet_with_mail"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
		}
	}

});
