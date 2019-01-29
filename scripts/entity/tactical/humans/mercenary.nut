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
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(0, 8);

		if (r <= 1)
		{
			if (this.Const.DLC.Unhold)
			{
				local r = this.Math.rand(1, 5);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/billhook"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pike"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));
				}
				else if (r == 5)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/polehammer"));
				}
			}
			else
			{
				local r = this.Math.rand(1, 4);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/billhook"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pike"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
				}
				else if (r == 4)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
				}
			}
		}
		else
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(2, 9);
			}
			else
			{
				r = this.Math.rand(2, 8);
			}

			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/morning_star"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/falchion"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/flail"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/military_pick"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/three_headed_flail"));
			}

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
			local r = this.Math.rand(1, 12);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mail_coif"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/reinforced_mail_coif"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat_with_mail"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/flat_top_helmet"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/flat_top_with_mail"));
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/closed_mail_coif"));
			}
			else if (r == 12)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/bascinet_with_mail"));
			}
		}
	}

});
