this.hedge_knight <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.HedgeKnight;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.HedgeKnight.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.HedgeKnight);
		b.TargetAttractionMult = 1.0;
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
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_devastating_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
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
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bloody_harvest"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function assignRandomEquipment()
	{
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/fighting_axe",
				"weapons/noble_sword",
				"weapons/arming_sword"
			];

			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/greatsword",
					"weapons/greataxe",
					"weapons/warbrand",
					"weapons/two_handed_hammer"
				]);
			}

			if (this.Const.DLC.Unhold && this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/two_handed_flanged_mace",
					"weapons/two_handed_flail"
				]);
			}

			if (this.Const.DLC.Wildmen && this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
			{
				weapons.extend([
					"weapons/bardiche"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
		{
			local shields = [
				"shields/heater_shield",
				"shields/kite_shield"
			];
			this.m.Items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
		{

			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local cloths = [
					[0, ""],
					[0, "cloth/legend_gambeson"],
					[0, "cloth/legend_gambeson_plain"],
					[1, "cloth/legend_gambeson_rare_color"],
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
						[0, "chain/legend_armor_basic_mail"],
						[1, "chain/legend_armor_hauberk"],
						[1, "chain/legend_armor_hauberk_full"],
						[0, "chain/legend_armor_hauberk_sleevless"],
						[1, "chain/legend_armor_reinforced_mail"],
						[1, "chain/legend_armor_reinforced_mail_shirt"],
						[0, "chain/legend_armor_reinforced_rotten_mail_shirt"],
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
						[5, ""],
						[1, "plate/legend_armor_leather_brigandine"],
						[1, "plate/legend_armor_leather_brigandine_hardened"],
						[1, "plate/legend_armor_leather_brigandine_hardened_full"],
						[0, "plate/legend_armor_leather_jacket"],
						[0, "plate/legend_armor_leather_jacket_simple"],
						[1, "plate/legend_armor_leather_lamellar"],
						[1, "plate/legend_armor_leather_lamellar_harness_heavy"],
						[1, "plate/legend_armor_leather_lamellar_harness_reinforced"],
						[1, "plate/legend_armor_leather_lamellar_heavy"],
						[1, "plate/legend_armor_leather_lamellar_reinforced"],
						[0, "plate/legend_armor_leather_noble"],
						[0, "plate/legend_armor_leather_padded"],
						[0, "plate/legend_armor_leather_riveted"],
						[0, "plate/legend_armor_leather_riveted_light"],
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
						[1, "plate/legend_armor_plate_full"],
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
				local armor = [
					"armor/coat_of_plates",
					"armor/coat_of_scales",
					"armor/reinforced_mail_hauberk",
					"armor/heavy_lamellar_armor"
				];
				this.m.Items.equip(this.new("scripts/items/" + armor[this.Math.rand(0, armor.len() - 1)]));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head))
		{
			local helmet = [
				"helmets/full_helm",
				"helmets/closed_flat_top_with_mail"
			];
			this.m.Items.equip(this.new("scripts/items/" + helmet[this.Math.rand(0, helmet.len() - 1)]));
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
			"weapons/named/named_cleaver",
			"weapons/named/named_greataxe",
			"weapons/named/named_greatsword",
			"weapons/named/named_mace",
			"weapons/named/named_sword",
			"weapons/named/named_two_handed_hammer",
			"weapons/named/named_warbrand"
		];

		if (this.Const.DLC.Unhold)
		{
			weapons.extend([
				"weapons/named/named_two_handed_mace",
				"weapons/named/named_two_handed_flail"
			]);
		}

		if (this.Const.DLC.Wildmen)
		{
			weapons.extend([
				"weapons/named/named_bardiche"
			]);
		}

		local shields = clone this.Const.Items.NamedShields;
		shields.extend([
			"shields/named/named_bandit_kite_shield",
			"shields/named/named_bandit_heater_shield"
		]);
		local armor = [
			"armor/named/brown_coat_of_plates_armor",
			"armor/named/golden_scale_armor",
			"armor/named/green_coat_of_plates_armor"
		];
		local legend_armor = [
			"legend_armor/named/legend_brown_coat_of_plates_armor",
			"legend_armor/named/legend_golden_scale_armor",
			"legend_armor/named/legend_green_coat_of_plates_armor"
		];


		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		return true;
	}

});

