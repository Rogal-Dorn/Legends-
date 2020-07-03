this.zombie_knight <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {},
	function create()
	{
		this.zombie.create();
		this.m.Type = this.Const.EntityType.ZombieKnight;
		this.m.BloodType = this.Const.BloodType.Dark;
		this.m.MoraleState = this.Const.MoraleState.Ignore;
		this.m.XP = this.Const.Tactical.Actor.ZombieKnight.XP;
		this.m.Name = this.Const.Strings.EntityName[this.m.Type];
		this.m.IsResurrectingOnFatality = true;
		this.m.ResurrectionValue = 5.0;
		this.m.ResurrectionChance = 90;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/zombie_knight";
	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		if (this.m.IsHeadless)
		{
			_hitInfo.BodyPart = this.Const.BodyPart.Body;
		}

		return this.actor.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function onInit()
	{
		this.zombie.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.ZombieKnight);
		b.SurroundedBonus = 10;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 100)
		{
			b.MeleeSkill += 5;
			b.DamageTotalMult += 0.1;
		}

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Hitpoints = b.Hitpoints * 1.5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));

			if (!this.m.IsResurrected)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
			}
		}

		this.m.CurrentProperties = clone b;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled())
		{
			this.updateAchievement("RestlessDead", 1, 1);
		}

		if (this.Const.LegendMod.Configs.LegendMagicEnabled()) {
			if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
			{
				local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

				for( local i = 0; i < n; i = ++i )
				{
					local r = this.Math.rand(1, 100);
					local loot;
					if (r <= 2)
					{
						loot = this.new("scripts/items/trade/legend_ancient_scroll_item");
						loot.drop(_tile);
					}
				}
			}
		}
		this.zombie.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onResurrected( _info )
	{
		this.zombie.onResurrected(_info);

		if (!_info.IsHeadAttached)
		{
			this.m.IsHeadless = true;
			this.m.Name = "Headless " + this.Const.Strings.EntityName[this.m.Type];
			this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head));
			this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Death] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Resurrect] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [];
			this.getSprite("head").setBrush("zombify_no_head");
			this.getSprite("head").Saturation = 1.0;
			this.getSprite("head").Color = this.createColor("#ffffff");
			this.getSprite("injury").Visible = false;
			this.getSprite("hair").resetBrush();
			this.getSprite("beard").resetBrush();
			this.getSprite("beard_top").resetBrush();
			this.getSprite("status_rage").resetBrush();
			this.getSprite("tattoo_head").resetBrush();
			this.getSprite("helmet").Visible = false;
			this.getSprite("helmet_damage").Visible = false;
			this.getSprite("body_blood").Visible = false;
			this.getSprite("dirt").Visible = false;
		}
	}

	function assignRandomEquipment()
	{
		local r;

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			local weapons = [
				"weapons/winged_mace",
				"weapons/hand_axe",
				"weapons/fighting_axe",
				"weapons/morning_star",
				"weapons/arming_sword",
				"weapons/flail",
				"weapons/military_cleaver"
			];

			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/longsword",
					"weapons/legend_bastardsword",
					"weapons/greataxe"
				]);
			}

			if (this.Const.DLC.Unhold && this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/two_handed_flail"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			local shields = [
				"shields/worn_heater_shield",
				"shields/worn_kite_shield"
			];
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
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
					2,
					"cloth/legend_gambeson"
				],
				[
					1,
					"cloth/legend_gambeson_plain"
				],
				[
					0,
					"cloth/legend_gambeson_wolf"
				],
				[
					4,
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
					2,
					"cloth/legend_dark_tunic"
				],
				[
					1,
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
			armor = this.Const.World.Common.pickLegendArmor(cloths);

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
						2,
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
						1,
						"plate/legend_armor_leather_lamellar_harness_heavy"
					],
					[
						1,
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
						0,
						"plate/legend_armor_plate_chest"
					],
					[
						3,
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
						3,
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
			}
		}
		else if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body) == null)
		{
			local armors = [
				"armor/decayed_coat_of_plates",
				"armor/decayed_coat_of_scales",
				"armor/decayed_reinforced_mail_hauberk"
			];
			armor = this.new("scripts/items/" + armors[this.Math.rand(0, armors.len() - 1)]);
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head) == null && this.Math.rand(1, 100) <= 90)
		{
			local helmet = [
				"helmets/decayed_closed_flat_top_with_sack",
				"helmets/decayed_closed_flat_top_with_mail",
				"helmets/decayed_closed_flat_top_with_mail",
				"helmets/decayed_closed_flat_top_with_mail",
				"helmets/decayed_full_helm",
				"helmets/decayed_full_helm",
				"helmets/decayed_full_helm",
				"helmets/decayed_great_helm",
				"helmets/decayed_great_helm",
				"helmets/decayed_great_helm"
			];
			local h = this.new("scripts/items/" + helmet[this.Math.rand(0, helmet.len() - 1)]);

			if (this.Math.rand(1, 100) <= 33)
			{
				h.setArmor(h.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(h);
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
			"weapons/named/named_axe",
			"weapons/named/named_cleaver",
			"weapons/named/named_flail",
			"weapons/named/named_greataxe",
			"weapons/named/named_greatsword",
			"weapons/named/named_mace",
			"weapons/named/named_two_handed_hammer"
		];

		if (this.Const.DLC.Unhold)
		{
			weapons.extend([
				"weapons/named/named_two_handed_mace",
				"weapons/named/named_two_handed_flail"
			]);
		}

		local shields = clone this.Const.Items.NamedUndeadShields;

		if (this.Math.rand(1, 100) <= 50)
		{
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		return true;
	}

});

