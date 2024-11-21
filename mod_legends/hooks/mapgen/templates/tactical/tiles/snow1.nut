::mods_hookExactClass("mapgen/templates/tactical/tiles/snow1", function(o)
{
	local init = o.init;
	o.init = function ()
	{
		init();
		// todo this is crashing the game, so commented out
//		local t = this.createTileTransition();
//		this.Tactical.setTransitions("tile_legend_snow_01", t);
//		this.Tactical.setTransitions("tile_legend_snow_02", t);
//		this.Tactical.setTransitions("tile_legend_snow_03", t);
//		this.Tactical.setTransitions("tile_legend_snow_04", t);
//		this.Tactical.setTransitions("tile_legend_snow_05", t);
//		this.Tactical.setTransitions("tile_legend_snow_06", t);
//		this.Tactical.setTransitions("tile_legend_snow_07", t);
//		this.Tactical.setTransitions("tile_legend_snow_08", t);
	}
	// todo this is crashing the game, so commented out, replacement for patching purposes
	local onFirstPass = o.onFirstPass;
	o.onFirstPass = function ( _rect ) {
		onFirstPass(_rect);
	}


//	o.onFirstPass = function ( _rect )
//	{
//		local tile = this.Tactical.getTileSquare(_rect.X, _rect.Y);
//
//		if (tile.Type != 0)
//		{
//			return;
//		}
//
//		local isSpawningObjects = !("SpawnObjects" in _rect) || _rect.SpawnObjects;
//		tile.Type = this.Const.Tactical.TerrainType.RoughGround;
//		tile.Subtype = this.Const.Tactical.TerrainSubtype.Snow;
//		tile.BlendPriority = this.Const.Tactical.TileBlendPriority.Snow1;
//		tile.IsBadTerrain = false;
//		local random = this.Math.rand(1, 100);
//		if (random <= 30)
//		{
//		tile.setBrush("tile_snow_01");
//		}
//		else if (random >= 31 && random <=40)
//		{
//		tile.setBrush("tile_legend_snow_02");
//		}
//		else if (random >= 41 && random <=50)
//		{
//		tile.setBrush("tile_legend_snow_03");
//		}
//		else if (random >= 51 && random <=60)
//		{
//		tile.setBrush("tile_legend_snow_04");
//		}
//		else if (random >= 61 && random <=70)
//		{
//		tile.setBrush("tile_legend_snow_05");
//		}
//		else if (random >= 71 && random <=80)
//		{
//		tile.setBrush("tile_legend_snow_06");
//		}
//		else if (random >= 81 && random <=90)
//		{
//		tile.setBrush("tile_legend_snow_07");
//		}
//		else
//		{
//		tile.setBrush("tile_legend_snow_08");
//		}
//		local n = 0;
//
//		if (isSpawningObjects && this.Math.rand(0, 100) < this.m.ChanceToSpawnObject)
//		{
//			if (!tile.hasNextTile(this.Const.Direction.S) || tile.getNextTile(this.Const.Direction.S).IsEmpty)
//			{
//				tile.spawnObject(this.m.Objects[this.Math.rand(0, this.m.Objects.len() - 1)]);
//			}
//		}
//		else if (this.Math.rand(1, 100) <= this.m.ChanceToSpawnDetails)
//		{
//			if (this.Math.rand(1, 100) <= 90)
//			{
//				tile.spawnDetail(this.m.DetailsSnow[this.Math.rand(0, this.m.DetailsSnow.len() - 1)]);
//			}
//			else
//			{
//				tile.spawnDetail(this.m.Details[this.Math.rand(0, this.m.Details.len() - 1)]);
//			}
//		}
//	}
});
