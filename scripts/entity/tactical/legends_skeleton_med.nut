this.legends_skeleton_med <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendSkeletonMedium;
		this.legend_skeleton.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 4);

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
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_sword"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}		

		if (this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{

			r = this.Math.rand(1, 4);
			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/shields/ancient/auxiliary_shield"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/shields/ancient/coffin_shield"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
			}
		}

		r = this.Math.rand(1, 4);

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

		this.m.Items.equip(this.new("scripts/items/helmets/ancient/ancient_legionary_helmet"));
	}

});
