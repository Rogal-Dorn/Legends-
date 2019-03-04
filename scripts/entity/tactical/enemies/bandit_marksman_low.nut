this.bandit_marksman_low <- this.inherit("scripts/entity/tactical/enemies/bandit_marksman", {
	m = {},
	function create()
	{
		this.bandit_marksman.create();
		this.m.IsLow = true;
	}

	function onInit()
	{
		this.bandit_marksman.onInit();
		this.m.BaseProperties.Initiative -= 10;
		this.m.BaseProperties.RangedSkill -= 10;
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		if (this.Math.rand(1, 3) != 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/short_bow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/light_crossbow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}

		this.m.Items.addToBag(this.new("scripts/items/weapons/knife"));
		this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));

		if (this.Math.rand(1, 100) <= 50)
		{
			local r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));
			}
		}
	}

});

