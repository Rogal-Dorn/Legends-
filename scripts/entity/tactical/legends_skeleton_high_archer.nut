this.legends_skeleton_high_archer <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendSkeletonHeavyArcher;
		this.legend_skeleton.onInit();;
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		this.m.Items.equip(this.new("scripts/items/weapons/war_bow"));
		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));

		// if (this.Math.rand(1, 100) <= 66)
		// {
		// 	this.m.Items.equip(this.new("scripts/items/shields/ancient/auxiliary_shield"));
		// }


		local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_scale_harness"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_breastplate"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_mail"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_double_layer_mail"));
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/ancient/ancient_household_helmet"));
		}
	}

});
