this._debug_house <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Boulder;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Boulder;
	}

	function onInit()
	{
		local bottom = this.addSprite("bottom");
		bottom.setBrush("house_01");
		local tile = this.getTile();
		this.Tactical.getTile(tile.Coords.X, tile.Coords.Y + 1).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X, tile.Coords.Y + 2).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X, tile.Coords.Y + 3).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 1, tile.Coords.Y + 1).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X + 1, tile.Coords.Y + 1).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 1, tile.Coords.Y + 2).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 2, tile.Coords.Y + 2).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X + 1, tile.Coords.Y + 2).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 1, tile.Coords.Y + 3).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 2, tile.Coords.Y + 3).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 1, tile.Coords.Y + 4).spawnObject("entity/tactical/objects/_debug_house_block");
		this.Tactical.getTile(tile.Coords.X - 2, tile.Coords.Y + 4).spawnObject("entity/tactical/objects/_debug_house_block");
	}

});

