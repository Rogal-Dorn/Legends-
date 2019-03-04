this.tactical_graveyard <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.graveyard";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2, _rect.H / 2);
		local minDist = 0;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d < minDist || d > 10)
				{
				}
				else if (d == 10)
				{
					if (this.Math.rand(1, 100) < 50)
					{
						tile.removeObject();
						local o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
						o.setDirBasedOnCenter(centerTile, 10);
					}
				}
				else if (d < 9 && tile.IsEmpty)
				{
					if (this.Math.rand(1, 100) <= 3)
					{
						tile.spawnObject("entity/tactical/objects/graveyard_ruin");
					}
					else if (this.Math.rand(1, 100) <= 13)
					{
						tile.spawnObject("entity/tactical/objects/graveyard_grave");
					}
					else if (this.Math.rand(1, 100) <= 10)
					{
						local deco = [
							"05",
							"06",
							"21",
							"22",
							"23",
							"24",
							"25",
							"26",
							"27",
							"28"
						];
						tile.clear();
						tile.spawnDetail("graveyard_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
				}
			}
		}
	}

});

