::mods_hookExactClass("factions/actions/patrol_area_action", function(o) 
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Cooldown = 200.0;
	}

	local onExecute = o.onExecute;
	o.onExecute = function ( _faction )
	{
		onExecute(_faction);
		party.getLoot().Money = this.Math.rand(100, 300);
		party.getLoot().ArmorParts = this.Math.rand(10, 35);
		party.getLoot().Medicine = this.Math.rand(5, 15);
		party.getLoot().Ammo = this.Math.rand(10, 40);
		local arr = ["trade/silk_item", "trade/silk_item", "trade/incense_item", "trade/spices_item"]
		for(local i = 0; i < this.Math.round(r/2); i++) //adds either 1 silk, 1 silk, 2 incense, 2 spices
		{
			party.addToInventory(arr[r-1])
		}
		roam.setTime(300.0);
		this.m.Cooldown = this.World.FactionManager.isGreaterEvil() ? 150.0 : 300.0;
	}
});