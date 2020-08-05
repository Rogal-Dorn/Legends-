this.legend_peasant_minstrel <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.LegendPeasantMinstrel;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.LegendPeasantMinstrel.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.getTags().add("peasant");
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/barbarian_drummer_agent");
		this.m.AIAgent.setActor(this);
		if (this.Math.rand(1, 100) <= 50)
		{
			this.setGender(1);
		}
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendPeasantMinstrel);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		local dirt = this.getSprite("dirt");
		dirt.Visible = true;
		dirt.Alpha = this.Math.rand(0, 255);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_lute_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_lute_damage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_entice"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_daze"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_drums_of_life"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_drums_of_war"));
		this.getSprite("socket").setBrush("bust_base_militia");
			if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Hitpoints = b.Hitpoints * 1.5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(1, 100);
		if (r == 1)
		{
		this.m.Items.equip(this.new("scripts/items/weapons/named/named_lute"));
		}
		else
		{
		this.m.Items.equip(this.new("scripts/items/weapons/lute"));
		}

		local r;
		r = this.Math.rand(1, 4);


		if (r >= 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_drum"));
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
				[0, "cloth/legend_apron_smith"],
				[0, "cloth/legend_robes_wizard"],
				[1, "cloth/legend_sackcloth"],
				[1, "cloth/legend_sackcloth_patched"],
				[1, "cloth/legend_sackcloth_tattered"],
				[6, "cloth/legend_tunic"],
				[2, "cloth/legend_tunic_noble"]
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
					[40, ""],
					[0, "plate/legend_armor_leather_brigandine"],
					[0, "plate/legend_armor_leather_brigandine_hardened"],
					[0, "plate/legend_armor_leather_brigandine_hardened_full"],
					[0, "plate/legend_armor_leather_jacket"],
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
			r = this.Math.rand(1, 10);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/sackcloth"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
			}
		}


		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Items.equip(this.Const.World.Common.pickHelmet([
				[1, "feathered_hat"],
				[1, "hood"],
				[2, ""]
			]))
		}
	}

});

