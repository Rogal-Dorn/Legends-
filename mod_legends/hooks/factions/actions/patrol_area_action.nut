::mods_hookExactClass("factions/actions/patrol_area_action", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Cooldown = 200.0;
	}

	o.onExecute = function ( _faction )
	{
		local settlements = _faction.getSettlements();
		local party = _faction.spawnEntity(settlements[0].getTile(), "Regiment of " + settlements[0].getName(), true, this.Const.World.Spawn.Southern, this.Math.rand(120, 250) * this.getReputationToDifficultyLightMult());
		party.getSprite("body").setBrush(party.getSprite("body").getBrush().Name + "_" + _faction.getBannerString());
		party.setDescription("Conscripted soldiers loyal to their city state.");
		party.setFootprintType(this.Const.World.FootprintsType.CityState);
		party.getFlags().set("IsRandomlySpawned", true);
		party.getLoot().Money = this.Math.rand(100, 300);
		party.getLoot().ArmorParts = this.Math.rand(10, 35);
		party.getLoot().Medicine = this.Math.rand(5, 15);
		party.getLoot().Ammo = this.Math.rand(10, 40);
		local r = this.Math.rand(1, 4);

		if (r <= 2)
		{
			party.addToInventory("supplies/rice_item");
		}
		else if (r == 3)
		{
			party.addToInventory("supplies/dates_item");
		}
		else if (r == 4)
		{
			party.addToInventory("supplies/dried_lamb_item");
		}

		local arr = ["trade/silk_item", "trade/silk_item", "trade/incense_item", "trade/spices_item"]
		for(local i = 0; i < this.Math.round(r/2); i++) //adds either 1 silk, 1 silk, 2 incense, 2 spices
		{
			party.addToInventory(arr[r-1])
		}

		local c = party.getController();
		local roam = this.new("scripts/ai/world/orders/roam_order");
		roam.setAllTerrainAvailable();
		roam.setTerrain(this.Const.World.TerrainType.Ocean, false);
		roam.setTerrain(this.Const.World.TerrainType.Shore, false);
		roam.setTerrain(this.Const.World.TerrainType.Mountains, false);
		roam.setPivot(settlements[0]);
		roam.setMinRange(1);
		roam.setMaxRange(10);
		roam.setTime(300.0);
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(settlements[0].getTile());
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(roam);
		c.addOrder(move);
		c.addOrder(despawn);
		this.m.Cooldown = this.World.FactionManager.isGreaterEvil() ? 150.0 : 300.0;
		return true;
	}
});
