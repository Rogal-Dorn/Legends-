::mods_hookNewObject("entity/tactical/tactical_entity_manager", function(o) {
    o.spawn = function ( _properties )
	{
		if (!this.Tactical.State.isScenarioMode() && this.World.State.getCombatSeed() != 0)
		{
			this.Math.seedRandom(this.World.State.getCombatSeed());
		}

		this.Time.setRound(0);
		this.World.Assets.updateFormation();
		local isPlayerInFormation = false;
		local all_players = _properties.IsUsingSetPlayers ? _properties.Players : this.World.getPlayerRoster().getAll();
		local players = [];

		foreach( e in _properties.TemporaryEnemies )
		{
			if (e > 2)
			{
				this.World.FactionManager.getFaction(e).setIsTemporaryEnemy(true);
			}
		}

		local riderMap = {}
		local hasSheildsUpPerk = false;

		foreach( p in all_players )
		{
			if (p.getPlaceInFormation() > 26)
			{
				continue;
			}

			if (p.getSkills().hasSkill("perk.legend_shields_up"))
			{
				hasSheildsUpPerk = true;
			}

			if (_properties.IsPlayerInitiated && p.isInReserves() && all_players.len() > 1)
			{
				continue;
			}

			if (p.getRiderID() != "")
			{
				local key = "" + p.getRiderID();
				if (!(key in riderMap))
				{
					riderMap[key] <- [null, null] //horse, rider
				}
				local pair = riderMap[key]
				if (p.isStabled())
				{
					pair[0] = p
				}
				else
				{
					pair[1] = p
				}
				continue
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
		}

		foreach(k, v in riderMap)
		{
			local p
			if (v[0] != null && v[1] != null)
			{
				p = this.World.getPlayerRoster().create("scripts/entity/tactical/legends_player_horserider");
				p.setHorse(v[0]);
				p.setRider(v[1]);
				p.setScenarioValues();
			}
			else if (v[0] != null)
			{
				p = v[0];
			}
			else
			{
				p = v[1];
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

		if(this.m.IsLineVSLine && !this.Tactical.State.isScenarioMode())
		{
			local friendlyRanged = false, enemyRanged = false;
				for( local i = this.Const.Faction.Player; i != this.m.Instances.len(); i = ++i )
					{
					if(this.m.Instances[i].len() == 0) continue; // most factions are empty
						local friendly = i == this.Const.Faction.Player || this.World.FactionManager.isAlliedWithPlayer(i);
						if(!(friendly ? friendlyRanged : enemyRanged))
						{
						foreach(e in this.m.Instances[i])
							{
							if(e.isArmedWithRangedWeapon())
								{
								if(friendly) friendlyRanged = true;
								else enemyRanged = true;
								break;
								}
							}
						}
					}

			if(friendlyRanged || enemyRanged)
			{
					for( local i = this.Const.Faction.Player; i != this.m.Instances.len(); i = ++i )
					{
						if(this.m.Instances[i].len() == 0) continue; // most factions are empty
						local faction = this.World.FactionManager.getFaction(i);
						local factionType = faction != null ? faction.getType() : this.Const.FactionType.Player;
						if(factionType == this.Const.FactionType.Zombies || factionType == this.Const.FactionType.Orcs)
							{
							continue; // zombies are too dumb. orcs are too confident
							}
							else if(factionType == this.Const.FactionType.Bandits)
							{
							local hasLeader = false; // bandits are too undisciplined unless there's a leader
							foreach(e in this.m.Instances[i])
							if(e.getType() == this.Const.EntityType.BanditLeader) 
								{ 
								hasLeader = true; break; 
								}
							if(!hasLeader) continue;
							}

					  local friendly = i == this.Const.Faction.Player || this.World.FactionManager.isAlliedWithPlayer(i);
					  if(friendly ? enemyRanged : friendlyRanged)
					  {
							if (hasSheildsUpPerk == true)
							{
								foreach(e in this.m.Instances[i])
			  						  {
									  if(e.isArmedWithShield())
											{
											local skill = e.getSkills().getSkillByID("actives.shieldwall");
											if (skill != null && skill.isUsable())
												{
												e.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
												e.setFatigue(e.getFatigue() + skill.getFatigueCost());
												}
											}
			  						  }
							}
							else if (hasSheildsUpPerk == false)
							{
								foreach(e in this.m.Instances[i])
			  						  {
									  if(e.isArmedWithShield() && e.getSkills().hasSkill("perk.legend_specialist_shield_skill"))
											{
											local skill = e.getSkills().getSkillByID("actives.shieldwall");
											if (skill != null && skill.isUsable())
												{
												e.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
												e.setFatigue(e.getFatigue() + skill.getFatigueCost());
												}
											}
			  						  }
							}
					  }
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

	o.placePlayersInFormation = function ( _players )
	{
		for( local x = 11; x <= 14; x = ++x )
		{
			for( local y = 10; y <= 20; y = ++y )
			{
				this.Tactical.getTile(x, y - x / 2).removeObject();
			}
		}

		local positions = [];
		positions.resize(27 ,0);

		foreach( e in _players )
		{
			local p = e.getPlaceInFormation();
			if (positions[p] == 1)
			{
				p += 9;
			}
			else
			{
				positions[p] = 1;
			}

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

    o.isTileIsolated = function( _tile )
	{
		local isCompletelyIsolated = true;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_tile.hasNextTile(i))
			{
                continue
			}

            if (_tile.getNextTile(i).IsEmpty && this.Math.abs(_tile.Level - _tile.getNextTile(i).Level) <= 1)
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
		allFactions.resize(128, 0); //Yuck, we have this dynamic throughout the code, but not sure how to get that dynamic here

		for( local i = 0; i != 128; i = ++i )
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

	local rezFn = o.resurrect;
	o.resurrect = function ( _info, _delay = 0 )
	{
		if (_info.Type == "")
		{
			return;
		}
		rezFn(_info, _delay);
	}

})
