this.skeleton_heavy <- this.inherit("scripts/entity/tactical/skeleton", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.SkeletonHeavy;
		this.m.XP = this.Const.Tactical.Actor.SkeletonHeavy.XP;
		this.m.ResurrectionValue = 5.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/skeleton_heavy";
		this.skeleton.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/skeleton_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.skeleton.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.SkeletonHeavy);
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			}

	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled())
		{
			this.updateAchievement("WalkingStatue", 1, 1);
		}

		this.skeleton.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function assignRandomEquipment()
	{
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/ancient/ancient_sword",
				"weapons/ancient/khopesh"
			];

			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/ancient/warscythe",
					"weapons/ancient/crypt_cleaver",
					"weapons/ancient/rhomphaia"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
		{
			this.m.Items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
		}


		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
		{
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local cloths = [
					[0, ""],
					[0, "cloth/legend_gambeson"],
					[10, "cloth/legend_gambeson_plain"],
					[0, "cloth/legend_gambeson_wolf"],
					[0, "cloth/legend_padded_surcoat"],
					[0, "cloth/legend_robes"],
					[0, "cloth/legend_apron_butcher"],
					[0, "cloth/legend_robes_nun"],
					[0, "cloth/legend_apron_smith"],
					[0, "cloth/legend_robes_wizard"],
					[20, "cloth/legend_ancient_cloth"],
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
						[2, ""],
						[0, "chain/legend_armor_mail_shirt"],
						[0, "chain/legend_armor_mail_shirt_simple"],
						[0, "chain/legend_armor_rusty_mail_shirt"],
						[1, "chain/legend_armor_ancient_double_mail"],
						[1, "chain/legend_armor_ancient_mail"],
						[0, "chain/legend_armor_basic_mail"],
						[0, "chain/legend_armor_hauberk"],
						[0, "chain/legend_armor_hauberk_full"],
						[0, "chain/legend_armor_hauberk_sleevless"],
						[0, "chain/legend_armor_reinforced_mail"],
						[0, "chain/legend_armor_reinforced_mail_shirt"],
						[1, "chain/legend_armor_reinforced_rotten_mail_shirt"],
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
						[5, "plate/legend_armor_plate_ancient_chest"],
						[1, "plate/legend_armor_plate_ancient_chest_restored"],
						[10, "plate/legend_armor_plate_ancient_harness"],
						[20, "plate/legend_armor_plate_ancient_mail"],
						[20, "plate/legend_armor_plate_ancient_scale"],
						[20, "plate/legend_armor_plate_ancient_scale_coat"],
						[20, "plate/legend_armor_plate_ancient_scale_harness"],
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
					"armor/ancient/ancient_plated_scale_hauberk",
					"armor/ancient/ancient_scale_coat",
					"armor/ancient/ancient_plate_harness",
					"armor/ancient/ancient_plated_mail_hauberk"
				];
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head))
		{
			local item = this.Const.World.Common.pickHelmet([
			[66, "ancient/ancient_honorguard_helmet"]
		])
		if (item != null)
		{
			this.m.Items.equip(item);
		}
		}
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = this.Const.Items.NamedUndeadWeapons;
		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_devastating_strikes"));
		return true;
	}

});

