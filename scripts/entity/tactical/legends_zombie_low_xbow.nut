this.legends_zombie_low_xbow <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendZombieLightXbow;
		this.legend_zombie.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/actives/zombie_bite"));
		this.m.Skills.add(this.new("scripts/skills/injury_permanent/legend_rotten_flesh"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
		this.m.Hitpoints = b.Hitpoints * 1.5;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));
		}
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r;
		local armor;
		this.m.Items.equip(this.new("scripts/items/weapons/light_crossbow"));
		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));

		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[0, ""],
				[0, "cloth/legend_gambeson"],
				[0, "cloth/legend_gambeson_plain"],
				[0, "cloth/legend_gambeson_wolf"],
				[0, "cloth/legend_padded_surcoat"],
				[1, "cloth/legend_robes"],
				[1, "cloth/legend_apron_butcher"],
				[0, "cloth/legend_robes_nun"],
				[1, "cloth/legend_apron_smith"],
				[0, "cloth/legend_robes_wizard"],
				[1, "cloth/legend_sackcloth"],
				[1, "cloth/legend_sackcloth_patched"],
				[1, "cloth/legend_sackcloth_tattered"],
				[1, "cloth/legend_tunic"],
				[0, "cloth/legend_tunic_noble"]
			];
			armor = this.Const.World.Common.pickLegendArmor(cloths)

			if (armor != null)
			{
				local chains = [
					[1, ""],
					[0, "chain/legend_armor_mail_shirt"],
					[0, "chain/legend_armor_mail_shirt_simple"],
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
					[1, ""],
					[0, "plate/legend_armor_leather_brigandine"],
					[0, "plate/legend_armor_leather_brigandine_hardened"],
					[0, "plate/legend_armor_leather_brigandine_hardened_full"],
					[1, "plate/legend_armor_leather_jacket"],
					[1, "plate/legend_armor_leather_jacket_simple"],
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
			}
		}
		else
		{
			r = this.Math.rand(1, 9);
			if (r == 1)
			{
				armor = this.new("scripts/items/armor/leather_tunic");
			}
			else if (r == 2)
			{
				armor = this.new("scripts/items/armor/linen_tunic");
			}
			else if (r == 3)
			{
				armor = this.new("scripts/items/armor/linen_tunic");
			}
			else if (r == 4)
			{
				armor = this.new("scripts/items/armor/sackcloth");
			}
			else if (r == 5)
			{
				armor = this.new("scripts/items/armor/tattered_sackcloth");
			}
			else if (r == 6)
			{
				armor = this.new("scripts/items/armor/leather_wraps");
			}
			else if (r == 7)
			{
				armor = this.new("scripts/items/armor/apron");
			}
			else if (r == 8)
			{
				armor = this.new("scripts/items/armor/butcher_apron");
			}
			else if (r == 9)
			{
				armor = this.new("scripts/items/armor/monk_robe");
			}
		}


		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 33)
		{
			r = this.Math.rand(1, 5);
			local helmet;

			if (r == 1)
			{
				helmet = this.new("scripts/items/helmets/hood");
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/aketon_cap");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/full_aketon_cap");
			}
			else if (r == 4)
			{
				helmet = this.new("scripts/items/helmets/open_leather_cap");
			}
			else if (r == 5)
			{
				helmet = this.new("scripts/items/helmets/full_leather_cap");
			}


			this.m.Items.equip(helmet);
		}
	}

});
