this.legends_zombie_low <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},
	
	function assignRandomEquipment()
	{
		local r;

		if (this.Math.rand(1, 100) <= 50)
		{
			r = this.Math.rand(1, 16);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/knife"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/wooden_stick"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pickaxe"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
			}
				else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_shiv"));
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_hammer"));
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_hoe"));
			}
			else if (r == 12)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_shovel"));
			}
			else if (r == 13)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_staff"));
			}
			else if (r == 14)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_sickle"));
			}
			else if (r == 15)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_scythe"));
			}
			else if (r == 16)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_wooden_pitchfork"));
			}
		}

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
