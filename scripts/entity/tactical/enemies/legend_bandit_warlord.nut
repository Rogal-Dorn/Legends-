this.legend_bandit_warlord <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditWarlord;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditWarlord.XP;
		this.m.Name = this.generateName();
		this.m.IsGeneratingKillName = false;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bandit_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function generateName()
	{
		local vars = [
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomtown",
				this.Const.World.LocationNames.VillageWestern[this.Math.rand(0, this.Const.World.LocationNames.VillageWestern.len() - 1)]
			]
		];
		return this.buildTextFromTemplate(this.Const.Strings.BanditLeaderNames[this.Math.rand(0, this.Const.Strings.BanditLeaderNames.len() - 1)], vars);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BanditLeader);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");
		local dirt = this.getSprite("dirt");
		dirt.Visible = true;
		dirt.Alpha = this.Math.rand(150, 255);
		this.setArmorSaturation(0.6);
		this.getSprite("shield_icon").setBrightness(0.6);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_inspiring_presence"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_full_force"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/actives/rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}

		if (!this.Tactical.State.isScenarioMode())
		{
			local dateToSkip = 0;

			switch(this.World.Assets.getCombatDifficulty())
			{
			case this.Const.Difficulty.Easy:
				dateToSkip = 240;
				break;

			case this.Const.Difficulty.Normal:
				dateToSkip = 180;
				break;

			case this.Const.Difficulty.Hard:
				dateToSkip = 120;
				break;

			case this.Const.Difficulty.Legendary:
				dateToSkip = 60;
				break;
			}

			if (this.World.getTime().Days >= dateToSkip)
			{
				local bonus = this.Math.min(1, this.Math.floor((this.World.getTime().Days - dateToSkip) / 20.0));
				local b = this.m.BaseProperties;
				b.MeleeSkill += bonus;
				b.RangedSkill += bonus;
				b.MeleeDefense += this.Math.floor(bonus / 2);
				b.RangedDefense += this.Math.floor(bonus / 2);
				b.Hitpoints += this.Math.floor(bonus * 2);
				b.Initiative += this.Math.floor(bonus / 2);
				b.Stamina += bonus;
				b.Bravery += bonus;
				b.FatigueRecoveryRate += this.Math.floor(bonus / 4);
			}
		}
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setArmorBrightness(0.6);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local shields = clone this.Const.Items.NamedShields;
		shields.extend([
			"shields/named/named_bandit_kite_shield",
			"shields/named/named_bandit_heater_shield"
		]);

		if (this.Math.rand(1, 100) > 50)
		{
			this.m.Items.equip(this.new("scripts/items/" + this.Const.Items.NamedMeleeWeapons[this.Math.rand(0, this.Const.Items.NamedMeleeWeapons.len() - 1)]));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			local weapons = [
				"weapons/noble_sword",
				"weapons/fighting_axe",
				"weapons/warhammer",
				"weapons/boar_spear",
				"weapons/legend_glaive",
				"weapons/winged_mace",
				"weapons/arming_sword",
				"weapons/military_cleaver"
			];

			if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
			{
				weapons.extend([
					"weapons/greatsword",
					"weapons/greataxe",
					"weapons/legend_swordstaff",
					"weapons/legend_bastardsword",
					"weapons/warbrand"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			local shields = [
				"shields/wooden_shield",
				"shields/heater_shield",
				"shields/kite_shield"
			];
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}

		if (this.Math.rand(1, 100) > 50)
		{
			if (!this.Const.LegendMod.Configs.LegendArmorsEnabled())
			{
				this.m.Items.equip(this.new("scripts/items/" + this.Const.Items.NamedArmors[this.Math.rand(0, this.Const.Items.NamedArmors.len() - 1)]));
			}
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/" + this.Const.Items.NamedHelmets[this.Math.rand(0, this.Const.Items.NamedHelmets.len() - 1)]));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body) == null)
		{
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
						1,
						"cloth/legend_gambeson_plain"
					],
					[
						10,
						"cloth/legend_gambeson_common_color"
					],
					[
						60,
						"cloth/legend_gambeson_rare_color"
					],
					[
						10,
						"cloth/legend_gambeson_named"
					],
					[
						20,
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
							0,
							""
						],
						[
							0,
							"chain/legend_armor_mail_shirt"
						],
						[
							0,
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
							0,
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
							"chain/legend_armor_hauberk_full_named"
						],
						[
							0,
							"chain/legend_armor_hauberk_sleevless"
						],
						[
							1,
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
							0,
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
							0,
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
							1,
							"plate/legend_armor_plate_chest"
						],
						[
							1,
							"plate/legend_armor_plate_chest_rotten"
						],
						[
							1,
							"plate/legend_armor_plate_cuirass"
						],
						[
							1,
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
							1,
							"plate/legend_armor_scale_coat_rotten"
						],
						[
							1,
							"plate/legend_armor_scale_shirt"
						],
						[1, "plate/legend_armor_plate_full_greaves_painted"],
						[1, "plate/legend_armor_leather_jacket_named"],
						[1, "plate/legend_armor_leather_lamellar_heavy_named"],
						[1, "plate/legend_armor_leather_brigandine_named"],
						[1, "plate/legend_armor_scale_coat_named"]
					];
					local plate = this.Const.World.Common.pickLegendArmor(plates);

					if (plate != null)
					{
						armor.setUpgrade(plate);
					}

					local upgrades = [
						[0, ""],
						[1, "cloak/legend_armor_cloak"],
						[1, "cloak/legend_armor_cloak_rich"]
					];
					local upgrade = this.Const.World.Common.pickLegendArmor(upgrades)
					if (upgrade != null)
					{
						armor.setUpgrade(upgrade)
					}
					this.m.Items.equip(armor);
				}
			}
			else
			{
				local armor = [
					"armor/reinforced_mail_hauberk",
					"armor/worn_mail_shirt",
					"armor/patched_mail_shirt",
					"armor/mail_shirt",
					"armor/lamellar_harness"
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

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head) == null)
		{
			local helmet = [
				"helmets/closed_mail_coif",
				"helmets/padded_kettle_hat",
				"helmets/kettle_hat_with_closed_mail",
				"helmets/kettle_hat_with_mail",
				"helmets/padded_flat_top_helmet",
				"helmets/nasal_helmet_with_mail",
				"helmets/flat_top_with_mail",
				"helmets/padded_nasal_helmet",
				"helmets/bascinet_with_mail"
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
		return true;
	}

});

