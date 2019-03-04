this.human_tent1 <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "A tent";
	}

	function getDescription()
	{
		return "TODO";
	}

	function onInit()
	{
		local offset = 80;
		this.getTile().Level = 0;
		local body = this.addSprite("body");
		body.setBrush("tent_01_01");
		this.setSpriteOffset("body", this.createVec(0, offset));
		this.addMultiTileBlocker(0, 0, 1);
		this.addMultiTilePart("tent_01_02", offset, 1, -1, 2);
		this.addMultiTilePart("tent_01_03", offset, 2, -1, 2);
		this.addMultiTilePart("tent_01_04", offset, 3, -1, 0);
	}

	function addMultiTilePart( _brush, _heightOffset, _x, _y, _height )
	{
		local myTile = this.getTile();
		local tile = this.Tactical.getTile(myTile.Coords.X + _x, myTile.Coords.Y + _y);
		local d = this.createVec(0, myTile.Pos.Y - tile.Pos.Y + _heightOffset);
		tile.removeObject();
		tile.Level = 0;
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

