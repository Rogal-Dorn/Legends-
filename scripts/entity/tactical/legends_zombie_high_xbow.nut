this.legends_zombie_high_xbow <- this.inherit("scripts/entity/tactical/legend_zombie", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendZombieHeavyXbow;
		this.legend_zombie.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r;

		this.m.Items.equip(this.new("scripts/items/weapons/heavy_crossbow"));
		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));	

		r = this.Math.rand(1, 5);
		local armor;

		if (r == 1)
		{
			armor = this.new("scripts/items/armor/padded_leather");
		}
		else if (r == 2)
		{
			armor = this.new("scripts/items/armor/worn_mail_shirt");
		}
		else if (r == 3)
		{
			armor = this.new("scripts/items/armor/patched_mail_shirt");
		}
		else if (r == 4)
		{
			armor = this.new("scripts/items/armor/ragged_surcoat");
		}
		else if (r == 5)
		{
			armor = this.new("scripts/items/armor/basic_mail_shirt");
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 75)
		{
			r = this.Math.rand(1, 7);
			local helmet;

			if (r == 1)
			{
				helmet = this.new("scripts/items/helmets/aketon_cap");
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/full_aketon_cap");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/kettle_hat");
			}
			else if (r == 4)
			{
				helmet = this.new("scripts/items/helmets/padded_kettle_hat");
			}
			else if (r == 5)
			{
				helmet = this.new("scripts/items/helmets/dented_nasal_helmet");
			}
			else if (r == 6)
			{
				helmet = this.new("scripts/items/helmets/mail_coif");
			}
			else if (r == 7)
			{
				helmet = this.new("scripts/items/helmets/full_leather_cap");
			}

			if (this.Math.rand(1, 100) <= 66)
			{
				helmet.setArmor(helmet.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(helmet);
		}
	}

});
