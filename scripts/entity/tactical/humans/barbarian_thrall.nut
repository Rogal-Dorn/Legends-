this.barbarian_thrall <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BarbarianThrall;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BarbarianThrall.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.WildMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.WildExtended;
		if (this.Math.rand(1, 100) <= 10)
		{
			this.setGender(1);
			this.m.Faces = this.Const.Faces.WildFemale;
		}

		this.m.AIAgent = this.new("scripts/ai/tactical/agents/barbarian_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local tattoos = [
			2,
			3
		];

		if (this.Math.rand(1, 100) <= 66)
		{
			local tattoo_body = this.actor.getSprite("tattoo_body");
			local body = this.actor.getSprite("body");
			tattoo_body.setBrush("warpaint_0" + tattoos[this.Math.rand(0, tattoos.len() - 1)] + "_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			local tattoo_head = this.actor.getSprite("tattoo_head");
			tattoo_head.setBrush("warpaint_0" + tattoos[this.Math.rand(0, tattoos.len() - 1)] + "_head");
			tattoo_head.Visible = true;
		}

		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BarbarianThrall);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_wildmen_01");
		this.m.Skills.add(this.new("scripts/skills/actives/barbarian_fury_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_adrenalin"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));

		if ("LegendsMod" in this.World && this.World.LegendsMod != null && this.World.LegendsMod.Configs().LegendTherianthropyEnabled())
		{
			if(this.Math.rand(1, 10) == 1)
			{
				this.m.Skills.add(this.new("scripts/skills/injury_permanent/legend_lycanthropy_injury"));
			}
		}

		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_balance"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_fist"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_last_stand"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 30)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		}
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/barbarians/antler_cleaver"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/barbarians/claw_club"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
		}

		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 40)
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
				this.m.Items.addToBag(this.new("scripts/items/weapons/greenskins/orc_javelin"));
			}
		}

		if (this.Math.rand(1, 100) <= 20)
		{
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield_old"));
		}

		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[1, ""],
				[6, "cloth/legend_sackcloth_patched"],
				[3, "cloth/legend_sackcloth"]
			];
			local armor = this.Const.World.Common.pickLegendArmor(cloths)

			if (armor != null)
			{
				local plates = [
					[0, ""],
					[1, "plate/legend_animal_hide_armor"],
					[0, "plate/legend_heavy_iron_armor"],
					[0, "plate/legend_hide_and_bone_armor"],
					[0, "plate/legend_reinforced_animal_hide_armor"],
					[0, "plate/legend_rugged_scale_armor"],
					[0, "plate/legend_scrap_metal_armor"],
					[1, "plate/legend_thick_furs_armor"],
					[0, "plate/legend_thick_plated_barbarian_armor"],
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
			if (this.Math.rand(1, 100) <= 60)
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/barbarians/thick_furs_armor"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/barbarians/animal_hide_armor"));
				}
			}
		}



		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/barbarians/leather_headband"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/barbarians/bear_headpiece"));
		}
	}

});

