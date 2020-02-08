this.zombie_yeoman_bodyguard <- this.inherit("scripts/entity/tactical/enemies/zombie_yeoman", {
	m = {},
	function create()
	{
		this.m.IsCreatingAgent = false;
		this.zombie_yeoman.create();
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/zombie_yeoman_bodyguard";
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/zombie_bodyguard_agent");
		this.m.AIAgent.setActor(this);
	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(1, 6);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/scramasax"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/shields/worn_heater_shield"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/shields/wooden_shield_old"));
			}
		}

		local armor;

		if (this.Const.LegendMod.Configs.LegendArmorsEnabled())
		{
			local cloths = [
				[
					0,
					""
				],
				[
					0,
					"cloth/legend_gambeson"
				],
				[
					0,
					"cloth/legend_gambeson_plain"
				],
				[
					0,
					"cloth/legend_gambeson_wolf"
				],
				[
					1,
					"cloth/legend_padded_surcoat"
				],
				[
					1,
					"cloth/legend_robes"
				],
				[
					0,
					"cloth/legend_apron_butcher"
				],
				[
					0,
					"cloth/legend_robes_nun"
				],
				[
					0,
					"cloth/legend_apron_smith"
				],
				[
					0,
					"cloth/legend_robes_wizard"
				],
				[
					1,
					"cloth/legend_sackcloth"
				],
				[
					1,
					"cloth/legend_sackcloth_patched"
				],
				[
					0,
					"cloth/legend_sackcloth_tattered"
				],
				[
					1,
					"cloth/legend_tunic"
				],
				[
					0,
					"cloth/legend_tunic_noble"
				]
			];
			armor = this.Const.World.Common.pickLegendArmor(cloths);

			if (armor != null)
			{
				local chains = [
					[
						2,
						""
					],
					[
						2,
						"chain/legend_armor_mail_shirt"
					],
					[
						2,
						"chain/legend_armor_mail_shirt_simple"
					],
					[
						10,
						"chain/legend_armor_rusty_mail_shirt"
					],
					[
						0,
						"chain/legend_armor_ancient_double_mail"
					],
					[
						0,
						"chain/legend_armor_ancient_mail"
					],
					[
						0,
						"chain/legend_armor_basic_mail"
					],
					[
						0,
						"chain/legend_armor_hauberk"
					],
					[
						0,
						"chain/legend_armor_hauberk_full"
					],
					[
						0,
						"chain/legend_armor_hauberk_sleevless"
					],
					[
						0,
						"chain/legend_armor_reinforced_mail"
					],
					[
						0,
						"chain/legend_armor_reinforced_mail_shirt"
					],
					[
						5,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					],
					[
						0,
						"chain/legend_armor_reinforced_worn_mail"
					],
					[
						5,
						"chain/legend_armor_reinforced_worn_mail_shirt"
					],
					[
						0,
						"chain/legend_armor_short_mail"
					]
				];
				local chain = this.Const.World.Common.pickLegendArmor(chains);

				if (chain != null)
				{
					armor.setUpgrade(chain);
				}

				local plates = [
					[
						1,
						""
					],
					[
						0,
						"plate/legend_armor_leather_brigandine"
					],
					[
						0,
						"plate/legend_armor_leather_brigandine_hardened"
					],
					[
						0,
						"plate/legend_armor_leather_brigandine_hardened_full"
					],
					[
						1,
						"plate/legend_armor_leather_jacket"
					],
					[
						1,
						"plate/legend_armor_leather_jacket_simple"
					],
					[
						0,
						"plate/legend_armor_leather_lamellar"
					],
					[
						0,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						0,
						"plate/legend_armor_leather_lamellar_harness_reinforced"
					],
					[
						0,
						"plate/legend_armor_leather_lamellar_heavy"
					],
					[
						0,
						"plate/legend_armor_leather_lamellar_reinforced"
					],
					[
						0,
						"plate/legend_armor_leather_noble"
					],
					[
						1,
						"plate/legend_armor_leather_padded"
					],
					[
						0,
						"plate/legend_armor_leather_riveted"
					],
					[
						0,
						"plate/legend_armor_leather_riveted_light"
					],
					[
						0,
						"plate/legend_armor_leather_scale"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_chest"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_harness"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_mail"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_scale"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_scale_coat"
					],
					[
						0,
						"plate/legend_armor_plate_ancient_scale_harness"
					],
					[
						0,
						"plate/legend_armor_plate_chest"
					],
					[
						0,
						"plate/legend_armor_plate_chest_rotten"
					],
					[
						0,
						"plate/legend_armor_plate_cuirass"
					],
					[
						0,
						"plate/legend_armor_plate_full"
					],
					[
						0,
						"plate/legend_armor_scale"
					],
					[
						0,
						"plate/legend_armor_scale_coat"
					],
					[
						0,
						"plate/legend_armor_scale_coat_rotten"
					],
					[
						0,
						"plate/legend_armor_scale_shirt"
					]
				];
				local plate = this.Const.World.Common.pickLegendArmor(plates);

				if (plate != null && chain == null)
				{
					armor.setUpgrade(plate);
				}
			}
		}
		else
		{
			r = this.Math.rand(1, 5);

			if (r == 1)
			{
				armor = this.new("scripts/items/armor/padded_leather");
			}
			else if (r == 2)
			{
				armor = this.new("scripts/items/armor/worn_mail_shirt");
			}
			else if (r == 3)
			{
				armor = this.new("scripts/items/armor/patched_mail_shirt");
			}
			else if (r == 4)
			{
				armor = this.new("scripts/items/armor/ragged_surcoat");
			}
			else if (r == 5)
			{
				armor = this.new("scripts/items/armor/basic_mail_shirt");
			}
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 75)
		{
			r = this.Math.rand(1, 7);
			local helmet;

			if (r == 1)
			{
				helmet = this.new("scripts/items/helmets/aketon_cap");
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/full_aketon_cap");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/kettle_hat");
			}
			else if (r == 4)
			{
				helmet = this.new("scripts/items/helmets/padded_kettle_hat");
			}
			else if (r == 5)
			{
				helmet = this.new("scripts/items/helmets/dented_nasal_helmet");
			}
			else if (r == 6)
			{
				helmet = this.new("scripts/items/helmets/mail_coif");
			}
			else if (r == 7)
			{
				helmet = this.new("scripts/items/helmets/full_leather_cap");
			}

			if (this.Math.rand(1, 100) <= 66)
			{
				helmet.setArmor(helmet.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(helmet);
		}
	}

});

