this.legends_skeleton_med <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},

	function onInit()
	{
		this.skeleton.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.SkeletonMedium);
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/broken_ancient_sword"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_sword"));
		}

		if (this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			if (this.Math.rand(1, 100) <= 66)
			{
				this.m.Items.equip(this.new("scripts/items/shields/ancient/coffin_shield"));
			}
			else
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
