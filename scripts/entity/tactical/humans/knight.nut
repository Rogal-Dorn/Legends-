this.knight <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Knight;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Knight.XP;
		this.m.Name = this.generateName();
		this.m.IsGeneratingKillName = false;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function generateName()
	{
		return this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)];
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Knight);
		b.TargetAttractionMult = 1.25;
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
		this.getSprite("socket").setBrush("bust_base_military");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_feint"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_shield_skill"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_shield_push"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_back_to_basics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_bash"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_full_force"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_back_to_basics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_forceful_swing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bloody_harvest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}


	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled())
		{
			this.updateAchievement("AKnightsTale", 1, 1);
		}

		this.human.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function assignRandomEquipment()
	{
		local r;
		local banner = 4;

		if (("State" in this.Tactical) && this.Tactical.State != null && !this.Tactical.State.isScenarioMode())
		{
			banner = this.World.FactionManager.getFaction(this.getFaction()).getBanner();
		}
		else
		{
			banner = this.getFaction();
		}

		this.m.Surcoat = banner;

		if (this.Math.rand(1, 100) <= 90)
		{
			this.getSprite("surcoat").setBrush("surcoat_" + (banner < 10 ? "0" + banner : banner));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
		{
			r = this.Math.rand(1, 2);
			local shield;

			if (r == 1)
			{
				shield = this.new("scripts/items/shields/faction_heater_shield");
			}
			else if (r == 2)
			{
				shield = this.new("scripts/items/shields/faction_kite_shield");
			}

			shield.setFaction(banner);
			this.m.Items.equip(shield);
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local cloths = [
					[0, ""],
					[1, "cloth/legend_gambeson"],
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
					[0, "cloth/legend_tunic"],
					[0, "cloth/legend_tunic_noble"]
				];
				local armor = this.Const.World.Common.pickLegendArmor(cloths)

				if (armor != null)
				{
					local chains = [
						[0, ""],
						[1, "chain/legend_armor_mail_shirt"],
						[0, "chain/legend_armor_mail_shirt_simple"],
						[0, "chain/legend_armor_rusty_mail_shirt"],
						[0, "chain/legend_armor_ancient_double_mail"],
						[0, "chain/legend_armor_ancient_mail"],
						[1, "chain/legend_armor_basic_mail"],
						[1, "chain/legend_armor_hauberk"],
						[1, "chain/legend_armor_hauberk_full"],
						[1, "chain/legend_armor_hauberk_sleevless"],
						[1, "chain/legend_armor_reinforced_mail"],
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
						[0, ""],
						[0, "plate/legend_armor_leather_brigandine"],
						[0, "plate/legend_armor_leather_brigandine_hardened"],
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
						[0, "plate/legend_armor_leather_riveted"],
						[0, "plate/legend_armor_leather_riveted_light"],
						[0, "plate/legend_armor_leather_scale"],
						[0, "plate/legend_armor_plate_ancient_chest"],
						[0, "plate/legend_armor_plate_ancient_harness"],
						[0, "plate/legend_armor_plate_ancient_mail"],
						[0, "plate/legend_armor_plate_ancient_scale"],
						[0, "plate/legend_armor_plate_ancient_scale_coat"],
						[0, "plate/legend_armor_plate_ancient_scale_harness"],
						[9, "plate/legend_armor_plate_chest"],
						[0, "plate/legend_armor_plate_chest_rotten"],
						[20, "plate/legend_armor_plate_cuirass"],
						[20, "plate/legend_armor_plate_full"],
						[10, "plate/legend_armor_plate_full_greaves"],
						[1, "plate/legend_armor_plate_full_greaves_painted"],
						[20, "plate/legend_armor_scale"],
						[20, "plate/legend_armor_scale_coat"],
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
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/coat_of_plates"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/coat_of_scales"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
				}
			}

		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head))
		{
			this.m.Items.equip(this.Const.World.Common.pickHelmet([
				[45, "feathered_hat"],
				[44, "faction_helm"],
				[6, "legend_frogmouth_helm"],
				[1, "legend_frogmouth_helm_crested"]
			]))
			local helm = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head);
			local id = helm.getID();
			if (id == "armor.head.legend_helmet_faction_helm")
				helm.setVariant(banner);
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
			"weapons/named/named_greatsword",
			"weapons/named/named_mace",
			"weapons/named/named_sword"
		];
		local shields = clone this.Const.Items.NamedShields;
		local armor = [
			"armor/named/brown_coat_of_plates_armor",
			"armor/named/golden_scale_armor",
			"armor/named/green_coat_of_plates_armor",
			"armor/named/heraldic_mail_armor"
		];

		local legend_armor = [
			"legend_armor/named/legend_brown_coat_of_plates_armor",
			"legend_armor/named/legend_golden_scale_armor",
			"legend_armor/named/legend_green_coat_of_plates_armor",
			"legend_armor/named/legend_heraldic_mail_armor"
		];
		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}
		else
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local item = this.new("scripts/items/" + legend_armor[this.Math.rand(0, armor.len() - 1)]);
				local upgrades = [
					[79, ""],
					[20, "cloak/legend_armor_cloak_noble"],
					[1, "cloak/legend_armor_cloak_rich"]
				];
				local upgrade = this.Const.World.Common.pickLegendArmor(upgrades)
				if (upgrade != null)
				{
					item.setUpgrade(upgrade)
				}
				this.m.Items.equip(item)
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}
		this.m.Items.equip(this.Const.World.Common.pickHelmet([
			[1, "named/legend_frogmouth_helm_crested_painted"]
		]))


		this.m.Skills.add(this.new("scripts/skills/actives/indomitable"));
		return true;
	}

});

