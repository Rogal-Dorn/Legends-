this.orc_camp_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "A small camp erected by Orcs, either as part of a large horde in the vicinity or a small tribes of its own. They\'ll eventually move on to hunt and pillage elsewhere.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.orc_camp";
		this.m.LocationType = this.Const.World.LocationType.Lair | this.Const.World.LocationType.Mobile;
		this.setDefenderSpawnList(this.Const.World.Spawn.OrcDefenders);
		this.m.Resources = 140;
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.GreenskinCamp);
		this.location.onSpawned();
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropArmorParts(this.Math.rand(10, 25), _lootTable);
		this.dropMedicine(this.Math.rand(0, 2), _lootTable);
		this.dropFood(this.Math.rand(2, 4), [
			"strange_meat_item"
		], _lootTable);
		this.dropTreasure(this.Math.rand(0, 1), [
			"trade/furs_item",
			"trade/copper_ingots_item"
		], _lootTable);

		if (this.Const.DLC.Unhold && this.Math.rand(1, 100) <= 10)
		{
			local treasure = [];
			treasure.push("misc/paint_black_item");
			treasure.push("misc/paint_red_item");
			this.dropTreasure(1, treasure, _lootTable);
		}
	}

	function onInit()
	{
		this.location.onInit();
		this.setVisibleInFogOfWar(true);
		local body = this.addSprite("body");
		body.setBrush("world_orc_camp_01");
	}

	function onSerialize( _out )
	{
		this.location.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.location.onDeserialize(_in);
	}

});
