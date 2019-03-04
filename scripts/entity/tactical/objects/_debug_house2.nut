this._debug_house2 <- this.inherit("scripts/entity/tactical/entity", {
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
		local offset = 200;
		this.addMultiTilePart("filet_0", offset, -2, 2, 2);
		this.addMultiTilePart("filet_1", offset, -1, 1, 3);
		local body = this.addSprite("body");
		body.setBrush("filet_2");
		this.setSpriteOffset("body", this.createVec(0, offset));
		this.addMultiTileBlocker(0, 0, 3);
		this.addMultiTilePart("filet_3", offset, 1, 0, 2);
		this.addMultiTilePart("filet_4", offset, 2, 0, 2);
	}

	function addMultiTilePart( _brush, _heightOffset, _x, _y, _height )
	{
		local myTile = this.getTile();
		local tile = this.Tactical.getTile(myTile.Coords.X + _x, myTile.Coords.Y + _y);
		local d = this.createVec(0, myTile.Pos.Y - tile.Pos.Y + _heightOffset);
		tile.removeObject();
		local object = tile.spawnObject("entity/tactical/objects/generic_object");
		object.addSprite("body").setBrush(_brush);
		object.setSpriteOffset("body", d);
		object.setBlockSight(true);
		object.setDescription(this.getDescription());
		object.setName(this.getName());
		this.addMultiTileBlocker(_x, _y, _height);
	}

	function addMultiTileBlocker( _x, _y, _height )
	{
		local myTile = this.getTile();

		for( local i = 1; i <= _height; i = ++i )
		{
			local blockTile = this.Tactical.getTile(myTile.Coords.X + _x, myTile.Coords.Y + _y + i);
			blockTile.removeObject();
			local blocker = blockTile.spawnObject("entity/tactical/objects/generic_object");
			blocker.setDescription(this.getDescription());
			blocker.setName(this.getName());
		}
	}

});

