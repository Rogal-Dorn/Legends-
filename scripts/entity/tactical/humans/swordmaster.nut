this.swordmaster <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Swordmaster;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Swordmaster.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Swordmaster);
		b.IsSpecializedInSwords = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_full_force"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_feint"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_return_favor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled() && _skill != null && !_skill.isRanged())
		{
			this.updateAchievement("ThereCanBeOnlyOne", 1, 1);
		}

		this.human.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/noble_sword",
				"weapons/arming_sword"
			];

			if (this.Const.DLC.Wildmen || this.Const.DLC.Desert)
			{
				weapons.extend([
					"weapons/noble_sword",
					"weapons/arming_sword",
					"weapons/shamshir"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
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
							0,
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
							1,
							"chain/legend_armor_hauberk"
						],
						[
							1,
							"chain/legend_armor_hauberk_full"
						],
						[
							1,
							"chain/legend_armor_hauberk_sleevless"
						],
						[
							1,
							"chain/legend_armor_reinforced_mail"
						],
						[
							1,
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
							4,
							""
						],
						[
							1,
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
							1,
							"plate/legend_armor_leather_riveted"
						],
						[
							1,
							"plate/legend_armor_leather_riveted_light"
						],
						[
							1,
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
							1,
							"plate/legend_armor_plate_cuirass"
						],
						[
							0,
							"plate/legend_armor_plate_full"
						],
						[
							1,
							"plate/legend_armor_scale"
						],
						[
							1,
							"plate/legend_armor_scale_coat"
						],
						[
							0,
							"plate/legend_armor_scale_coat_rotten"
						],
						[
							1,
							"plate/legend_armor_scale_shirt"
						]
					];
					local plate = this.Const.World.Common.pickLegendArmor(plates);

					if (plate != null && armor.getStaminaModifier() + plate.getStaminaModifier() < 20)
					{
						armor.setUpgrade(plate);
					}

					local upgrades = [
						[
							20,
							""
						],
						[
							5,
							"cloak/legend_armor_cloak_heavy"
						],
						[
							1,
							"cloak/legend_armor_cloak_noble"
						]
					];
					local upgrade = this.Const.World.Common.pickLegendArmor(upgrades);

					if (upgrade != null)
					{
						armor.setUpgrade(upgrade);
					}

					this.m.Items.equip(armor);
				}
			}
			else
			{
				local armor = [
					"armor/mail_shirt",
					"armor/mail_hauberk",
					"armor/basic_mail_shirt"
				];

				if (this.Const.DLC.Unhold)
				{
					armor.extend([
						"armor/footman_armor",
						"armor/leather_scale_armor",
						"armor/light_scale_armor"
					]);
				}

				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head) && this.Math.rand(1, 100) <= 90)
		{
			local helmet = [
				"helmets/nasal_helmet",
				"helmets/nasal_helmet_with_mail",
				"helmets/mail_coif",
				"helmets/headscarf",
				"helmets/feathered_hat"
			];
			this.m.Items.equip(this.new("scripts/items/" + helmet[this.Math.rand(0, helmet.len() - 1)]));
		}
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			"weapons/named/named_sword"
		];

		if (this.Const.DLC.Wildmen || this.Const.DLC.Desert)
		{
			weapons.extend([
				"weapons/named/named_sword",
				"weapons/named/named_shamshir"
			]);
		}

		local armor = [
			"armor/named/black_leather_armor",
			"armor/named/blue_studded_mail_armor"
		];
		local legend_armor = [
			"legend_armor/named/legend_black_leather_armor",
			"legend_armor/named/legend_blue_studded_mail_armor"
		];

		if (this.Const.DLC.Wildmen)
		{
			armor.extend([
				"armor/named/named_noble_mail_armor"
			]);

			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				legend_armor.extend([
					"armor/named/legend_named_noble_mail_armor"
				]);
			}
		}

		if (this.Math.rand(1, 100) <= 70)
		{
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}
		else if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, legend_armor.len() - 1)]));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
		}

		this.m.BaseProperties.DamageDirectMult *= 1.25;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		return true;
	}

});

