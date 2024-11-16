::mods_hookExactClass("mapgen/templates/tactical/tiles/snow2", function(o)
{
	local init = o.init;
	o.init = function ()
	{
		init();
		local t = this.createTileTransition();
		this.Tactical.setTransitions("tile_legend_snow_09", t);
		this.Tactical.setTransitions("tile_legend_snow_10", t);
		this.Tactical.setTransitions("tile_legend_snow_11", t);
		this.Tactical.setTransitions("tile_legend_snow_12", t);
		this.Tactical.setTransitions("tile_legend_snow_13", t);
	}

	o.onFirstPass = function ( _rect, _objectSpawnChanceMult = 1.0 )
	{
		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);

		if (tile.Type != 0)
		{
			return;
		}

		local isSpawningObjects = !("SpawnObjects" in _rect) || _rect.SpawnObjects;
		tile.Type = this.Const.Tactical.TerrainType.RoughGround;
		tile.Subtype = this.Const.Tactical.TerrainSubtype.Snow;
		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Snow2;
		tile.IsBadTerrain = false;


		 local random = this.Math.rand(1, 100);
		if (random <= 20)
		{
		tile.setBrush("tile_snow_02");
		}
		else if (random >= 21 && random <=30)
		{
		tile.setBrush("tile_legend_snow_09");
		}
		else if (random >= 31 && random <=40)
		{
		tile.setBrush("tile_legend_snow_10");
		}
		else if (random >= 41 && random <=60)
		{
		tile.setBrush("tile_legend_snow_11");
		}
		else if (random >= 61 && random <=80)
		{
		tile.setBrush("tile_legend_snow_12");
		}
		else
		{
		tile.setBrush("tile_legend_snow_13");
		}

		local n = 0;

		if (isSpawningObjects && this.Math.rand(0, 100) < this.m.ChanceToSpawnObject * _objectSpawnChanceMult)
		{
			if (_objectSpawnChanceMult != 1.0 || !tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
			{
				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
			}
		}
		else if (this.Math.rand(1, 100) <= this.m.ChanceToSpawnDetails)
		{
			if (this.Math.rand(1, 100) <= 90)
			{
				tile.spawnDetail(this.m.DetailsSnow[this.Math.rand(0, this.m.DetailsSnow.len() - 1)]);
			}
			else
			{
				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
			}
		}
	}
});
