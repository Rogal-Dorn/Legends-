this.bandit_thug <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditThug;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditThug.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bandit_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BanditThug);
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

		this.getSprite("armor").Saturation = 0.8;
		this.getSprite("helmet").Saturation = 0.8;
		this.getSprite("helmet_damage").Saturation = 0.8;
		this.getSprite("shield_icon").Saturation = 0.8;
		this.getSprite("shield_icon").setBrightness(0.9);

		if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));

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
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{

								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
							}
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/goedendag"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
							}
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
						 if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
							}

				}
			}
			else
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
							}
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
						 if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
							}
				}
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
						 if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
							}
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hatchet"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
							}
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
							}
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
						}
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pickaxe"));
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));
					}
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/reinforced_wooden_flail"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
						}
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/wooden_flail"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
						}
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_bloodbath"));
						}
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/dagger"));
					if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
						}
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_scythe"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
						}
			}
			else if (r == 12)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_tipstaff"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_return_favor"));
						}
			}
			else if (r == 13)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_militia_glaive"));
						this.m.Items.equip(this.new("scripts/items/weapons/legend_tipstaff"));
						if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
						}
			}

			local chance = 33;
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
						{
						chance = 100;
						}
			if (this.Math.rand(1, 100) <= chance)
			{
				local r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/buckler_shield"));
				}
			}
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
				[0, "cloth/legend_sackcloth"],
				[10, "cloth/legend_apron"],
				[0, "cloth/legend_sackcloth_patched"],
				[0, "cloth/legend_sackcloth_tattered"],
				[30, "cloth/legend_thick_tunic"],
				[30, "cloth/legend_tunic"],
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
					[50, ""],
					[0, "plate/legend_armor_leather_brigandine"],
					[0, "plate/legend_armor_leather_brigandine_hardened"],
					[0, "plate/legend_armor_leather_brigandine_hardened_full"],
					[10, "plate/legend_armor_leather_jacket"],
					[39, "plate/legend_armor_leather_jacket_simple"],
					[0, "plate/legend_armor_leather_lamellar"],
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
			local r = this.Math.rand(0, 9);
				if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
					r = this.Math.rand(6, 9);
					}

			if (r <= 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/thick_tunic"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/monk_robe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/armor/blotched_gambeson"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/armor/ragged_surcoat"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/armor/gambeson"));
			}

		}

		local chance = 40;
			if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			chance = 100;
			}
		if (this.Math.rand(1, 100) <= chance)
		{
			local r = this.Math.rand(1, 6);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/hood"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/open_leather_cap"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/full_leather_cap"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/aketon_cap"));
			}
		}
	}

});

