this.multi_tile_object <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function onRender()
	{
		this.getSprite("body").Visible = !this.Tactical.getCamera().IsFlipped;

		if (this.getSprite("body").Visible)
		{
			this.logInfo("standard visible!");
		}
	}

	function addMultiTilePart( _brush, _heightOffset, _x, _y, _height )
	{
		this.setRenderCallbackEnabled(true);
		local myTile = this.getTile();
		local tile = this.Tactical.getTile(myTile.Coords.X + _x, myTile.Coords.Y + _y);
		local d = this.createVec(0, myTile.Pos.Y - tile.Pos.Y + _heightOffset);
		tile.removeObject();
		tile.Level = 0;
		local object = tile.spawnObject("entity/tactical/objects/generic_object");
		local s = object.addSprite("body");
		s.setBrush(_brush);
		object.setVisibleOnCameraFlip(false);
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
			blockTile.Level = 0;
			local blocker = blockTile.spawnObject("entity/tactical/objects/generic_object");
			blocker.setDescription(this.getDescription());
			blocker.setName(this.getName());
			blocker.setBlockSight(true);
		}
	}

	function addMultiTileMirror( _brush, _heightOffset, _x, _y, _height )
	{
		local myTile = this.getTile();
		local blockTile = this.Tactical.getTile(myTile.Coords.X + _x, myTile.Coords.Y + _y + _height);
		blockTile.removeObject();
		blockTile.Level = 0;
		local blocker = blockTile.spawnObject("entity/tactical/objects/generic_object");
		blocker.setDescription(this.getDescription());
		blocker.setName(this.getName());
		blocker.setBlockSight(true);
		blocker.addSprite("body").setBrush(_brush);
		blocker.setVisibleOnCameraFlip(true);
		local d = this.createVec(0, blockTile.Pos.Y - myTile.Pos.Y + _heightOffset - 200);
		blocker.setSpriteOffset("body", d);
	}

});
