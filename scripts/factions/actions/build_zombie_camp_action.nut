this.build_zombie_camp_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "build_zombie_camp_action";
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

		if (_faction.getSettlements().len() == 0)
		{
			r = 1;
		}

		if (r == 1)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 5, 11);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 5, 11);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_graveyard_location", tile.Coords);
			}
		}
		else if (r == 2)
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
		else if (r == 3)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 6, 14);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 7, 20);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_hideout_location", tile.Coords);
			}
		}
		else if (r == 4)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 18);
			}
			else
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 10, 20);
			}

			if (tile != null)
			{
				camp = this.World.spawnLocation("scripts/entity/world/locations/undead_necromancers_lair_location", tile.Coords);
			}
		}
		else if (r == 5)
		{
			local tile;

			if (this.World.FactionManager.isUndeadScourge())
			{
				tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
					this.Const.World.TerrainType.Mountains
				], 8, 18);
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

		if (camp != null)
		{
			local banner = this.getAppropriateBanner(camp, _faction.getSettlements(), 15, this.Const.ZombieBanners);
			camp.onSpawned();
			camp.setBanner(banner);
			_faction.addSettlement(camp, false);
		}
	}

});

