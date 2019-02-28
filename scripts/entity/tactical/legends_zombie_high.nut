this.legends_zombie_high <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},
	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendZombieHeavy;
		this.legend_zombie.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.update();	
	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(0, 8);

		if (r <= 1)
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/two_handed_flail"));
				}
			}
			else
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
				}
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/winged_mace"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/morning_star"));
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
				this.m.Items.equip(this.new("scripts/items/weapons/military_cleaver"));
			}

			if (this.isKindOf(this, "zombie_knight_bodyguard") && this.Math.rand(1, 100) <= 2)
			{
				if (this.Math.rand(1, 2) == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_undead_heater_shield"));
				}
				else
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_undead_kite_shield"));
				}
			}
			else if (this.Math.rand(1, 2) == 1)
			{
				this.m.Items.equip(this.new("scripts/items/shields/worn_heater_shield"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/shields/worn_kite_shield"));
			}
		}

		r = this.Math.rand(1, 3);
		local armor;

		if (r == 1)
		{
			armor = this.new("scripts/items/armor/decayed_coat_of_plates");
		}
		else if (r == 2)
		{
			armor = this.new("scripts/items/armor/decayed_coat_of_scales");
		}
		else if (r == 3)
		{
			armor = this.new("scripts/items/armor/decayed_reinforced_mail_hauberk");
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 90)
		{
			r = this.Math.rand(1, 3);
			local helmet;

			if (r == 1)
			{
				if (this.Math.rand(1, 4) <= 3)
				{
					helmet = this.new("scripts/items/helmets/decayed_closed_flat_top_with_mail");
				}
				else
				{
					helmet = this.new("scripts/items/helmets/decayed_closed_flat_top_with_sack");
				}
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/decayed_full_helm");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/decayed_great_helm");
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				helmet.setArmor(helmet.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(helmet);
		}
	}
});
