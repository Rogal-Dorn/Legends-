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

    o.fill = function ( _rect, _properties)
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
        if (!this.buildSettlements(_rect, _properties))
        {
			this.clearWorld(_rect);
			//this.World.clearScene();
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

	o.addSettlement <- function (_rect, isLeft, settlementList, settlementTiles) 
	{
		local tries = 0;
		while (tries++ < 9000)
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

			local distance = 12;
			if (tries > 3000) {
				distance = 8;
			}
			if (tries > 6000) {
				distance = 4;
			}
			foreach( settlement in settlementTiles )
			{
				if (tile.getDistanceTo(settlement) < distance)
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

			foreach( settlement in settlementList )
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

			local randCandidates = [];
			while (candidates.len() > 0)
			{
				local sIndex = this.Math.rand(0, candidates.len() - 1)
				randCandidates.push(candidates[sIndex]);

				local tempCandidates = [];
				foreach(i, t in candidates)
				{
					if (i == sIndex)
					{
						continue
					}
					tempCandidates.push(candidates[i]);
				}
				candidates = tempCandidates;
			}

			local stype = null;
			foreach( s in randCandidates)
			{
				if ((terrain.Region[this.Const.World.TerrainType.Ocean] >= 3 || terrain.Region[this.Const.World.TerrainType.Shore] >= 3) && !("IsCoastal" in s))
				{
					continue;
				}
				stype = s;
				break;
			}

			if (stype == null)
			{
				continue;
			}

			if (!("IsCoastal" in stype))
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
			local entity = this.World.spawnLocation(stype.Script, tile.Coords);
			settlementTiles.push(tile);
			return settlementTiles;
		}
		return settlementTiles
	}

    o.buildSettlements = function ( _rect, _properties )
	{
		this.logInfo("Building settlements...");
		local tries = 0;
		local isLeft = this.Math.rand(0, 1);
		local settlementTiles = [];

		foreach( list in this.Const.World.Settlements.LegendsMaster )
		{
			local num = Math.ceil(_properties.NumSettlements * list.Ratio)
			//Add at least one of each
			foreach (s in list.List)
			{
				settlementTiles = this.addSettlement(_rect, isLeft, s.List, settlementTiles);
				num = --num;
			}
			while (num > 0)
			{
				local r = this.Math.rand(1, 10);
				local total = 0;
				foreach (s in list.List)
				{
					total += s.Ratio;
					if (r > total)
					{
						continue;
					}
					settlementTiles = this.addSettlement(_rect, isLeft, s.List, settlementTiles);
					break;
				}
				num = --num;
			}
		}

		this.logInfo("Created " + settlementTiles.len() + " settlements.");
		return settlementTiles.len() >= 19
	}	
})