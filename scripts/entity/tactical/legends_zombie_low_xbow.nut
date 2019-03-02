this.legends_zombie_low_xbow <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendZombieLightXbow;
		this.legend_zombie.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r;

		this.m.Items.equip(this.new("scripts/items/weapons/light_crossbow"));
		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));	

		r = this.Math.rand(1, 9);
		local armor;

		if (r == 1)
		{
			armor = this.new("scripts/items/armor/leather_tunic");
		}
		else if (r == 2)
		{
			armor = this.new("scripts/items/armor/linen_tunic");
		}
		else if (r == 3)
		{
			armor = this.new("scripts/items/armor/linen_tunic");
		}
		else if (r == 4)
		{
			armor = this.new("scripts/items/armor/sackcloth");
		}
		else if (r == 5)
		{
			armor = this.new("scripts/items/armor/tattered_sackcloth");
		}
		else if (r == 6)
		{
			armor = this.new("scripts/items/armor/leather_wraps");
		}
		else if (r == 7)
		{
			armor = this.new("scripts/items/armor/apron");
		}
		else if (r == 8)
		{
			armor = this.new("scripts/items/armor/butcher_apron");
		}
		else if (r == 9)
		{
			armor = this.new("scripts/items/armor/monk_robe");
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 33)
		{
			r = this.Math.rand(1, 5);
			local helmet;

			if (r == 1)
			{
				helmet = this.new("scripts/items/helmets/hood");
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/aketon_cap");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/full_aketon_cap");
			}
			else if (r == 4)
			{
				helmet = this.new("scripts/items/helmets/open_leather_cap");
			}
			else if (r == 5)
			{
				helmet = this.new("scripts/items/helmets/full_leather_cap");
			}

			if (this.Math.rand(1, 100) <= 50)
			{
				helmet.setArmor(helmet.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(helmet);
		}
	}

});
