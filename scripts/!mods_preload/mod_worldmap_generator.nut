::mods_hookNewObject("mapgen/templates/world/worldmap_generator", function(o) {
    o.isWorldAcceptable = function (_rect) 
	{
		local ocean = 0;
		local nonOcean = 0;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean)
				{
					ocean = ++ocean;
				}
				else
				{
					nonOcean = ++nonOcean;
				}
			}
		}
        this.logInfo("Land:" + nonOcean + " Ocean:" + ocean);
		return nonOcean * 1.0 / (ocean * 1.0) >= this.Const.World.Settings.MinLandToWaterRatio;
	}

    o.fill = function ( _rect, _properties, _pass = 1 )
	{
		this.Const.World.Buildings.reset();
		this.m.Tiles = [];
		this.m.Tiles.resize(this.Const.World.TerrainType.COUNT);

		for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
		{
			if (this.Const.World.TerrainScript[i].len() != 0)
			{
				this.m.Tiles[i] = this.MapGen.get(this.Const.World.TerrainScript[i]);
			}
		}

		this.__ping();

		this.buildLandAndSea(_rect);
		this.__ping();
        if (!this.isWorldAcceptable(_rect))
        {
            this.clearWorld(_rect);
            return false;
        }

        local result;
		this.__ping();
		this.buildElevation(_rect);
		this.__ping();
		this.buildTerrain(_rect);
		this.__ping();
		this.defragmentTerrain(_rect);
		this.__ping();
		this.removeStraits(_rect);
		this.__ping();
		this.refineTerrain(_rect, _properties);
		this.__ping();
        if (!this.buildSettlements(_rect))
        {
			this.clearWorld(_rect);
			this.World.clearScene();
            return false;
        }
		this.__ping();
		this.buildRoads(_rect, _properties);
		this.__ping();
		this.refineSettlements(_rect);
		this.__ping();
		this.guaranteeAllBuildingsInSettlements();
		this.__ping();
		this.buildAdditionalRoads(_rect, _properties);
		this.__ping();
		this.buildRoadSprites(_rect, _properties);
		this.__ping();
		this.buildLabels(_rect);
		this.__ping();
        return true;
	}

    o.buildSettlements = function ( _rect )
	{
		this.logInfo("Building settlements...");
		local tries = 0;
		local isLeft = this.Math.rand(0, 1);
		local settlementTiles = [];

		foreach( list in this.Const.World.Settlements.Master )
		{
			local num = list.Amount;

			while (num > 0 && tries++ < 3000)
			{
				local x;
				local y;

				if (isLeft)
				{
					x = this.Math.rand(6, _rect.W * 0.6);
				}
				else
				{
					x = this.Math.rand(_rect.W * 0.4, _rect.W - 6);
				}

				y = this.Math.rand(6, _rect.H * 0.95);
				local tile = this.World.getTileSquare(x, y);
				local next = false;

				foreach( settlement in settlementTiles )
				{
					if (tile.getDistanceTo(settlement) < 12)
					{
						next = true;
						break;
					}
				}

				if (next)
				{
					continue;
				}

				local terrain = this.getTerrainInRegion(tile);

				if (terrain.Adjacent[this.Const.World.TerrainType.Ocean] >= 3 || terrain.Adjacent[this.Const.World.TerrainType.Shore] >= 3)
				{
					continue;
				}

				local candidates = [];

				foreach( settlement in list.List )
				{
					if (settlement.isSuitable(terrain))
					{
						candidates.push(settlement);
					}
				}

				if (candidates.len() == 0)
				{
					continue;
				}

				local type = candidates[this.Math.rand(0, candidates.len() - 1)];

				if ((terrain.Region[this.Const.World.TerrainType.Ocean] >= 3 || terrain.Region[this.Const.World.TerrainType.Shore] >= 3) && !("IsCoastal" in type))
				{
					continue;
				}

				if (!("IsCoastal" in type))
				{
					local skip = true;
					local navSettings = this.World.getNavigator().createSettings();

					foreach( s in this.World.EntityManager.getSettlements() )
					{
						navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
						local path = this.World.getNavigator().findPath(tile, s.getTile(), navSettings, 0);

						if (!path.isEmpty())
						{
							skip = false;
							break;
						}
					}

					if (skip)
					{
						continue;
					}
				}
				else if (settlementTiles.len() >= 1 && tries < 1000)
				{
					local hasConnection = false;

					foreach( settlement in settlementTiles )
					{
						local navSettings = this.World.getNavigator().createSettings();
						navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;
						local path = this.World.getNavigator().findPath(tile, settlement, navSettings, 0);

						if (!path.isEmpty())
						{
							hasConnection = true;
							break;
						}
					}

					if (!hasConnection)
					{
						continue;
					}
				}

				tile.clear();
				local entity = this.World.spawnLocation(type.Script, tile.Coords);
				settlementTiles.push(tile);
				tries = 0;
				num = --num;
			}
		}

		this.logInfo("Created " + settlementTiles.len() + " settlements.");
		return settlementTiles.len() >= 19
	}	
})