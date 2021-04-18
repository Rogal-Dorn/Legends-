this.legend_goblin_light_helmet <- this.inherit("scripts/items/helmets/greenskins/goblin_light_helmet", {
	m = {},
	function create()
	{
		this.goblin_light_helmet.create();
		this.m.ID = "armor.head.legend_goblin_light_helmet";
		this.m.IsDroppedAsLoot = true;
	}

	function getLootLayers()
	{
		local L = [this.new("scripts/items/legend_helmets/hood/legend_helmet_cloth_cap")];
		if (this.Math.rand(0,1) == 0)
		{
			L.push(this.new("scripts/items/legend_helmets/top/legend_helmet_goblin_leather_mask"))
		}
		else
		{
			L.push(this.new("scripts/items/legend_helmets/top/legend_helmet_goblin_leather_helm"))
		}
		if (this.Math.rand(0,1) == 0)
		{
		}
		else
		{
			L.push(this.new("scripts/items/legend_helmets/vanity_lower/legend_helmet_goblin_tail"))
		}

		return L;
	}
});

