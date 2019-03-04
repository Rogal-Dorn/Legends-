this.build_undead_camp_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "build_undead_camp_action";
		this.m.IsRunOnNewCampaign = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		local settlements = _faction.getSettlements();

		if (this.World.FactionManager.isUndeadScourge() && this.World.FactionManager.getGreaterEvilStrength() >= 20.0)
		{
			if (settlements.len() > 19)
			{
				return;
			}
		}
		else if (settlements.len() > 11)
		{
			return;
		}

		this.m.Score = 2;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local camp;
		local r = this.Math.rand(1, 5);

		if (r == 1)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 16);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 16);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_crypt_location", tile.Coords);
			}
		}
		else if (r == 2)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 12, 30);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 12, 1000);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_mass_grave_location", tile.Coords);
			}
		}
		else if (r == 3)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 20);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 10, 30);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_ruins_location", tile.Coords);
			}
		}
		else if (r == 4)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 15, 25);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 15, 25);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_vampire_coven_location", tile.Coords);
			}
		}
		else if (r == 5)
		{
			local disallowTerrain = [];

			for( local i = 0; i != this.Const.World.TerrainType.COUNT; i = ++i )
			{
				if (i != this.Const.World.TerrainType.Snow && i != this.Const.World.TerrainType.Highlands)
				{
					disallowTerrain.push(i);
				}
			}

			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 18, 30);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, disallowTerrain, 20, 1000);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_buried_castle_location", tile.Coords);
			}
		}

		if (camp != null)
		{
			local banner = this.getAppropriateBanner(camp, _faction.getSettlements(), 15, this.Const.UndeadBanners);
			camp.onSpawned();
			camp.setBanner(banner);
			_faction.addSettlement(camp, false);
		}
	}

});

