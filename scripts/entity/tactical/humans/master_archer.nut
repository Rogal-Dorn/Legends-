this.master_archer <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.MasterArcher;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.MasterArcher.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		if (this.Math.rand(1, 100) <= 10)
		{
			this.setGender(1);
		}
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_ranged_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.MasterArcher);
		b.DamageDirectMult = 1.25;
		b.IsSpecializedInBows = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled() && _skill != null && _skill.isRanged())
		{
			this.updateAchievement("Bullseye", 1, 1);
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
			if (this.Math.rand(1, 100) <= 66)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/war_bow"));
				this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/weapons/heavy_crossbow"));
				this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
			}
		}

		local weapons = [
			"weapons/dagger",
			"weapons/scramasax",
			"weapons/hatchet"
		];
		this.m.Items.addToBag(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local cloths = [
					[0, ""],
					[0, "cloth/legend_gambeson"],
					[0, "cloth/legend_gambeson_plain"],
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
					[1, "cloth/legend_tunic"],
					[0, "cloth/legend_tunic_noble"]
				];
				local armor = this.Const.World.Common.pickLegendArmor(cloths)

				if (armor != null)
				{
					local chains = [
						[1, ""],
						[1, "chain/legend_armor_mail_shirt"],
						[1, "chain/legend_armor_mail_shirt_simple"],
						[0, "chain/legend_armor_rusty_mail_shirt"],
						[0, "chain/legend_armor_ancient_double_mail"],
						[0, "chain/legend_armor_ancient_mail"],
						[0, "chain/legend_armor_basic_mail"],
						[0, "chain/legend_armor_hauberk"],
						[0, "chain/legend_armor_hauberk_full"],
						[0, "chain/legend_armor_hauberk_sleevless"],
						[0, "chain/legend_armor_reinforced_mail"],
						[0, "chain/legend_armor_reinforced_mail_shirt"],
						[0, "chain/legend_armor_reinforced_rotten_mail_shirt"],
						[0, "chain/legend_armor_reinforced_worn_mail"],
						[0, "chain/legend_armor_reinforced_worn_mail_shirt"],
						[0, "chain/legend_armor_short_mail"]
					]

					local chain = this.Const.World.Common.pickLegendArmor(chains)
					if (chain != null)
					{
						armor.setUpgrade(chain)
					}

					local plates = [
						[4, ""],
						[0, "plate/legend_armor_leather_brigandine"],
						[0, "plate/legend_armor_leather_brigandine_hardened"],
						[0, "plate/legend_armor_leather_brigandine_hardened_full"],
						[1, "plate/legend_armor_leather_jacket"],
						[1, "plate/legend_armor_leather_jacket_simple"],
						[1, "plate/legend_armor_leather_lamellar"],
						[0, "plate/legend_armor_leather_lamellar_harness_heavy"],
						[0, "plate/legend_armor_leather_lamellar_harness_reinforced"],
						[0, "plate/legend_armor_leather_lamellar_heavy"],
						[0, "plate/legend_armor_leather_lamellar_reinforced"],
						[0, "plate/legend_armor_leather_noble"],
						[1, "plate/legend_armor_leather_padded"],
						[0, "plate/legend_armor_leather_riveted"],
						[0, "plate/legend_armor_leather_riveted_light"],
						[0, "plate/legend_armor_leather_scale"],
						[0, "plate/legend_armor_plate_ancient_chest"],
						[0, "plate/legend_armor_plate_ancient_harness"],
						[0, "plate/legend_armor_plate_ancient_mail"],
						[0, "plate/legend_armor_plate_ancient_scale"],
						[0, "plate/legend_armor_plate_ancient_scale_coat"],
						[0, "plate/legend_armor_plate_ancient_scale_harness"],
						[0, "plate/legend_armor_plate_chest"],
						[0, "plate/legend_armor_plate_chest_rotten"],
						[0, "plate/legend_armor_plate_cuirass"],
						[0, "plate/legend_armor_plate_full"],
						[0, "plate/legend_armor_scale"],
						[0, "plate/legend_armor_scale_coat"],
						[0, "plate/legend_armor_scale_coat_rotten"],
						[0, "plate/legend_armor_scale_shirt"]
					]
					local plate = this.Const.World.Common.pickLegendArmor(plates)
					if (plate != null)
					{
						armor.setUpgrade(plate)
					}

					this.m.Items.equip(armor);
				}
			}
			else
			{
				local armor = [
					"armor/thick_tunic",
					"armor/padded_surcoat",
					"armor/leather_lamellar",
					"armor/basic_mail_shirt",
					"armor/ragged_surcoat",
					"armor/basic_mail_shirt"
				];
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head) && this.Math.rand(1, 100) <= 50)
		{
			local helmet = [
				"helmets/hood",
				"helmets/headscarf"
			];
			this.m.Items.equip(this.new("scripts/items/" + helmet[this.Math.rand(0, helmet.len() - 1)]));
		}
	}

	function makeMiniboss()
	{
		this.actor.makeMiniboss();
		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			[
				"weapons/named/named_warbow",
				"ammo/quiver_of_arrows"
			],
			[
				"weapons/named/named_crossbow",
				"ammo/quiver_of_bolts"
			]
		];
		local armor = [
			"armor/named/black_leather_armor",
			"armor/named/blue_studded_mail_armor"
		];

		local legend_armor = [
			"legend_armor/named/legend_black_leather_armor",
			"legend_armor/named/legend_blue_studded_mail_armor"
		];

		if (this.Math.rand(1, 100) <= 70)
		{
			local r = this.Math.rand(0, weapons.len() - 1);

			foreach( w in weapons[r] )
			{
				this.m.Items.equip(this.new("scripts/items/" + w));
			}
		}
		else
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, legend_armor.len() - 1)]));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
	}

});

