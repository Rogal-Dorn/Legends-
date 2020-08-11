this.bandit_raider_wolf <- this.inherit("scripts/entity/tactical/enemies/bandit_raider", {
	m = {},
	function create()
	{
		this.bandit_raider.create();
		this.m.Name = "Disguised Bandit";
	}

	function onInit()
	{
		this.bandit_raider.onInit();
		if ("LegendsMod" in this.World && this.World.LegendsMod != null && this.World.LegendsMod.Configs().LegendTherianthropyEnabled())
		{
			if(this.Math.rand(1, 10) == 1)
			{
				this.m.Skills.add(this.new("scripts/skills/injury_permanent/legend_lycanthropy_injury"));
			}
		}
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(0, 9);

		if (r <= 1)
		{
			r = this.Math.rand(0, 3);

			if (r == 0)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
			}
			else if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/billhook"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pike"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/morning_star"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/falchion"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/flail"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));
			}

			if (this.Math.rand(1, 100) <= 75)
			{
				if (this.Math.rand(1, 100) <= 75)
				{
					this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
				}
				else
				{
					this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
				}
			}
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
			}
		}

		if (this.Const.DLC.Unhold)
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local cloths = [
					[
						0,
						""
					],
					[
						1,
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
						0,
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
						0,
						"cloth/legend_sackcloth"
					],
					[
						0,
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
				local armor = this.Const.World.Common.pickLegendArmor(cloths);

				if (armor != null)
				{
					local chains = [
						[
							0,
							""
						],
						[
							1,
							"chain/legend_armor_mail_shirt"
						],
						[
							1,
							"chain/legend_armor_mail_shirt_simple"
						],
						[
							1,
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
							1,
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
							1,
							"chain/legend_armor_reinforced_mail_shirt"
						],
						[
							1,
							"chain/legend_armor_reinforced_rotten_mail_shirt"
						],
						[
							0,
							"chain/legend_armor_reinforced_worn_mail"
						],
						[
							1,
							"chain/legend_armor_reinforced_worn_mail_shirt"
						],
						[
							1,
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
							4,
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
							0,
							"plate/legend_armor_leather_jacket"
						],
						[
							0,
							"plate/legend_armor_leather_jacket_simple"
						],
						[
							1,
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

					if (plate != null)
					{
						armor.setUpgrade(plate);
					}

					local upgrade = this.new("scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade");
					armor.setUpgrade(upgrade);
					this.m.Items.equip(armor);
				}
			}
			else
			{
				local armor;
				r = this.Math.rand(2, 7);

				if (r == 2)
				{
					armor = this.new("scripts/items/armor/ragged_surcoat");
				}
				else if (r == 3)
				{
					armor = this.new("scripts/items/armor/padded_leather");
				}
				else if (r == 4)
				{
					armor = this.new("scripts/items/armor/worn_mail_shirt");
				}
				else if (r == 5)
				{
					armor = this.new("scripts/items/armor/patched_mail_shirt");
				}
				else if (r == 6)
				{
					armor = this.new("scripts/items/armor/leather_lamellar");
				}
				else if (r == 7)
				{
					armor = this.new("scripts/items/armor/basic_mail_shirt");
				}

				this.m.Items.equip(armor);
				local upgrade = this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade");
				armor.setUpgrade(upgrade);
			}
		}
		else
		{
			r = this.Math.rand(1, 3);

			if (r <= 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/werewolf_hide_armor"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/armor/werewolf_mail_armor"));
			}
		}

		if (this.Math.rand(1, 100) <= 75)
		{
			local r = this.Math.rand(1, 5);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/dented_nasal_helmet"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet_with_rusty_mail"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/rusty_mail_coif"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
		}
	}

});

