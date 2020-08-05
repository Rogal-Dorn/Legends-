this.militia <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Militia;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Militia.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Tags.add("militia");
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/militia_melee_agent");
		this.m.AIAgent.setActor(this);
		if (this.Math.rand(1, 100) <= 10)
		{
			this.setGender(1);
		}
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Militia);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.getSprite("accessory_special").setBrush("bust_militia_band_01");
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_militia_skill"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_bash"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_spear"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_militia_damage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_spearwall"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_spearthrust"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function assignRandomEquipment()
	{

			local r = this.Math.rand(1, 5);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
			}


			local r = this.Math.rand(1, 4);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/shields/buckler_shield"));
			}
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
			}



		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[0, ""],
				[0, "cloth/legend_gambeson"],
				[0, "cloth/legend_gambeson_plain"],
				[0, "cloth/legend_gambeson_wolf"],
				[0, "cloth/legend_padded_surcoat"],
				[0, "cloth/legend_robes"],
				[0, "cloth/legend_apron_butcher"],
				[0, "cloth/legend_robes_nun"],
				[1, "cloth/legend_apron_smith"],
				[0, "cloth/legend_robes_wizard"],
				[0, "cloth/legend_sackcloth"],
				[1, "cloth/legend_sackcloth_patched"],
				[0, "cloth/legend_sackcloth_tattered"],
				[1, "cloth/legend_thick_tunic"],
				[1, "cloth/legend_tunic"],
				[0, "cloth/legend_tunic_noble"]
			];
			local armor = this.Const.World.Common.pickLegendArmor(cloths)

			if (armor != null)
			{
				local chains = [
					[0, ""],
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
					[3, ""],
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

				this.m.Items.equip(armor);
			}
		}
		else
		{
			r = this.Math.rand(1, 7);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/armor/sackcloth"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/armor/thick_tunic"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/armor/apron"));
			}
		}


		if (this.Math.rand(1, 100) <= 50)
		{
			this.m.Items.equip(this.Const.World.Common.pickHelmet([
				[1, "hood"],
				[1, "aketon_cap"],
				[1, "open_leather_cap"],
				[1, "full_leather_cap"],
				[1, "headscarf"]
			]))
		}
	}

});

