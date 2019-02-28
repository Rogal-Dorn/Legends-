this.legends_skeleton_high <- this.inherit("scripts/entity/tactical/legend_skeleton", {
	m = {},

	function onInit()
	{
		this.m.SpawnType = this.Const.Tactical.Actor.LegendSkeletonHeavy;
		this.legend_skeleton.onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));		
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 5);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_sword"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/warscythe"));
		}

		if (this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			this.m.Items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
		}

		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_plated_scale_hauberk"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_scale_coat"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_plate_harness"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ancient/ancient_plated_mail_hauberk"));
		}

		this.m.Items.equip(this.new("scripts/items/helmets/ancient/ancient_honorguard_helmet"));
	}

});
