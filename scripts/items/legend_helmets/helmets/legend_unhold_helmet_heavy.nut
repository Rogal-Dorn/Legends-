this.legend_unhold_helmet_heavy <- this.inherit("scripts/items/helmets/barbarians/unhold_helmet_heavy", {
	m = {},
	function create()
	{
		this.unhold_helmet_heavy.create();
		this.m.ID = "armor.head.legend_unhold_helmet_heavy";
		this.m.IsDroppedAsLoot = true;
	}

	function getLootLayers()
	{
		return [this.new("scripts/items/legend_helmets/top/unhold_head_spike")];
	}

});

