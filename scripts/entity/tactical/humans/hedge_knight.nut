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
		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Hitpoints = b.Hitpoints * 1.5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bloody_harvest"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function assignRandomEquipment()
	{
		local r;

		if (this.Math.rand(1, 100) <= 3)
		{
			r = this.Math.rand(1, 5);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_flail"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_axe"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_sword"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_greataxe"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_two_handed_hammer"));
			}
		}
		else
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 9);
			}
			else
			{
				r = this.Math.rand(1, 7);
			}

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/two_handed_hammer"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/two_handed_flail"));
			}
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand))
		{
			r = this.Math.rand(1, 2);
			local shield;

			if (r == 1)
			{
				shield = this.new("scripts/items/shields/kite_shield");
			}
			else if (r == 2)
			{
				shield = this.new("scripts/items/shields/heater_shield");
			}

			this.m.Items.equip(shield);
		}

		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/coat_of_plates"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/coat_of_scales"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/heavy_lamellar_armor"));
		}

		r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/full_helm"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_flat_top_with_mail"));
		}
	}

});
