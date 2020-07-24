this.mercenary <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Mercenary.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Mercenary);
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
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_clarity"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_footwork"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steadfast"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
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
		local r;

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/billhook",
				"weapons/pike",
				"weapons/warbrand",
				"weapons/longsword",
				"weapons/legend_bastardsword",
				"weapons/hand_axe",
				"weapons/fighting_spear",
				"weapons/legend_glaive",
				"weapons/morning_star",
				"weapons/falchion",
				"weapons/arming_sword",
				"weapons/flail",
				"weapons/military_pick"
			];

			if (this.Const.DLC.Unhold)
			{
				weapons.extend([
					"weapons/polehammer",
					"weapons/three_headed_flail"
				]);
			}

			if (this.Const.DLC.Wildmen)
			{
				weapons.extend([
					"weapons/bardiche",
					"weapons/scimitar"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			if (this.Math.rand(1, 100) <= 75)
			{
				r = this.Math.rand(0, 2);

				if (r == 0)
				{
					this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
				}
				else if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
				}
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
			}
		}

		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 60)
		{
			if (this.Const.DLC.Unhold)
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
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
				}
			}
			else
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
				}
			}
		}

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
				[1, "cloth/legend_tunic"],
				[0, "cloth/legend_tunic_noble"]
			];
			local armor = this.Const.World.Common.pickLegendArmor(cloths)

			if (armor != null)
			{
				local chains = [
					[0, ""],
					[1, "chain/legend_armor_mail_shirt"],
					[1, "chain/legend_armor_mail_shirt_simple"],
					[0, "chain/legend_armor_rusty_mail_shirt"],
					[0, "chain/legend_armor_ancient_double_mail"],
					[0, "chain/legend_armor_ancient_mail"],
					[1, "chain/legend_armor_basic_mail"],
					[1, "chain/legend_armor_hauberk"],
					[1, "chain/legend_armor_hauberk_full"],
					[1, "chain/legend_armor_hauberk_sleevless"],
					[1, "chain/legend_armor_reinforced_mail"],
					[1, "chain/legend_armor_reinforced_mail_shirt"],
					[1, "chain/legend_armor_reinforced_rotten_mail_shirt"],
					[1, "chain/legend_armor_reinforced_worn_mail"],
					[1, "chain/legend_armor_reinforced_worn_mail_shirt"],
					[1, "chain/legend_armor_short_mail"]
				]

				local chain = this.Const.World.Common.pickLegendArmor(chains)
				if (chain != null)
				{
					armor.setUpgrade(chain)
				}

				local plates = [
					[6, ""],
					[1, "plate/legend_armor_leather_brigandine"],
					[1, "plate/legend_armor_leather_brigandine_hardened"],
					[1, "plate/legend_armor_leather_brigandine_hardened_full"],
					[1, "plate/legend_armor_leather_jacket"],
					[1, "plate/legend_armor_leather_jacket_simple"],
					[1, "plate/legend_armor_leather_lamellar"],
					[1, "plate/legend_armor_leather_lamellar_harness_heavy"],
					[1, "plate/legend_armor_leather_lamellar_harness_reinforced"],
					[1, "plate/legend_armor_leather_lamellar_heavy"],
					[1, "plate/legend_armor_leather_lamellar_reinforced"],
					[0, "plate/legend_armor_leather_noble"],
					[1, "plate/legend_armor_leather_padded"],
					[1, "plate/legend_armor_leather_riveted"],
					[1, "plate/legend_armor_leather_riveted_light"],
					[1, "plate/legend_armor_leather_scale"],
					[0, "plate/legend_armor_plate_ancient_chest"],
					[0, "plate/legend_armor_plate_ancient_harness"],
					[0, "plate/legend_armor_plate_ancient_mail"],
					[0, "plate/legend_armor_plate_ancient_scale"],
					[0, "plate/legend_armor_plate_ancient_scale_coat"],
					[0, "plate/legend_armor_plate_ancient_scale_harness"],
					[1, "plate/legend_armor_plate_chest"],
					[0, "plate/legend_armor_plate_chest_rotten"],
					[1, "plate/legend_armor_plate_cuirass"],
					[0, "plate/legend_armor_plate_full"],
					[1, "plate/legend_armor_scale"],
					[1, "plate/legend_armor_scale_coat"],
					[0, "plate/legend_armor_scale_coat_rotten"],
					[1, "plate/legend_armor_scale_shirt"]
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
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 11);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/sellsword_armor"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
				}
				else if (r == 6)
				{
					this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
				}
				else if (r == 7)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
				}
				else if (r == 8)
				{
					this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
				}
				else if (r == 9)
				{
					this.m.Items.equip(this.new("scripts/items/armor/footman_armor"));
				}
				else if (r == 10)
				{
					this.m.Items.equip(this.new("scripts/items/armor/light_scale_armor"));
				}
				else if (r == 11)
				{
					this.m.Items.equip(this.new("scripts/items/armor/leather_scale_armor"));
				}
			}
			else
			{
				r = this.Math.rand(2, 8);

				if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
				}
				else if (r == 6)
				{
					this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
				}
				else if (r == 7)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
				}
				else if (r == 8)
				{
					this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
				}
			}

		}
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 11);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/sellsword_armor"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
				}
				else if (r == 6)
				{
					this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
				}
				else if (r == 7)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
				}
				else if (r == 8)
				{
					this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
				}
				else if (r == 9)
				{
					this.m.Items.equip(this.new("scripts/items/armor/footman_armor"));
				}
				else if (r == 10)
				{
					this.m.Items.equip(this.new("scripts/items/armor/light_scale_armor"));
				}
				else if (r == 11)
				{
					this.m.Items.equip(this.new("scripts/items/armor/leather_scale_armor"));
				}
			}
			else
			{
				r = this.Math.rand(2, 8);

				if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
				}
				else if (r == 6)
				{
					this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
				}
				else if (r == 7)
				{
					this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
				}
				else if (r == 8)
				{
					this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
				}
			}

		if (this.Math.rand(1, 100) <= 95)
		{
			local helmets = [
				"scripts/items/helmets/nasal_helmet",
				"scripts/items/helmets/nasal_helmet_with_mail",
				"scripts/items/helmets/mail_coif",
				"scripts/items/helmets/reinforced_mail_coif",
				"scripts/items/helmets/headscarf",
				"scripts/items/helmets/kettle_hat",
				"scripts/items/helmets/kettle_hat_with_mail",
				"scripts/items/helmets/flat_top_helmet",
				"scripts/items/helmets/flat_top_with_mail",
				"scripts/items/helmets/closed_flat_top_helmet",
				"scripts/items/helmets/closed_mail_coif",
				"scripts/items/helmets/bascinet_with_mail"
			];

			if (this.Const.DLC.Wildmen)
			{
				helmets.extend([
					"scripts/items/helmets/nordic_helmet",
					"scripts/items/helmets/steppe_helmet_with_mail"
				]);
			}

			this.m.Items.equip(this.new(helmets[this.Math.rand(1, helmets.len() - 1)]));
		}
	}

});

