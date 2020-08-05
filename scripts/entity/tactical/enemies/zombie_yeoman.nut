this.zombie_yeoman <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {},
	function create()
	{
		this.zombie.create();
		this.m.Type = this.Const.EntityType.ZombieYeoman;
		this.m.BloodType = this.Const.BloodType.Dark;
		this.m.MoraleState = this.Const.MoraleState.Ignore;
		this.m.XP = this.Const.Tactical.Actor.ZombieYeoman.XP;
		this.m.ResurrectionValue = 3.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/zombie_yeoman";
	}

	function onInit()
	{
		this.zombie.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.ZombieYeoman);
		b.SurroundedBonus = 10;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 100)
		{
			b.DamageTotalMult += 0.1;
		}

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Hitpoints = b.Hitpoints * 1.5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));
			}
		this.m.Skills.update();


	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(1, 7);

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
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
		}

		local armor;
		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[0, ""],
				[0, "cloth/legend_gambeson"],
				[0, "cloth/legend_gambeson_plain"],
				[0, "cloth/legend_gambeson_wolf"],
				[1, "cloth/legend_padded_surcoat"],
				[0, "cloth/legend_robes"],
				[4, "cloth/legend_dark_tunic"],
				[0, "cloth/legend_apron_butcher"],
				[0, "cloth/legend_robes_nun"],
				[1, "cloth/legend_apron"],
				[2, "cloth/legend_apron_smith"],
				[0, "cloth/legend_robes_wizard"],
				[0, "cloth/legend_sackcloth_tattered"],
				[2, "cloth/legend_thick_tunic"],
				[0, "cloth/legend_tunic_noble"]
			];
			armor = this.Const.World.Common.pickLegendArmor(cloths)

			if (armor != null)
			{
				local chains = [
					[2, ""],
					[1, "chain/legend_armor_mail_shirt"],
					[0, "chain/legend_armor_mail_shirt_simple"],
					[2, "chain/legend_armor_rusty_mail_shirt"],
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
					[1, ""],
					[0, "plate/legend_armor_leather_brigandine"],
					[0, "plate/legend_armor_leather_brigandine_hardened"],
					[0, "plate/legend_armor_leather_brigandine_hardened_full"],
					[4, "plate/legend_armor_leather_jacket"],
					[2, "plate/legend_armor_leather_jacket_simple"],
					[1, "plate/legend_armor_leather_lamellar"],
					[0, "plate/legend_armor_leather_lamellar_harness_heavy"],
					[0, "plate/legend_armor_leather_lamellar_harness_reinforced"],
					[0, "plate/legend_armor_leather_lamellar_heavy"],
					[0, "plate/legend_armor_leather_lamellar_reinforced"],
					[0, "plate/legend_armor_leather_noble"],
					[2, "plate/legend_armor_leather_padded"],
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
				if (plate != null && chain == null)
				{
					armor.setUpgrade(plate)
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
			local item = this.Const.World.Common.pickHelmet([
				[1, "aketon_cap"],
				[1, "full_aketon_cap"],
				[1, "kettle_hat"],
				[1, "padded_kettle_hat"],
				[1, "dented_nasal_helmet"],
				[1, "mail_coif"],
				[1, "full_leather_cap"]
			])
			if (item != null)
			{
				if (this.Math.rand(1, 100) <= 66)
				{
					item.setArmor(item.getArmorMax() / 2 - 1);
				}
				this.m.Items.equip(item);
			}
		}
	}

});

