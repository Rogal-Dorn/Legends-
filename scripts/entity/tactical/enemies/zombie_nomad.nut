this.zombie_nomad <- this.inherit("scripts/entity/tactical/enemies/zombie_yeoman", {
	m = {},
	function create()
	{
		this.zombie_yeoman.create();
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/zombie_nomad";
	}

	function assignRandomEquipment()
	{
		local weapons = [
			"weapons/oriental/saif",
			"weapons/scimitar",
			"weapons/oriental/nomad_mace",
			"weapons/boar_spear",
			"weapons/bludgeon",
			"weapons/butchers_cleaver",
			"weapons/oriental/light_southern_mace",
			"weapons/oriental/two_handed_saif",
			"weapons/two_handed_wooden_hammer",
			"weapons/woodcutters_axe"
		];
		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null && this.Math.rand(1, 100) <= 50)
		{
			local shields = [
				"shields/oriental/southern_light_shield"
			];
			local shield = this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]);

			if (this.Math.rand(1, 100) <= 66)
			{
				shield.setCondition(shield.getConditionMax() / 2 - 1);
			}

			this.m.Items.equip(shield);
		}

		local aList = [
			[1, "oriental/stitched_nomad_armor"],
			[1, "oriental/plated_nomad_mail"],
			[1, "oriental/leather_nomad_robe"],
			[1, "oriental/nomad_robe"],
			[1, "oriental/thick_nomad_robe"]
		];
		local armor = this.Const.World.Common.pickArmor(aList);
		this.m.Items.equip(armor);


		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body).setArmor(armor.getArmorMax() / 2 - 1);
		}


		local helmet = [
			[1, "oriental/nomad_leather_cap"],
			[1, "oriental/nomad_light_helmet"],
			[1, "oriental/nomad_reinforced_helmet"],
			[1, "oriental/leather_head_wrap"],
			[1, "oriental/nomad_head_wrap"],
			[1, "oriental/nomad_head_wrap"]
		];
		local helm = this.Const.World.Common.pickHelmet(helmet);

		if (this.Math.rand(1, 100) <= 66)
		{
			helm.setArmor(helmet.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(helm);
	}

});

