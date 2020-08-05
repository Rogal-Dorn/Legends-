this.bandit_raider <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditRaider;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditRaider.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bandit_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BanditRaider);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");
		local dirt = this.getSprite("dirt");
		dirt.Visible = true;
		dirt.Alpha = this.Math.rand(150, 255);
		this.setArmorSaturation(0.85);
		this.getSprite("shield_icon").setBrightness(0.85);

		if (!this.m.IsLow)
		{
			b.IsSpecializedInSwords = true;
			b.IsSpecializedInAxes = true;
			b.IsSpecializedInMaces = true;
			b.IsSpecializedInFlails = true;
			b.IsSpecializedInPolearms = true;
			b.IsSpecializedInThrowing = true;
			b.IsSpecializedInHammers = true;
			b.IsSpecializedInSpears = true;
			b.IsSpecializedInCleavers = true;

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 40)
			{
				b.MeleeSkill += 5;
				b.RangedSkill += 5;
			}
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;

		if (this.Math.rand(1, 100) <= 20)
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(0, 9);

				if (r == 0)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
					}
				}
				else if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/hooked_blade"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
					}
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pike"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
					}
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_bloody_harvest"));
					}
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longaxe"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
					}
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/two_handed_wooden_hammer"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));
					}
				}
				else if (r == 6)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/two_handed_wooden_flail"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
					}
				}
				else if (r == 7)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/two_handed_mace"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
					}
				}
				else if (r == 8)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_vengeance"));
					}
				}
				else if (r == 9)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/legend_bastardsword"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_forceful_swing"));
					}
				}
			}
			else
			{
				r = this.Math.rand(0, 4);

				if (r == 0)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
				}
				else if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/hooked_blade"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pike"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longaxe"));
				}
			}
		}
		else
		{
			r = this.Math.rand(2, 11);

			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
				}
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
				}
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/morning_star"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
				}
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/falchion"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_feint"));
				}
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/flail"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
				}
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/scramasax"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_bloodbath"));
				}
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/military_pick"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));
				}
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				}
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

		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 35)
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
				}
				else if (r == 3)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
				}
			}
			else
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
		}

		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[
					0,
					""
				],
				[
					0,
					"cloth/legend_gambeson_rare_color"
				],
				[
					4,
					"cloth/legend_gambeson_plain"
				],
				[
					1,
					"cloth/legend_gambeson_common_color"
				],
				[
					0,
					"cloth/legend_gambeson_wolf"
				],
				[
					85,
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
					10,
					"cloth/legend_thick_tunic"
				],
				[
					0,
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
						10,
						""
					],
					[
						9,
						"chain/legend_armor_mail_shirt"
					],
					[
						0,
						"chain/legend_armor_mail_shirt_simple"
					],
					[
						50,
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
						0,
						"chain/legend_armor_reinforced_rotten_mail_shirt"
					],
					[
						0,
						"chain/legend_armor_reinforced_worn_mail"
					],
					[
						0,
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
						10,
						""
					],
					[
						10,
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
						40,
						"plate/legend_armor_leather_jacket"
					],
					[
						20,
						"plate/legend_armor_leather_jacket_simple"
					],
					[
						20,
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
						10,
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

				this.m.Items.equip(armor);
			}
		}
		else
		{
			r = this.Math.rand(2, 7);
			local armor;

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
		}

		if (this.Math.rand(1, 100) <= 85)
		{
			local item = this.Const.World.Common.pickHelmet([
				[1, "nasal_helmet"],
				[1, "dented_nasal_helmet"],
				[1, "rusty_mail_coif"],
				[1, "headscarf"],
				[1, "nasal_helmet_with_rusty_mail"]
			])
			if (item != null)
			{
				this.m.Items.equip(item);
			}
		}
	}

});

