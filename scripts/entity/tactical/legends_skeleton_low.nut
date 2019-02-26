this.legends_skeleton_low <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.SkeletonLight;
		this.legend_skeleton.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_sword"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_spear"));		
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/broken_ancient_sword"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/falx"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}

		// if (this.Math.rand(1, 100) <= 66)
		// {
		// 	this.m.Items.equip(this.new("scripts/items/shields/ancient/auxiliary_shield"));
		// }

		if (this.Math.rand(1, 100) <= 50)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_ripped_cloth"));
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/ancient/ancient_household_helmet"));
		}
	}

});
