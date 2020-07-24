this.bandit_rabble <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditRabble;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditRabble.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/legend_bandit_rabble_agent");
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
		b.setValues(this.Const.Tactical.Actor.BanditRabble);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");

		if (this.Math.rand(1, 100) <= 10)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_pox_01");
		}
		else if (this.Math.rand(1, 100) <= 15)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = this.getSprite("dirt");
			dirt.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.getSprite("eye_rings").Visible = true;
		}

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 40)
		{
			b.MeleeDefense += 5;
		}

		this.setArmorSaturation(0.8);
		this.getSprite("shield_icon").setBrightness(0.9);

			 if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
			{
			this.m.Skills.add(this.new("scripts/skills/traits/craven_trait"));
			}

			 if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hard)
			{
			this.m.Skills.add(this.new("scripts/skills/traits/brave_trait"));
			}

			 if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/traits/brave_trait"));
			}

	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{


		local r = this.Math.rand(1, 13);

		if (r == 1)
		{
		this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_pitchfork"));
		 if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_skill"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_damage"));
				//this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
				this.m.Items.equip(this.new("scripts/items/helmets/straw_hat"));
			}

		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
			if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_militia_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_militia_damage"));
					this.m.Items.equip(this.new("scripts/items/shields/buckler_shield"));
					//this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
					this.m.Items.equip(this.new("scripts/items/helmets/open_leather_cap"));

				}

		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_sickle"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_sickle_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_sickle_damage"));
					//this.m.Items.equip(this.new("scripts/items/armor/legend_herbalist_robe"));
					this.m.Items.equip(this.new("scripts/items/helmets/hood"));
				}
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_staff"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_staff_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_staff_stun"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_fortified_mind"));
					//this.m.Items.equip(this.new("scripts/items/armor/monk_robe"));
					this.m.Items.equip(this.new("scripts/items/helmets/hood"));
				}
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_shovel"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_shovel_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_shovel_damage"));
					//this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));
					this.m.Items.equip(this.new("scripts/items/helmets/hood"));
				}
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/wooden_stick"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
					//this.m.Items.equip(this.new("scripts/items/armor/legend_maid_apron"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));
					this.m.Items.equip(this.new("scripts/items/helmets/straw_hat"));
				}
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_hammer"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_hammer_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_hammer_damage"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
					//this.m.Items.equip(this.new("scripts/items/armor/legend_blacksmith_apron"));
					this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));

				}
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_shiv"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_knife_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_knife_damage"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
					this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
					//this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
				}
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/lute"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_lute_damage"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
					//this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
					this.m.Items.equip(this.new("scripts/items/helmets/feathered_hat"));
				}
		}
		else if (r == 10)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_bloodbath"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_butcher_skill"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_butcher_damage"));
					//this.m.Items.equip(this.new("scripts/items/armor/butcher_apron"));
					this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));
				}
		}
		else if (r == 11)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_saw"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_woodaxe_skill"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_woodaxe_damage"));
				//this.m.Items.equip(this.new("scripts/items/armor/apron"));
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
				}
		}
		else if (r == 12)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_hoe"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_skill"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_damage"));
				//this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
				this.m.Items.equip(this.new("scripts/items/helmets/straw_hat"));
				}
		}
		else if (r == 13)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/wooden_flail"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_skill"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_pitchfork_damage"));
				//this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));
				this.m.Items.equip(this.new("scripts/items/helmets/cultist_hood"));
				}
		}


		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local cloths = [
				[1, ""],
				[0, "cloth/legend_gambeson"],
				[0, "cloth/legend_gambeson_plain"],
				[0, "cloth/legend_gambeson_wolf"],
				[0, "cloth/legend_padded_surcoat"],
				[1, "cloth/legend_robes"],
				[1, "cloth/legend_apron_butcher"],
				[0, "cloth/legend_robes_nun"],
				[1, "cloth/legend_apron_smith"],
				[0, "cloth/legend_robes_wizard"],
				[2, "cloth/legend_sackcloth"],
				[2, "cloth/legend_sackcloth_patched"],
				[2, "cloth/legend_sackcloth_tattered"],
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
					[4, ""],
					[0, "plate/legend_armor_leather_brigandine"],
					[0, "plate/legend_armor_leather_brigandine_hardened"],
					[0, "plate/legend_armor_leather_brigandine_hardened_full"],
					[1, "plate/legend_armor_leather_jacket"],
					[2, "plate/legend_armor_leather_jacket_simple"],
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
			if (this.Math.rand(1, 100) <= 90)
			{
				local r = this.Math.rand(0, 4);

				if (r <= 0)
				{
					this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));
				}
				else if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/legend_rabble_tunic"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/monk_robe"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/armor/legend_rabble_fur"));
				}

			}
		}


		if (this.Math.rand(1, 100) <= 50)
		{
			local r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));
			}


		}
	}

});
