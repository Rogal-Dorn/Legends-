this.tactical_orc_camp <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.orc_camp";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2 + 6, _rect.H / 2);
		local minDist = 0;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d < minDist || d > 7)
				{
				}
				else if (d == 7)
				{
					if (this.Math.rand(1, 100) < 40)
					{
						tile.removeObject();
						local o = tile.spawnObject("entity/tactical/objects/orc_camp_wall");
						o.setDirBasedOnCenter(centerTile, 10);
					}
				}
				else if (d < 6 && tile.IsEmpty)
				{
					if (this.Math.rand(1, 100) <= 5)
					{
						tile.spawnObject("entity/tactical/objects/orc_camp_pole");
					}
					else if (this.Math.rand(1, 100) <= 10)
					{
						tile.spawnObject("entity/tactical/objects/orc_camp_object");
					}
				}
			}
		}
	}

});
