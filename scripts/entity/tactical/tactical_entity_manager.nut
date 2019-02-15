this.tactical_entity_manager <- {
	m = {
		Instances = [],
		InstancesMax = [],
		Corpses = [],
		TileEffects = [],
		Strategies = [],
		OnCombatFinishedListener = null,
		LastIdleSound = 0.0,
		IsDirty = false,
		IsCombatFinished = false,
		IsEnemyRetreating = false,
		IsLineVSLine = false,
		CombatResult = this.Const.Tactical.CombatResult.None,
		LastCombatResult = this.Const.Tactical.CombatResult.None,
		IsDLCCompatible = true
	},
	function getInstancesOfFaction( _f )
	{
		return this.m.Instances[_f];
	}

	function getAllInstances()
	{
		return this.m.Instances;
	}

	function getAllInstancesMax()
	{
		return this.m.InstancesMax;
	}

	function getInstancesNum( _f )
	{
		return this.m.Instances[_f].len();
	}

	function getInstancesMax( _f )
	{
		return this.m.InstancesMax[_f];
	}

	function getCorpses()
	{
		return this.m.Corpses;
	}

	function getStrategy( _f )
	{
		return this.m.Strategies[_f];
	}

	function isCombatFinished()
	{
		return this.m.IsCombatFinished;
	}

	function isEnemyRetreating()
	{
		return this.m.IsEnemyRetreating;
	}

	function isLineVSLine()
	{
		return this.m.IsLineVSLine;
	}

	function getCombatResult()
	{
		return this.m.CombatResult;
	}

	function setLastCombatResult( _r )
	{
		this.m.LastCombatResult = _r;
	}

	function checkCombatFinished( _forceFinish = false )
	{
		if (this.m.IsCombatFinished)
		{
			return;
		}

		this.m.IsCombatFinished = _forceFinish || this.getHostilesNum() == 0 || this.getInstancesOfFaction(this.Const.Faction.Player).len() == 0;

		if (this.m.IsCombatFinished)
		{
			this.m.CombatResult = this.m.LastCombatResult;
		}
	}

	function setOnCombatFinishedListener( _l )
	{
		this.m.OnCombatFinishedListener = _l;
	}

	function checkEnemyRetreating()
	{
		if (this.m.IsEnemyRetreating || this.m.IsCombatFinished)
		{
			return;
		}

		if (this.Tactical.State.isScenarioMode())
		{
			for( local i = this.Const.Faction.Player + 1; i != this.Const.Faction.COUNT; i = ++i )
			{
				if (this.Const.FactionAlliance[i].find(this.Const.Faction.Player) == null)
				{
					foreach( e in this.m.Instances[i] )
					{
						if (!(e.isNonCombatant() || e.getAIAgent().getOrders().IsRetreating || e.getMoraleState() == this.Const.MoraleState.Fleeing || e.getXPValue() == 0))
						{
							return;
						}
					}
				}
			}
		}
		else
		{
			for( local i = 0; i != this.World.FactionManager.getFactions().len(); i = ++i )
			{
				if (!this.World.FactionManager.isAlliedWithPlayer(i))
				{
					foreach( e in this.m.Instances[i] )
					{
						if (!(e.isNonCombatant() || e.getAIAgent().getOrders().IsRetreating || e.getMoraleState() == this.Const.MoraleState.Fleeing || e.getXPValue() == 0))
						{
							return;
						}
					}
				}
			}
		}

		this.m.IsEnemyRetreating = true;
	}

	function addInstance( _actor )
	{
		local faction = _actor.getFaction();

		foreach( i in this.m.Instances[faction] )
		{
			if (i.getID() == _actor.getID())
			{
				return;
			}
		}

		this.m.Instances[faction].push(_actor);

		if (_actor.getXPValue() > 0)
		{
			++this.m.InstancesMax[faction];
		}

		this.m.IsDirty = true;
	}

	function removeInstance( _actor, _removeMax = false )
	{
		local faction = _actor.getFaction();
		local i = this.m.Instances[faction].find(_actor);

		if (i != null)
		{
			this.m.Instances[faction].remove(i);

			if (_removeMax && _actor.getXPValue() > 0)
			{
				--this.m.InstancesMax[faction];
			}

			this.m.IsDirty = true;
		}
	}

	function getAllInstancesAsArray()
	{
		local ret = [];

		for( local i = 0; i != this.m.Instances.len(); i = ++i )
		{
			for( local j = 0; j != this.m.Instances[i].len(); j = ++j )
			{
				ret.push(this.m.Instances[i][j]);
			}
		}

		return ret;
	}

	function getNonPlayerInstancesNum()
	{
		local n = 0;

		for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
		{
			n = n + this.m.Instances[i].len();
		}

		return n;
	}

	function getAlliesNum()
	{
		local n = 0;

		if (this.Tactical.State.isScenarioMode())
		{
			for( local i = this.Const.Faction.Player; i != this.Const.Faction.COUNT; i = ++i )
			{
				if (i == this.Const.Faction.Player || this.Const.FactionAlliance[i].find(this.Const.Faction.Player) != null)
				{
					n = n + this.m.Instances[i].len();
				}
			}
		}
		else
		{
			for( local i = this.Const.Faction.Player; i != this.m.Instances.len(); i = ++i )
			{
				if (i == this.Const.Faction.Player || this.World.FactionManager.isAlliedWithPlayer(i))
				{
					n = n + this.m.Instances[i].len();
				}
			}
		}

		return n;
	}

	function getHostilesNum()
	{
		local n = 0;

		if (this.Tactical.State.isScenarioMode())
		{
			for( local i = this.Const.Faction.Player + 1; i != this.Const.Faction.COUNT; i = ++i )
			{
				if (this.Const.FactionAlliance[i].find(this.Const.Faction.Player) == null)
				{
					n = n + this.m.Instances[i].len();
				}
			}
		}
		else
		{
			for( local i = 0; i != this.World.FactionManager.getFactions().len(); i = ++i )
			{
				if (!this.World.FactionManager.isAlliedWithPlayer(i))
				{
					n = n + this.m.Instances[i].len();
				}
			}
		}

		return n;
	}

	function getHostileFactionWithMostInstances()
	{
		local mostNum = 0;
		local mostFaction = 0;

		if (this.Tactical.State.isScenarioMode())
		{
			for( local i = this.Const.Faction.Bandits; i != this.m.Instances.len(); i = ++i )
			{
				if (this.m.Instances[i].len() > mostNum)
				{
					mostNum = this.m.Instances[i].len();
					mostFaction = i;
				}
			}
		}
		else
		{
			for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
			{
				if (this.World.FactionManager.isAlliedWithPlayer(i))
				{
				}
				else if (this.m.Instances[i].len() > mostNum)
				{
					mostNum = this.m.Instances[i].len();
					mostFaction = i;
				}
			}
		}

		return mostFaction;
	}

	function addCorpse( _tile )
	{
		this.m.Corpses.push(_tile);
	}

	function removeCorpse( _tile )
	{
		local len = this.m.Corpses.len();

		for( local i = 0; i != len; i = ++i )
		{
			if (_tile.isSameTileAs(this.m.Corpses[i]))
			{
				this.m.Corpses.remove(i);
				break;
			}
		}
	}

	function create()
	{
		local maxFactions = this.Tactical.State.isScenarioMode() ? 32 : this.World.FactionManager.getFactions().len();

		for( local i = 0; i != maxFactions; i = ++i )
		{
			this.m.Instances.push([]);
			this.m.InstancesMax.push(0.0);
			local s = this.new("scripts/ai/tactical/strategy");
			s.setFaction(i);
			this.m.Strategies.push(s);
		}
	}

	function clear()
	{
		for( local i = 0; i != this.m.Instances.len(); i = ++i )
		{
			this.m.Instances[i] = [];
			this.m.InstancesMax[i] = 0.0;
		}

		this.m.Corpses = [];
		this.m.IsDirty = true;
	}

	function update()
	{
		this.checkCombatFinished();

		if (this.isCombatFinished())
		{
			return;
		}

		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().isPlayerControlled())
		{
			local instances = [];

			for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
			{
				for( local j = 0; j != this.m.Instances[i].len(); j = ++j )
				{
					instances.push(this.m.Instances[i][j]);
				}
			}

			if (instances.len() != 0 && this.m.LastIdleSound + this.Math.maxf(this.Const.Sound.IdleSoundMinDelay, this.Const.Sound.IdleSoundBaseDelay - this.Const.Sound.IdleSoundReducedDelay * instances.len()) < this.Time.getVirtualTimeF())
			{
				this.m.LastIdleSound = this.Time.getVirtualTimeF();
				instances[this.Math.rand(0, instances.len() - 1)].playIdleSound();
			}
		}

		if (this.m.IsDirty)
		{
			this.m.IsDirty = false;
			this.Tactical.TopbarRoundInformation.update();
		}
	}

	function addTileEffect( _tile, _effect, _particles )
	{
		this.m.TileEffects.push({
			Tile = _tile,
			Effect = _effect,
			Particles = _particles
		});
	}

	function updateTileEffects()
	{
		local garbage = [];

		foreach( i, tile in this.m.TileEffects )
		{
			if (tile.Effect.Timeout <= this.Time.getRound())
			{
				garbage.push(i);
			}
		}

		garbage.reverse();

		foreach( trash in garbage )
		{
			this.m.TileEffects[trash].Tile.Properties.Effect = null;
			this.m.TileEffects[trash].Tile.clear(this.Const.Tactical.DetailFlag.Effect);

			foreach( p in this.m.TileEffects[trash].Particles )
			{
				p.die();
			}

			this.m.TileEffects.remove(trash);
		}

		if (this.Time.getRound() == 1 || this.Tactical.State.isScenarioMode() && this.Time.getRound() == 2)
		{
			local spiders = 0;
			local entities = this.Tactical.TurnSequenceBar.getAllEntities();

			foreach( e in entities )
			{
				if (e.getType() == this.Const.EntityType.Spider && !this.isKindOf(e, "spider_bodyguard"))
				{
					spiders = ++spiders;
				}
			}

			local mapSize = this.Tactical.getMapSize();

			if (spiders > 5)
			{
				for( local x = 0; x < mapSize.X; x = ++x )
				{
					for( local y = 0; y < mapSize.Y; y = ++y )
					{
						local tile = this.Tactical.getTileSquare(x, y);

						if (tile.IsEmpty || this.Math.rand(1, 100) > 30)
						{
						}
						else if (tile.getEntity().hasSprite("web"))
						{
							tile.getEntity().getSprite("web").Visible = true;
						}
					}
				}

				local eggs = spiders / 5;

				for( local attempts = 0; attempts < 750; attempts = ++attempts )
				{
					local x = this.Math.rand(5, mapSize.X - 8);
					local y = this.Math.rand(7, mapSize.Y - 7);
					local tile = this.Tactical.getTileSquare(x, y);

					if (!tile.IsEmpty)
					{
					}
					else if (tile.IsVisibleForPlayer)
					{
					}
					else if (tile.IsHidingEntity)
					{
					}
					else if (this.isTileIsolated(tile))
					{
					}
					else
					{
						local nest = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/spider_eggs", tile.Coords);
						nest.setFaction(this.Tactical.State.isScenarioMode() ? this.Const.Faction.Beasts : this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).getID());
						eggs = --eggs;

						if (eggs <= 0)
						{
							break;
						}
					}
				}
			}
		}
	}

	function makeEnemiesKnownToAI( _ignorePlayer = false )
	{
		for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
		{
			for( local j = 0; j != this.m.Instances[i].len(); j = ++j )
			{
				if (this.m.Instances[i][j].getAIAgent() == null)
				{
				}
				else
				{
					for( local k = 0; k != this.m.Instances.len(); k = ++k )
					{
						if (_ignorePlayer && k == this.Const.Faction.Player)
						{
						}
						else if (this.m.Instances[i][j].isAlliedWith(k))
						{
						}
						else
						{
							for( local p = 0; p != this.m.Instances[k].len(); p = ++p )
							{
								this.m.Instances[i][j].getAIAgent().onOpponentSighted(this.m.Instances[k][p]);
							}
						}
					}
				}
			}
		}
	}

	function makeAllHostilesRetreat()
	{
		if (this.Tactical.State.isScenarioMode())
		{
			for( local i = this.Const.Faction.Bandits; i != this.m.Instances.len(); i = ++i )
			{
				foreach( e in this.m.Instances[i] )
				{
					e.retreat();
				}
			}
		}
		else
		{
			for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
			{
				if (this.m.Instances[i].len() == 0 || this.World.FactionManager.isAlliedWithPlayer(i))
				{
				}
				else
				{
					local instances = clone this.m.Instances[i];

					foreach( e in instances )
					{
						e.retreat();
					}
				}
			}
		}
	}

	function assignBases()
	{
		if (!("FactionManager" in this.World) || this.World.FactionManager == null)
		{
			return;
		}

		for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
		{
			if (this.World.FactionManager.getFaction(i) == null)
			{
			}
			else
			{
				local b = this.World.FactionManager.getFaction(i).getTacticalBase();

				if (b == "")
				{
				}
				else
				{
					foreach( p in this.m.Instances[i] )
					{
						if (p.hasSprite("socket"))
						{
							p.getSprite("socket").setBrush(b);
						}
					}
				}
			}
		}
	}

	function makeAIKnownToPlayer()
	{
		for( local i = this.Const.Faction.Player + 1; i != this.m.Instances.len(); i = ++i )
		{
			for( local j = 0; j != this.m.Instances[i].len(); j = ++j )
			{
				this.m.Instances[i][j].setDiscovered(true);
			}
		}
	}

	function onResurrect( _info )
	{
		if (this.Tactical.State.m.TacticalDialogScreen.isVisible() || this.Tactical.State.m.TacticalDialogScreen.isAnimating())
		{
			this.Time.scheduleEvent(this.TimeUnit.Rounds, 1, this.Tactical.Entities.resurrect, _info);
			return null;
		}

		if (this.Tactical.Entities.isCombatFinished() || this.Tactical.Entities.isEnemyRetreating())
		{
			return null;
		}

		local targetTile = _info.Tile;
		this.logInfo("attempting to resurrect: " + _info.Type);

		if (!targetTile.IsEmpty)
		{
			local knockToTile;

			for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
			{
				if (!targetTile.hasNextTile(i))
				{
				}
				else
				{
					local newTile = targetTile.getNextTile(i);

					if (!newTile.IsEmpty || newTile.IsCorpseSpawned)
					{
					}
					else if (newTile.Level > targetTile.Level + 1)
					{
					}
					else
					{
						knockToTile = newTile;
						break;
					}
				}
			}

			if (knockToTile == null)
			{
				this.Time.scheduleEvent(this.TimeUnit.Rounds, 1, this.Tactical.Entities.resurrect, _info);
				return null;
			}

			this.Tactical.getNavigator().teleport(targetTile.getEntity(), knockToTile, null, null, true);

			if (_info.Tile.IsVisibleForPlayer)
			{
				this.Tactical.CameraDirector.pushMoveToTileEvent(0, _info.Tile, -1, this.onResurrect.bindenv(this), _info, 200, this.Const.Tactical.Settings.CameraNextEventDelay);
				this.Tactical.CameraDirector.addDelay(0.200000003);
			}
			else if (knockToTile.IsVisibleForPlayer)
			{
				this.Tactical.CameraDirector.pushMoveToTileEvent(0, knockToTile, -1, this.onResurrect.bindenv(this), _info, 200, this.Const.Tactical.Settings.CameraNextEventDelay);
				this.Tactical.CameraDirector.addDelay(0.200000003);
			}
			else
			{
				this.Tactical.CameraDirector.pushIdleEvent(0, this.onResurrect.bindenv(this), _info, 200, this.Const.Tactical.Settings.CameraNextEventDelay);
				this.Tactical.CameraDirector.addDelay(0.200000003);
			}

			return null;
		}

		this.Tactical.Entities.removeCorpse(targetTile);
		targetTile.clear(this.Const.Tactical.DetailFlag.Corpse);
		targetTile.Properties.remove("Corpse");
		targetTile.Properties.remove("IsSpawningFlies");
		this.Const.Movement.AnnounceDiscoveredEntities = false;
		local entity = this.Tactical.spawnEntity(_info.Type, targetTile.Coords.X, targetTile.Coords.Y);
		this.Const.Movement.AnnounceDiscoveredEntities = true;
		entity.onResurrected(_info);
		entity.riseFromGround();

		if (!entity.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(entity) + " has risen from the dead");
		}

		return entity;
	}

	function resurrect( _info, _delay = 0 )
	{
		if (_info.Tile.IsVisibleForPlayer)
		{
			this.Tactical.CameraDirector.addMoveToTileEvent(_delay, _info.Tile, -1, this.onResurrect.bindenv(this), _info, this.Const.Tactical.Settings.CameraWaitForEventDelay, this.Const.Tactical.Settings.CameraNextEventDelay);
			this.Tactical.CameraDirector.addDelay(1.5);
		}
		else
		{
			this.onResurrect(_info);
		}
	}

	function setupAmbience( _worldTile )
	{
		local weather = this.Tactical.getWeather();
		local hostileFaction = this.getHostileFactionWithMostInstances();
		local time = this.World.getTime().TimeOfDay;
		weather.setAmbientLightingColor(this.createColor(this.Const.Tactical.AmbientLightingColor.Time[time]));
		weather.setAmbientLightingSaturation(this.Const.Tactical.AmbientLightingSaturation.Time[time]);

		if (time != this.Const.World.TimeOfDay.Morning && time != this.Const.World.TimeOfDay.Dusk && (time == this.Const.World.TimeOfDay.Dawn || this.Math.rand(1, 100) <= 15 || hostileFaction == this.Const.Faction.Undead && this.Math.rand(1, 100) <= 33 || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.Quarry))
		{
			local clouds = weather.createCloudSettings();
			clouds.Type = this.getconsttable().CloudType.Fog;
			clouds.MinClouds = 20;
			clouds.MaxClouds = 20;
			clouds.MinVelocity = 3.0;
			clouds.MaxVelocity = 9.0;
			clouds.MinAlpha = 0.349999994;
			clouds.MaxAlpha = 0.449999988;
			clouds.MinScale = 2.0;
			clouds.MaxScale = 3.0;
			weather.buildCloudCover(clouds);
		}
		else if (this.Math.rand(1, 100) <= 10 && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.SteppeHills && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.Steppe && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.Snow && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.SnowyForest && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.SnowyHills && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.AutumnForest)
		{
			if (this.World.getTime().IsDaytime)
			{
				weather.setAmbientLightingColor(this.createColor(this.Const.Tactical.AmbientLightingColor.Storm));
				weather.setAmbientLightingSaturation(this.Const.Tactical.AmbientLightingSaturation.Storm);
			}

			local clouds = weather.createCloudSettings();
			clouds.Type = this.getconsttable().CloudType.StaticFog;
			clouds.MinClouds = 12;
			clouds.MaxClouds = 18;
			clouds.MinAlpha = 0.25;
			clouds.MaxAlpha = 0.5;
			clouds.MinScale = 2.0;
			clouds.MaxScale = 3.0;
			weather.buildCloudCover(clouds);
			local rain = weather.createRainSettings();
			rain.MinDrops = 150;
			rain.MaxDrops = 150;
			rain.NumSplats = 50;
			rain.MinVelocity = 400.0;
			rain.MaxVelocity = 500.0;
			rain.MinAlpha = 1.0;
			rain.MaxAlpha = 1.0;
			rain.MinScale = 0.75;
			rain.MaxScale = 1.0;
			weather.buildRain(rain);
			this.Sound.setAmbience(0, this.Const.SoundAmbience.Rain, this.Const.Sound.Volume.Ambience, 0);
		}
		else if (this.Math.rand(1, 100) <= 10 && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.Snow && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.SnowyForest && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.SnowyHills && _worldTile.TacticalType != this.Const.World.TerrainTacticalType.AutumnForest)
		{
			if (this.World.getTime().IsDaytime && time != this.Const.World.TimeOfDay.Dusk && time != this.Const.World.TimeOfDay.Dawn && time != this.Const.World.TimeOfDay.Morning)
			{
				weather.setAmbientLightingColor(this.createColor(this.Const.Tactical.AmbientLightingColor.LightRain));
				weather.setAmbientLightingSaturation(this.Const.Tactical.AmbientLightingSaturation.LightRain);
			}

			local rain = weather.createRainSettings();
			rain.MinDrops = 40;
			rain.MaxDrops = 40;
			rain.NumSplats = 20;
			rain.MinVelocity = 300.0;
			rain.MaxVelocity = 400.0;
			rain.MinAlpha = 0.400000006;
			rain.MaxAlpha = 0.600000024;
			rain.SplatAlpha = 0.5;
			rain.MinScale = 0.75;
			rain.MaxScale = 1.0;
			weather.buildRain(rain);
			this.Sound.setAmbience(0, this.Const.SoundAmbience.RainLight, this.Const.Sound.Volume.Ambience, 0);
		}
		else if (this.Math.rand(1, 100) <= 25 && (_worldTile.TacticalType == this.Const.World.TerrainTacticalType.Snow || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.SnowyForest || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.SnowyHills))
		{
			local rain = weather.createRainSettings();
			rain.MinDrops = 200;
			rain.MaxDrops = 200;
			rain.NumSplats = 0;
			rain.MinVelocity = 100.0;
			rain.MaxVelocity = 200.0;
			rain.MinAlpha = 0.5;
			rain.MaxAlpha = 0.899999976;
			rain.MinScale = 0.25;
			rain.MaxScale = 0.400000006;
			rain.clearDropBrushes();
			rain.addDropBrush("ice_crystal");
			weather.buildRain(rain);
		}
		else if (this.Math.rand(1, 100) <= 15 && (_worldTile.TacticalType == this.Const.World.TerrainTacticalType.Highlands || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.HighlandsHills))
		{
			local rain = weather.createRainSettings();
			rain.MinDrops = 200;
			rain.MaxDrops = 200;
			rain.NumSplats = 0;
			rain.MinVelocity = 100.0;
			rain.MaxVelocity = 200.0;
			rain.MinAlpha = 0.5;
			rain.MaxAlpha = 0.899999976;
			rain.MinScale = 0.150000006;
			rain.MaxScale = 0.300000012;
			rain.clearDropBrushes();
			rain.addDropBrush("ice_crystal");
			weather.buildRain(rain);
		}
		else if (this.Math.rand(1, 100) <= 25 && (_worldTile.TacticalType == this.Const.World.TerrainTacticalType.Snow || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.SnowyForest || _worldTile.TacticalType == this.Const.World.TerrainTacticalType.SnowyHills))
		{
			local rain = weather.createRainSettings();
			rain.MinDrops = 300;
			rain.MaxDrops = 300;
			rain.NumSplats = 0;
			rain.MinVelocity = 900.0;
			rain.MaxVelocity = 1200.0;
			rain.MinAlpha = 0.5;
			rain.MaxAlpha = 1.0;
			rain.MinScale = 0.5;
			rain.MaxScale = 1.0;
			rain.clearDropBrushes();
			rain.addDropBrush("rain_03");
			rain.Direction = this.createVec(-0.449999988, -0.550000012);
			weather.buildRain(rain);
			local clouds = weather.createCloudSettings();
			clouds.Type = this.getconsttable().CloudType.Custom;
			clouds.MinClouds = 150;
			clouds.MaxClouds = 150;
			clouds.MinVelocity = 400.0;
			clouds.MaxVelocity = 500.0;
			clouds.MinAlpha = 0.600000024;
			clouds.MaxAlpha = 1.0;
			clouds.MinScale = 1.0;
			clouds.MaxScale = 4.0;
			clouds.Sprite = "wind_01";
			clouds.RandomizeDirection = false;
			clouds.RandomizeRotation = false;
			clouds.Direction = this.createVec(-1.0, -0.699999988);
			weather.buildCloudCover(clouds);
			this.Sound.setAmbience(0, this.Const.SoundAmbience.Blizzard, this.Const.Sound.Volume.Ambience, 0);
		}
		else if (this.Math.rand(1, 100) <= 60)
		{
			local clouds = weather.createCloudSettings();
			clouds.MinClouds = 5;
			clouds.MaxClouds = 5;
			clouds.MinVelocity = 30.0;
			clouds.MaxVelocity = 50.0;
			clouds.MinAlpha = 0.349999994;
			clouds.MaxAlpha = 0.5;
			clouds.MinScale = 1.5;
			clouds.MaxScale = 3.0;
			weather.buildCloudCover(clouds);
		}

		if (_worldTile.Type == this.Const.World.TerrainType.AutumnForest)
		{
			local rain = weather.createRainSettings();
			rain.MinDrops = 20;
			rain.MaxDrops = 20;
			rain.DropLifetime = 7000;
			rain.NumSplats = 0;
			rain.MinVelocity = 50.0;
			rain.MaxVelocity = 100.0;
			rain.MinAlpha = 1.0;
			rain.MaxAlpha = 1.0;
			rain.MinScale = 0.300000012;
			rain.MaxScale = 0.5;
			rain.ScaleDropsWithTime = true;
			rain.clearDropBrushes();
			rain.addDropBrush("leaf_01");
			rain.addDropBrush("leaf_02");
			rain.addDropBrush("leaf_03");
			rain.addDropBrush("leaf_04");
			weather.buildRain(rain);
		}
	}

	function spawn( _properties )
	{
		if (!this.Tactical.State.isScenarioMode() && this.World.State.getCombatSeed() != 0)
		{
			this.Math.seedRandom(this.World.State.getCombatSeed());
		}

		this.Time.setRound(0);
		this.World.Assets.updateFormation();
		local isPlayerInFormation = false;
		local all_players = this.World.getPlayerRoster().getAll();
		local players = [];

		foreach( e in _properties.TemporaryEnemies )
		{
			if (e > 2)
			{
				this.World.FactionManager.getFaction(e).setIsTemporaryEnemy(true);
			}
		}

		local num = 0;

		foreach( p in all_players )
		{
			if (p.getPlaceInFormation() > 26)
			{
				continue;
			}

			players.push(p);
			local items = p.getItems().getAllItemsAtSlot(this.Const.ItemSlot.Bag);

			foreach( item in items )
			{
				if ("setLoaded" in item)
				{
					item.setLoaded(false);
				}
			}

			num = ++num;

			if (num >= 27)
			{
				break;
			}
		}

		if (this.World.State.isUsingGuests() && this.World.getGuestRoster().getSize() != 0)
		{
			players.extend(this.World.getGuestRoster().getAll());
		}

		if (_properties.BeforeDeploymentCallback != null)
		{
			_properties.BeforeDeploymentCallback();
		}

		if (_properties.PlayerDeploymentType == this.Const.Tactical.DeploymentType.Auto)
		{
			if (!this.Tactical.State.isScenarioMode() && this.World.State.getEscortedEntity() != null && !this.World.State.getEscortedEntity().isNull())
			{
				_properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
			}
			else if ((this.Const.World.TerrainTypeLineBattle[_properties.Tile.Type] || _properties.IsAttackingLocation || _properties.IsPlayerInitiated) && !_properties.InCombatAlready)
			{
				_properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
			}
			else if (!_properties.InCombatAlready)
			{
				_properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Center;
			}
			else
			{
				_properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Edge;
			}
		}

		if (_properties.EnemyDeploymentType == this.Const.Tactical.DeploymentType.Auto)
		{
			if (!this.Tactical.State.isScenarioMode() && this.World.State.getEscortedEntity() != null && !this.World.State.getEscortedEntity().isNull())
			{
				_properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
			}
			else if (this.Const.World.TerrainTypeLineBattle[_properties.Tile.Type] || _properties.IsAttackingLocation || _properties.IsPlayerInitiated)
			{
				_properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
			}
			else
			{
				_properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Circle;
			}
		}

		switch(_properties.PlayerDeploymentType)
		{
		case this.Const.Tactical.DeploymentType.Line:
			this.placePlayersInFormation(players);
			isPlayerInFormation = true;
			break;

		case this.Const.Tactical.DeploymentType.Center:
			this.placePlayersAtCenter(players);
			break;

		case this.Const.Tactical.DeploymentType.Edge:
			this.placePlayersAtBorder(players);
			break;

		case this.Const.Tactical.DeploymentType.Random:
		case this.Const.Tactical.DeploymentType.Circle:
			this.placePlayersInCircle(players);
			break;

		case this.Const.Tactical.DeploymentType.Custom:
			if (_properties.PlayerDeploymentCallback != null)
			{
				_properties.PlayerDeploymentCallback();
			}

			break;
		}

		switch(_properties.EnemyDeploymentType)
		{
		case this.Const.Tactical.DeploymentType.Line:
			this.spawnEntitiesInFormation(_properties.Entities, isPlayerInFormation);
			break;

		case this.Const.Tactical.DeploymentType.Center:
			this.spawnEntitiesAtCenter(_properties.Entities);
			break;

		case this.Const.Tactical.DeploymentType.Random:
			this.spawnEntitiesRandomly(_properties.Entities);
			break;

		case this.Const.Tactical.DeploymentType.Circle:
			this.spawnEntitiesInCircle(_properties.Entities);
			break;

		case this.Const.Tactical.DeploymentType.Custom:
			if (_properties.EnemyDeploymentCallback != null)
			{
				_properties.EnemyDeploymentCallback();
			}

			break;
		}

		this.m.IsLineVSLine = _properties.PlayerDeploymentType == this.Const.Tactical.DeploymentType.Line && _properties.EnemyDeploymentType == this.Const.Tactical.DeploymentType.Line;

		if (!this.Tactical.State.isScenarioMode() && !_properties.IsPlayerInitiated && !_properties.InCombatAlready)
		{
			foreach( i, s in this.m.Strategies )
			{
				if (!this.World.FactionManager.isAllied(this.Const.Faction.Player, i))
				{
					s.setIsAttackingOnWorldmap(true);
				}
			}
		}

		if (_properties.AfterDeploymentCallback != null)
		{
			_properties.AfterDeploymentCallback();
		}

		if (_properties.IsAutoAssigningBases)
		{
			this.assignBases();
		}

		this.makeEnemiesKnownToAI(_properties.InCombatAlready);

		foreach( player in this.m.Instances[this.Const.Faction.Player] )
		{
			player.onCombatStart();
		}

		this.Math.seedRandom(this.Time.getRealTime());
	}

	function isTileIsolated( _tile )
	{
		local isCompletelyIsolated = true;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_tile.hasNextTile(i))
			{
			}
			else if (_tile.getNextTile(i).IsEmpty && this.Math.abs(_tile.Level - _tile.getNextTile(i).Level) <= 1)
			{
				isCompletelyIsolated = false;
				break;
			}
		}

		if (isCompletelyIsolated)
		{
			return true;
		}

		local allFactions = [];
		allFactions.resize(32, 0);

		for( local i = 0; i != 32; i = ++i )
		{
			allFactions[i] = i;
		}

		local navigator = this.Tactical.getNavigator();
		local settings = navigator.createSettings();
		settings.ActionPointCosts = this.Const.SameMovementAPCost;
		settings.FatigueCosts = this.Const.PathfinderMovementFatigueCost;
		settings.AllowZoneOfControlPassing = true;
		settings.AlliedFactions = allFactions;

		if (!navigator.findPath(_tile, this.Tactical.getTileSquare(0, 0), settings, 1) && !navigator.findPath(_tile, this.Tactical.getTileSquare(31, 31), settings, 1) && !navigator.findPath(_tile, this.Tactical.getTileSquare(0, 31), settings, 1) && !navigator.findPath(_tile, this.Tactical.getTileSquare(31, 0), settings, 1))
		{
			return true;
		}

		return false;
	}

	function spawnEntitiesRandomly( _entities )
	{
		foreach( e in _entities )
		{
			local x = 0;
			local y = 0;

			while (1)
			{
				x = this.Math.rand(3, 29);
				y = this.Math.rand(3, 29);

				if (!this.Tactical.isValidTileSquare(x, y) || !this.Tactical.getTileSquare(x, y).IsEmpty)
				{
					continue;
				}

				if (x >= 6 && x <= 28 && y <= 7)
				{
					continue;
				}

				if (this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
				{
					continue;
				}

				break;
			}

			local tile = this.Tactical.getTileSquare(x, y);
			local entity = this.Tactical.spawnEntity(e.Script, tile.Coords.X, tile.Coords.Y);
			entity.setWorldTroop(e);
			entity.setFaction(e.Faction);

			if (("Callback" in e) && e.Callback != null)
			{
				e.Callback(entity, "Tag" in e ? e.Tag : null);
			}

			entity.assignRandomEquipment();

			if (!this.World.getTime().IsDaytime && entity.getBaseProperties().IsAffectedByNight)
			{
				entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function spawnEntitiesInCircle( _entities )
	{
		foreach( e in _entities )
		{
			local x = 0;
			local y = 0;
			local tries = 0;

			if (!this.World.FactionManager.isAlliedWithPlayer(e.Faction))
			{
				while (1)
				{
					x = this.Math.rand(8, 24);
					y = this.Math.rand(8, 24);

					if (x > 9 && x < 23 && y > 9 && y < 23)
					{
						continue;
					}

					if (this.Tactical.isValidTileSquare(x, y) && this.Tactical.getTileSquare(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
					{
						break;
					}

					tries = ++tries;

					if (tries >= 500)
					{
						break;
					}
				}
			}
			else
			{
				while (1)
				{
					x = this.Math.rand(12, 20);
					y = this.Math.rand(12, 20);

					if (this.Tactical.isValidTileSquare(x, y) && this.Tactical.getTileSquare(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
					{
						break;
					}

					tries = ++tries;

					if (tries >= 500)
					{
						break;
					}
				}
			}

			if (tries >= 500)
			{
				continue;
			}

			local tile = this.Tactical.getTileSquare(x, y);
			local entity = this.Tactical.spawnEntity(e.Script, tile.Coords.X, tile.Coords.Y);
			entity.setWorldTroop(e);
			entity.setFaction(e.Faction);

			if (("Callback" in e) && e.Callback != null)
			{
				e.Callback(entity, "Tag" in e ? e.Tag : null);
			}

			entity.assignRandomEquipment();

			if (!this.World.getTime().IsDaytime && entity.getBaseProperties().IsAffectedByNight)
			{
				entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function spawnEntitiesInFormation( _entities, _isPlayerInFormation )
	{
		_entities.sort(this.onFactionCompare);
		local max_per_row = 5;
		local last_faction = 0;
		local dir = 0;
		local backup_dir = 0;
		local dir_row_offset = [];
		dir_row_offset.resize(4);
		local flanks = [
			false,
			false,
			false,
			false
		];
		flanks.resize(4, false);

		for( local i = 0; i < dir_row_offset.len(); i = ++i )
		{
			dir_row_offset[i] = [];
			dir_row_offset[i].resize(10, 0);
		}

		local num_for_faction = 0;
		local alliedWithPlayer = 0;
		local placed = 0;

		foreach( i, e in _entities )
		{
			placed = ++placed;

			if (e.Faction != last_faction || num_for_faction >= 30)
			{
				last_faction = e.Faction;
				num_for_faction = 0;
				dir = backup_dir;

				if (_isPlayerInFormation && this.World.FactionManager.isAlliedWithPlayer(e.Faction))
				{
					dir = 0;
				}
				else if (_isPlayerInFormation || placed > 1)
				{
					if (dir < dir_row_offset.len() - 1)
					{
						dir = ++dir;
						backup_dir = dir;
					}
					else
					{
						break;
					}
				}
			}
			else
			{
				num_for_faction = ++num_for_faction;

				for( ; num_for_faction >= 48;  )
				{
				}
			}

			if (dir == 0 && this.World.FactionManager.isAlliedWithPlayer(e.Faction))
			{
				alliedWithPlayer = ++alliedWithPlayer;

				for( ; alliedWithPlayer >= 30;  )
				{
				}
			}

			local x = 0;
			local y = 0;
			local row_offset = dir_row_offset[dir];
			local current_row = e.Row;
			local tile;

			if (current_row == -1)
			{
				current_row = this.Math.rand(1, 3);
			}

			while (1)
			{
				if (current_row == -2)
				{
					while (1)
					{
						x = this.Math.rand(4, 24);
						y = this.Math.rand(4, 26);

						if (x >= 8 && x <= 19 && y >= 9 && y <= 23)
						{
							continue;
						}

						if (this.Tactical.isValidTileSquare(x, y) && this.Tactical.getTileSquare(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
						{
							break;
						}
					}
				}
				else
				{
					if (dir == 0)
					{
						x = 13 - current_row;
						y = 15 + row_offset[current_row];
					}
					else if (dir == 1)
					{
						x = 19 + current_row;
						y = 15 + row_offset[current_row];
					}
					else if (dir == 2)
					{
						x = 15 + row_offset[current_row];
						y = 25 + current_row;
					}
					else if (dir == 3)
					{
						x = 15 + row_offset[current_row];
						y = 6 - current_row;
					}
					else
					{
						this.logInfo("Too many participants, arg!");
					}

					if (!this.Tactical.isValidTileSquare(x, y) || !this.Tactical.getTileSquare(x, y).IsEmpty || this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
					{
						if (current_row < row_offset.len() - 1 && (current_row == 1 && row_offset[current_row] == 0 && flanks[dir] || (current_row != 1 || !flanks[dir]) && row_offset[current_row] > max_per_row))
						{
							current_row = ++current_row;
						}
						else if (current_row == 1 && flanks[dir])
						{
							if (row_offset[current_row] <= 0)
							{
								++row_offset[current_row];
							}

							row_offset[current_row] = -row_offset[current_row];
						}
						else
						{
							if (row_offset[current_row] <= 0)
							{
								--row_offset[current_row];
							}

							row_offset[current_row] = -row_offset[current_row];
						}

						continue;
					}
				}

				tile = this.Tactical.getTileSquare(x, y);
				break;
			}

			if (tile != null)
			{
				local entity = this.Tactical.spawnEntity(e.Script, tile.Coords.X, tile.Coords.Y);
				entity.setWorldTroop(e);
				entity.setFaction(e.Faction);

				if (("Callback" in e) && e.Callback != null)
				{
					e.Callback(entity, "Tag" in e ? e.Tag : null);
				}

				entity.assignRandomEquipment();

				if (!this.World.getTime().IsDaytime && entity.getBaseProperties().IsAffectedByNight)
				{
					entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
				}
			}
		}
	}

	function spawnEntitiesAtCenter( _entities )
	{
		foreach( e in _entities )
		{
			local x = 0;
			local y = 0;
			local tries = 0;

			while (1)
			{
				if (tries < 500)
				{
					x = this.Math.rand(14, 18);
					y = this.Math.rand(14, 18);
				}
				else if (tries < 1000)
				{
					x = this.Math.rand(13, 19);
					y = this.Math.rand(13, 19);
				}
				else
				{
					x = this.Math.rand(11, 21);
					y = this.Math.rand(11, 21);
				}

				tries = ++tries;

				if (this.Tactical.isValidTileSquare(x, y) && this.Tactical.getTileSquare(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTileSquare(x, y)))
				{
					break;
				}
			}

			local tile = this.Tactical.getTileSquare(x, y);
			local entity = this.Tactical.spawnEntity(e.Script, tile.Coords.X, tile.Coords.Y);
			entity.setWorldTroop(e);
			entity.setFaction(e.Faction);

			if (("Callback" in e) && e.Callback != null)
			{
				e.Callback(entity, "Tag" in e ? e.Tag : null);
			}

			entity.assignRandomEquipment();

			if (!this.World.getTime().IsDaytime && entity.getBaseProperties().IsAffectedByNight)
			{
				entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function placePlayersAtCenter( _players )
	{
		foreach( player in _players )
		{
			local x = 0;
			local y = 0;
			local tries = 0;

			while (1)
			{
				if (tries > 1000 && !this.clearedArea)
				{
					for( local x = 13; x != 19; x = ++x )
					{
						for( local y = 13; y != 19; y = ++y )
						{
							this.Tactical.getTile(x, y - x / 2).removeObject();
						}
					}

					this.clearedArea = true;
				}

				tries = ++tries;

				if (tries < 100)
				{
					x = this.Math.rand(14, 18);
					y = this.Math.rand(14, 18) - x / 2;
				}
				else if (tries < 1000)
				{
					x = this.Math.rand(13, 19);
					y = this.Math.rand(13, 19) - x / 2;
				}

				if (this.Tactical.getTile(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTile(x, y)))
				{
					break;
				}
			}

			this.Tactical.addEntityToMap(player, x, y);

			if (!this.World.getTime().IsDaytime && player.getBaseProperties().IsAffectedByNight)
			{
				player.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function placePlayersInCircle( _players )
	{
		foreach( player in _players )
		{
			local x = 0;
			local y = 0;
			local tries = 0;

			while (1)
			{
				x = this.Math.rand(2, 29);
				y = this.Math.rand(2, 29);

				if (x > 5 && x < 26 && y > 5 && y < 26)
				{
					continue;
				}

				y = y - x / 2;

				if (this.Tactical.getTile(x, y).IsEmpty && !this.isTileIsolated(this.Tactical.getTile(x, y)))
				{
					break;
				}
			}

			this.Tactical.addEntityToMap(player, x, y);

			if (!this.World.getTime().IsDaytime && player.getBaseProperties().IsAffectedByNight)
			{
				player.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function placePlayersAtBorder( _players )
	{
		for( local x = 9; x <= 23; x = ++x )
		{
			for( local y = 2; y <= 4; y = ++y )
			{
				this.Tactical.getTile(x, y - x / 2).removeObject();
			}
		}

		foreach( e in _players )
		{
			local p = e.getPlaceInFormation();
			local y = p < 9 ? 3 : 2;
			local x = p < 9 ? 11 + p : 11 + p - 9;
			local tile = this.Tactical.getTileSquare(x, y);

			if (!tile.IsEmpty)
			{
				tile.removeObject();
			}

			if (this.isTileIsolated(tile))
			{
				local avg = 0;

				for( local x = 0; x < 6; x = ++x )
				{
					if (tile.hasNextTile(x))
					{
						avg = avg + tile.getNextTile(x).Level;
					}
				}

				tile.Level = avg / 6;
			}

			this.Tactical.addEntityToMap(e, tile.Coords.X, tile.Coords.Y);

			if (!this.World.getTime().IsDaytime && e.getBaseProperties().IsAffectedByNight)
			{
				e.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function placePlayersInFormation( _players )
	{
		for( local x = 11; x <= 14; x = ++x )
		{
			for( local y = 10; y <= 20; y = ++y )
			{
				this.Tactical.getTile(x, y - x / 2).removeObject();
			}
		}

		foreach( e in _players )
		{
			local p = e.getPlaceInFormation();
			local x = 13 - p / 9;
			local y = 30 - (11 + p - p / 9 * 9);
			local tile = this.Tactical.getTileSquare(x, y);

			if (!tile.IsEmpty)
			{
				tile.removeObject();
			}

			if (this.isTileIsolated(tile))
			{
				local avg = 0;

				for( local x = 0; x < 6; x = ++x )
				{
					if (tile.hasNextTile(x))
					{
						avg = avg + tile.getNextTile(x).Level;
					}
				}

				tile.Level = avg / 6;
			}

			this.Tactical.addEntityToMap(e, tile.Coords.X, tile.Coords.Y);

			if (!this.World.getTime().IsDaytime && e.getBaseProperties().IsAffectedByNight)
			{
				e.getSkills().add(this.new("scripts/skills/special/night_effect"));
			}
		}
	}

	function onFactionCompare( _e1, _e2 )
	{
		if (this.World.FactionManager.isAlliedWithPlayer(_e1.Faction) && !this.World.FactionManager.isAlliedWithPlayer(_e2.Faction))
		{
			return -1;
		}
		else if (!this.World.FactionManager.isAlliedWithPlayer(_e1.Faction) && this.World.FactionManager.isAlliedWithPlayer(_e2.Faction))
		{
			return 1;
		}
		else
		{
			if (_e1.Faction < _e2.Faction)
			{
				return -1;
			}
			else if (_e1.Faction > _e2.Faction)
			{
				return 1;
			}

			return 0;
		}
	}

};
