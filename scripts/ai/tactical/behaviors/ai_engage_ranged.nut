this.ai_engage_ranged <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetActor = null,
		ValidTargets = [],
		TargetDist = 0,
		TargetDanger = 0.0,
		TargetAPCost = 0,
		TargetInfo = null,
		IsTargetForNextTurn = false,
		IsTargetNextToUs = false,
		IsInDangerThisRound = false,
		IsWaiting = false,
		IsDoneThisTurn = false,
		IsWaitingAfterMove = false,
		PossibleSkills = [
			"actives.quick_shot",
			"actives.aimed_shot",
			"actives.shoot_bolt",
			"actives.shoot_stake",
			"actives.sling_stone",
			"actives.miasma",
			"actives.horror",
			"actives.root",
			"actives.insects",
			"actives.shadows",
			"actives.charm"
		]
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.EngageRanged;
		this.m.Order = this.Const.AI.Behavior.Order.EngageRanged;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onTurnStarted()
	{
		this.m.IsInDangerThisRound = false;
		this.m.IsDoneThisTurn = false;
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.TargetActor = null;
		this.m.ValidTargets = [];
		this.m.TargetDist = 0;
		this.m.TargetAPCost = 0;
		this.m.TargetDanger = 0;
		this.m.IsTargetNextToUs = false;
		this.m.IsTargetForNextTurn = false;
		this.m.IsWaiting = false;
		this.m.IsWaitingAfterMove = false;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.IsDoneThisTurn && _entity.getActionPoints() < _entity.getActionPointsMax())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getCurrentProperties().IsRooted)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local retreat = this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Retreat);

		if (retreat != null && retreat.getScore() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsDefendingPosition)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.queryTargetsInMeleeRange();

		if (targets.len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local maxRange = 0;
		local considerLineOfFire = true;
		local visibleTileNeeded = true;
		local skills = [];

		foreach( skillID in this.m.PossibleSkills )
		{
			local skill = _entity.getSkills().getSkillByID(skillID);

			if (skill != null && skill.getMaxRange() > maxRange)
			{
				maxRange = skill.getMaxRange();
				considerLineOfFire = skill.isRanged();
				visibleTileNeeded = skill.isVisibleTileNeeded();
			}
		}

		if (maxRange == 0)
		{
			maxRange = this.Const.AI.Behavior.RangedEngageDefaultMaxRange;
		}

		maxRange = this.Math.min(maxRange, visibleTileNeeded ? _entity.getCurrentProperties().getVision() : maxRange);
		local targets = this.getAgent().getKnownOpponents();
		local myTile = _entity.getTile();
		local func = this.selectBestTarget(_entity, this.getAgent().getKnownOpponents(), maxRange, considerLineOfFire, visibleTileNeeded);

		while (resume func == null)
		{
			yield null;
		}

		local result = this.m.TargetInfo;
		this.m.TargetInfo = null;

		if (result.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local isTargetInRange = result.IsTargetInRange;
		this.m.IsInDangerThisRound = result.PotentialDanger.len() != 0 || result.CurrentDanger != 0;
		yield null;
		local func = this.selectBestTargetTile(_entity, result.Target, maxRange, result.PotentialDanger, result.CurrentDanger, considerLineOfFire, visibleTileNeeded);

		while (resume func == null)
		{
			yield null;
		}

		if (this.m.TargetTile == null || this.m.IsTargetForNextTurn || this.m.TargetTile.isSameTileAs(_entity.getTile()))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.TargetDist != 0)
		{
			if (!isTargetInRange)
			{
				scoreMult = scoreMult * this.Const.AI.Behavior.RangedEngageGeneralDirectionMult;
			}
			else
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
		}

		this.m.TargetActor = result.Target.Actor;
		local myTV = _entity.getTile().TVTotal;

		if (result.CurrentDanger > 1.0 && this.m.TargetDanger < result.CurrentDanger && this.getProperties().OverallDefensivenessMult != 0)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": It\'s important that I get some distance from my opponents..");
			}

			scoreMult = scoreMult * this.Math.maxf(this.getProperties().OverallDefensivenessMult * 0.5, result.CurrentDanger / this.Math.maxf(1.0, this.m.TargetDanger));
		}

		if (isTargetInRange)
		{
			if ((this.m.IsTargetNextToUs || _entity.getActionPoints() - this.m.TargetAPCost >= 4) && this.m.TargetTile.Level > _entity.getTile().Level && this.m.TargetActor.getTile().Level < this.m.TargetTile.Level)
			{
				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": Considering improving position since a clearly better one is right next to me..");
				}

				scoreMult = scoreMult * this.Const.AI.Behavior.RangedEngageImprovePosNearbyMult;
			}
		}

		if (_entity.isAbleToWait() && scoreMult < 0.5)
		{
			this.m.IsWaiting = true;
		}

		if (considerLineOfFire)
		{
			local targetTile = result.Target.Actor.getTile();
			local blockedTilesCurrently = this.Const.Tactical.Common.getBlockedTiles(myTile, targetTile, _entity.getFaction());
			local blockedTilesWhenMoving = this.Const.Tactical.Common.getBlockedTiles(this.m.TargetTile, targetTile, _entity.getFaction());

			if (blockedTilesCurrently.len() != 0 && blockedTilesWhenMoving.len() == 0)
			{
				scoreMult = scoreMult * this.Const.AI.Behavior.RangedEngageGetClearLineOfFireMult;
				local d = myTile.getDistanceTo(this.m.TargetTile);

				if (d <= 1)
				{
					scoreMult = scoreMult * this.Const.AI.Behavior.RangedEngageGetClearLineOfFireMult;
				}

				if (d <= 2)
				{
					scoreMult = scoreMult * this.Const.AI.Behavior.RangedEngageGetClearLineOfFireMult;
				}
			}
		}

		local distToTarget = this.m.TargetTile.getDistanceTo(myTile);

		if (this.m.TargetTile.getZoneOfControlCount(_entity.getFaction()) + (distToTarget == 1 ? -1 : 0) > myTile.getZoneOfControlCount(_entity.getFaction()))
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Taking cover..");
			}

			scoreMult = scoreMult * (this.Const.AI.Behavior.RangedEngageTakeCoverMult * (1.0 + this.getStrategy().getStats().EnemyRangedFiring) / (1.0 + this.getStrategy().getStats().AllyRangedFiring));
		}

		return this.Const.AI.Behavior.Score.EngageRanged * scoreMult;
	}

	function onBeforeExecute( _entity )
	{
		if (this.m.IsWaitingAfterMove)
		{
			this.m.IsDoneThisTurn = true;
		}

		this.getAgent().getOrders().IsEngaging = true;
		this.getAgent().getOrders().IsDefending = false;
		this.getAgent().getIntentions().IsDefendingPosition = false;
		this.getAgent().getIntentions().IsEngaging = true;
	}

	function onExecute( _entity )
	{
		local navigator = this.Tactical.getNavigator();

		if (this.m.IsFirstExecuted)
		{
			if (this.m.IsWaiting)
			{
				if (this.Tactical.TurnSequenceBar.entityWaitTurn(_entity))
				{
					if (this.Const.AI.VerboseMode)
					{
						this.logInfo("* " + _entity.getName() + ": Waiting until others have moved!");
					}

					this.m.TargetTile = null;
					this.m.TargetActor = null;
					return true;
				}
				else
				{
					this.m.IsWaiting = false;
				}
			}

			local settings = navigator.createSettings();
			settings.ActionPointCosts = _entity.getActionPointCosts();
			settings.FatigueCosts = _entity.getFatigueCosts();
			settings.FatigueCostFactor = 0.0;
			settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
			settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
			settings.AllowZoneOfControlPassing = false;
			settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
			settings.AlliedFactions = _entity.getAlliedFactions();
			settings.Faction = _entity.getFaction();
			navigator.findPath(_entity.getTile(), this.m.TargetTile, settings, this.m.TargetDist);

			if (this.Const.AI.PathfindingDebugMode)
			{
				navigator.buildVisualisation(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
			}

			local movement = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

			if (movement.Tiles == 0)
			{
				return true;
			}

			this.m.Agent.adjustCameraToDestination(movement.End);

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Engaging into firing range over " + movement.Tiles + " tiles at " + this.m.TargetActor.getName() + " (" + (this.m.TargetActor.getTile().IsVisibleForEntity ? "visible" : "not visible") + ")");
			}

			this.m.IsFirstExecuted = false;
			return;
		}

		if (!navigator.travel(_entity, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue()))
		{
			this.m.TargetTile = null;
			this.m.TargetActor = null;
			return true;
		}

		return false;
	}

	function getDangerFromActor( _actor, _target, _entity )
	{
		local d = this.queryActorTurnsNearTarget(_actor, _target, _entity);

		if (d.Turns <= this.Const.AI.Behavior.RangedEngageKeepMinTurnsAway && d.InZonesOfControl <= 2)
		{
			if (d.InZonesOfControl != 0 || _actor.getCurrentProperties().IsStunned || _actor.getCurrentProperties().IsRooted)
			{
				return 1.0;
			}
			else
			{
				return 3.0;
			}
		}
		else
		{
			return 0.0;
		}
	}

	function selectBestTargetTile( _entity, _target, _maxRange, _potentialDanger, _currentDanger, _considerLineOfFire, _visibleTileNeeded )
	{
		// Function is a generator.
		local navigator = this.Tactical.getNavigator();
		local myTile = _entity.getTile();
		local myFaction = _entity.getFaction();
		local opponents = this.getAgent().getKnownOpponents();
		local allies = this.getAgent().getKnownAllies();
		local useCoverMult = (1.0 + this.getStrategy().getStats().EnemyRangedFiring) / (1.0 + this.getStrategy().getStats().AllyRangedFiring);
		local myTileScore = 9000;

		if (myTile.getDistanceTo(_target.Tile) <= _maxRange + this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange / 2))
		{
			local time = this.Time.getExactTime();
			local tiles = {
				AI = this,
				Actor = _entity,
				Origin = myTile,
				Target = _target,
				ValidTargets = this.m.ValidTargets,
				Range = _maxRange,
				IsAlliedWithPlayer = _entity.isAlliedWithPlayer(),
				IsInDanger = _currentDanger != 0,
				ConsiderLineOfFire = _considerLineOfFire,
				VisibleTileNeeded = _visibleTileNeeded,
				Tiles = [],
				MapSize = this.Tactical.getMapSize()
			};
			this.onQueryTargetTile(myTile, tiles);
			this.Tactical.queryTilesInRange(_entity.getTile(), 1, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange / 2), true, _entity.getAlliedFactions(), this.onQueryTargetTile, tiles);

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			tiles.Tiles.sort(this.onSortByScore);
			local allyClosestToEnemy = 6;
			local attempts = 0;
			local bestDestination;
			local bestScore = 9000;
			local bestDanger = 0;
			local bestIsNextToUs = false;
			local bestIsForNextTurn = false;
			local bestAPCost = 0;

			foreach( t in tiles.Tiles )
			{
				if (this.isAllottedTimeReached(time))
				{
					yield null;
					time = this.Time.getExactTime();
				}

				attempts = ++attempts;

				if (attempts > this.Const.AI.Behavior.RangedEngageMaxAttempts)
				{
					break;
				}

				if (this.getStrategy().isDefending() && allyClosestToEnemy < 9000)
				{
					local nextTile = false;

					foreach( o in opponents )
					{
						if (t.Tile.getDistanceTo(o.Actor.getTile()) < allyClosestToEnemy)
						{
							nextTile = true;
							break;
						}
					}

					if (nextTile)
					{
						continue;
					}
				}

				local IsNextToUs = false;
				local IsForNextTurn = false;
				local apCost = 0;
				local finalTile = t.Tile;

				if (_considerLineOfFire && !t.Tile.hasLineOfSightTo(_target.Tile, _entity.getCurrentProperties().getVision()))
				{
					if (this.m.IsInDangerThisRound)
					{
						apCost = apCost + this.Const.AI.Behavior.RangedEngageNoLineOfSightPenalty;
					}
					else
					{
						continue;
					}
				}

				local danger = 0;

				if (!t.Tile.isSameTileAs(_entity.getTile()))
				{
					local settings = navigator.createSettings();
					settings.ActionPointCosts = _entity.getActionPointCosts();
					settings.FatigueCosts = _entity.getFatigueCosts();
					settings.FatigueCostFactor = 0.0;
					settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
					settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
					settings.AllowZoneOfControlPassing = false;
					settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
					settings.AlliedFactions = _entity.getAlliedFactions();
					settings.Faction = _entity.getFaction();

					if (navigator.findPath(_entity.getTile(), t.Tile, settings, 0))
					{
						local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
						apCost = apCost + movementCosts.ActionPointsRequired;
						finalTile = movementCosts.End;

						if (!movementCosts.IsComplete && movementCosts.Tiles == 0)
						{
							IsForNextTurn = true;
						}
						else if (movementCosts.IsComplete && movementCosts.Tiles <= 2)
						{
							IsNextToUs = true;
						}
						else
						{
							IsNextToUs = false;
						}
					}
					else
					{
						continue;
					}

					foreach( d in _potentialDanger )
					{
						if (finalTile.isSameTileAs(t.Tile))
						{
							danger = danger + this.getDangerFromActor(d, finalTile, _entity);
						}
						else
						{
							danger = danger + this.Math.maxf(this.getDangerFromActor(d, finalTile, _entity), this.getDangerFromActor(d, t.Tile, _entity));
						}
					}
				}
				else
				{
					danger = _currentDanger;
				}

				if (danger > _currentDanger + 2)
				{
					continue;
				}

				local score = apCost - t.LevelDifference * this.Const.AI.Behavior.RangedEngageLevelDifferenceMult + danger * this.Const.AI.Behavior.RangedEngageDangerMult - t.Tile.TVTotal * this.Const.AI.Behavior.RangedEngageTVTotalScoreMult - t.Tile.Level + t.TargetBlocked + t.DistanceToTarget * this.Const.AI.Behavior.RangedEngageDistanceToTargetMult;

				if (this.getStrategy().getStats().RangedAlliedVSEnemies <= 3.0)
				{
					local dirs = [
						0,
						0,
						0,
						0,
						0,
						0
					];
					local numRangedOpponentsInRange = 0;

					foreach( opponent in opponents )
					{
						local IsRanged = this.isRangedUnit(opponent.Actor);

						if (!IsRanged || opponent.Actor.getTile().getDistanceTo(myTile) > 10)
						{
							continue;
						}

						numRangedOpponentsInRange = ++numRangedOpponentsInRange;
						local dir = t.Tile.getDirection8To(opponent.Actor.getTile());
						local mult = 7.0 / t.Tile.getDistanceTo(opponent.Actor.getTile());

						switch(dir)
						{
						case this.Const.Direction8.W:
							dirs[this.Const.Direction.NW] += 4 * mult;
							dirs[this.Const.Direction.SW] += 4 * mult;
							break;

						case this.Const.Direction8.E:
							dirs[this.Const.Direction.NE] += 4 * mult;
							dirs[this.Const.Direction.SE] += 4 * mult;
							break;

						default:
							local dir = t.Tile.getDirectionTo(opponent.Actor.getTile());
							local dir_left = dir - 1 >= 0 ? dir - 1 : 6 - 1;
							local dir_right = dir + 1 < 6 ? dir + 1 : 0;
							dirs[dir] += 4 * mult;
							dirs[dir_left] += 3 * mult;
							dirs[dir_right] += 3 * mult;
							break;
						}
					}

					if (numRangedOpponentsInRange != 0)
					{
						for( local i = 0; i < 6; i = ++i )
						{
							if (dirs[i] <= 1)
							{
							}
							else if (!t.Tile.hasNextTile(i))
							{
							}
							else
							{
								local tile = t.Tile.getNextTile(i);

								if (tile.IsEmpty || tile.ID == myTile.ID)
								{
								}
								else
								{
									local cover = tile.getEntity();

									if (!tile.IsOccupiedByActor && !cover.isBlockingSight() || tile.IsOccupiedByActor && cover.isAlliedWith(_entity) && !this.isRangedUnit(cover) && (this.getStrategy().isDefending() || cover.getIdealRange() > 1 || tile.hasZoneOfControlOtherThan(cover.getAlliedFactions())))
									{
										local protectorMult = 1.0;

										if (tile.IsOccupiedByActor && cover.isAlliedWith(_entity) && cover.getAIAgent().getProperties().BehaviorMult[this.Const.AI.Behavior.ID.Protect] >= 1.0 && cover.getAIAgent().getBehavior(this.Const.AI.Behavior.ID.Protect) != null)
										{
											protectorMult = protectorMult * 1.25;
										}

										score = score - this.Const.AI.Behavior.RangedEngageCoverBonus * (dirs[i] / (numRangedOpponentsInRange * 1.0)) * (this.getStrategy().isDefending() ? 2.0 : 1.0) * useCoverMult * protectorMult;
									}
								}
							}
						}
					}
				}

				if (t.Tile.IsHidingEntity)
				{
					score = score - this.Const.AI.Behavior.RangedEngageTileHiddenBonus;
				}

				if (!tiles.IsAlliedWithPlayer && this.getProperties().OverallHideMult >= 1.0 && !t.Tile.IsVisibleForPlayer)
				{
					score = score - this.Const.AI.Behavior.RangedEngageTileNotVisibleBonus * this.getProperties().OverallHideMult;
				}

				if (t.Tile.isSameTileAs(_entity.getTile()))
				{
					myTileScore = score;
				}

				if (score < bestScore || score == bestScore && danger < bestDanger)
				{
					bestDestination = t.Tile;
					bestIsNextToUs = IsNextToUs;
					bestIsForNextTurn = IsForNextTurn;
					bestAPCost = apCost;
					bestDanger = danger;
					bestScore = score;
				}
			}

			if (bestDestination != null && (bestScore >= myTileScore || bestDestination.isSameTileAs(_entity.getTile())))
			{
				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": In fact, I would prefer to remain where I am (new)");
				}

				this.m.TargetDist = 0;
				this.m.TargetTile = _entity.getTile();
				this.m.TargetDanger = 0;
				this.m.TargetAPCost = 0;
				this.m.IsTargetNextToUs = false;
				this.m.IsTargetForNextTurn = false;
				return true;
			}

			if (bestDestination)
			{
				this.m.TargetDist = 0;
				this.m.TargetTile = bestDestination;
				this.m.TargetDanger = bestDanger;
				this.m.TargetAPCost = bestAPCost;
				this.m.IsTargetNextToUs = bestIsNextToUs;
				this.m.IsTargetForNextTurn = bestIsForNextTurn;
				return true;
			}
		}

		if (_entity.getTile().getDistanceTo(_target.Actor.getTile()) > _maxRange + this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange / 2))
		{
			local settings = navigator.createSettings();
			settings.ActionPointCosts = _entity.getActionPointCosts();
			settings.FatigueCosts = _entity.getFatigueCosts();
			settings.FatigueCostFactor = 0.0;
			settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
			settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
			settings.AllowZoneOfControlPassing = false;
			settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
			settings.AlliedFactions = _entity.getAlliedFactions();
			settings.Faction = _entity.getFaction();

			if (navigator.findPath(_entity.getTile(), _target.Actor.getTile(), settings, _maxRange + this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange / 2)))
			{
				local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

				if (movementCosts.Tiles != 0)
				{
					this.m.TargetDist = _maxRange + this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange / 2);
					this.m.TargetTile = _target.Actor.getTile();
					this.m.TargetDanger = 0;
					this.logDebug("No good tile in range, engaging in the general direction of the enemy!");
					return true;
				}
			}
		}

		return false;
	}

	function onQueryTargetTile( _tile, _tag )
	{
		if (_tile.SquareCoords.X >= _tag.MapSize.X - 1 || _tile.SquareCoords.X <= 0 || _tile.SquareCoords.Y >= _tag.MapSize.Y - 1 || _tile.SquareCoords.Y <= 0)
		{
			return;
		}

		local targetTile = _tag.Target.Tile;
		local targetDist = _tile.getDistanceTo(targetTile);
		local outOfRange = 0.0;
		local backupTile = false;

		if (!_tag.IsInDanger && (targetDist > _tag.Range + (_tag.ConsiderLineOfFire ? this.Math.max(0, _tile.Level - targetTile.Level) : 0) || _tag.VisibleTileNeeded && targetDist > _tag.Actor.getCurrentProperties().getVision() + this.Math.max(0, _tile.Level - targetTile.Level)))
		{
			local hasValidTarget = false;

			foreach( t in _tag.ValidTargets )
			{
				local validTile = t.getTile();

				if (!(!_tag.IsInDanger && (_tile.getDistanceTo(validTile) > _tag.Range + (_tag.ConsiderLineOfFire ? this.Math.max(0, _tile.Level - validTile.Level) : 0) || _tag.VisibleTileNeeded && _tile.getDistanceTo(validTile) > _tag.Actor.getCurrentProperties().getVision() + this.Math.max(0, _tile.Level - validTile.Level))))
				{
					hasValidTarget = true;
					break;
				}
			}

			if (hasValidTarget)
			{
				backupTile = true;
			}
			else
			{
				return;
			}
		}

		local dist = _tile.getDistanceTo(_tag.Origin);
		local levelDifferenceCapped = this.Math.min(1, this.Math.max(-1, _tile.Level - targetTile.Level));
		local targetBlocked = 0;

		if (_tag.ConsiderLineOfFire && !backupTile)
		{
			local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(_tile, targetTile, _tag.Actor.getFaction());

			foreach( tile in blockedTiles )
			{
				if (!tile.IsOccupiedByActor || tile.getEntity().isAlliedWith(_tag.Actor))
				{
					targetBlocked = this.Const.AI.Behavior.RangedEngageTargetBlockedPenalty * (1.0 - _tag.AI.getProperties().TargetPriorityHittingAlliesMult);
					break;
				}
			}
		}

		local tileHidden = 0;

		if (_tile.IsHidingEntity)
		{
			tileHidden = this.Const.AI.Behavior.RangedEngageTileHiddenBonus * _tag.AI.getProperties().OverallHideMult;
		}

		if (!_tag.IsAlliedWithPlayer && _tag.AI.getProperties().OverallHideMult >= 1.0 && !_tile.IsVisibleForPlayer)
		{
			tileHidden = tileHidden + this.Const.AI.Behavior.RangedEngageTileNotVisibleBonus * _tag.AI.getProperties().OverallHideMult;
		}

		local score = _tile.Level * 2.0 + levelDifferenceCapped * this.Const.AI.Behavior.RangedEngageLevelDifferenceMult + _tile.TVTotal - dist * this.Const.AI.Behavior.RangedEngageDistanceToTargetMult - targetBlocked + tileHidden - (backupTile ? 10 : 0);
		_tag.Tiles.push({
			Tile = _tile,
			Score = score,
			LevelDifference = levelDifferenceCapped,
			DistanceToTarget = dist,
			TargetBlocked = targetBlocked
		});
	}

	function onSortByScore( _a, _b )
	{
		if (_a.Score > _b.Score)
		{
			return -1;
		}
		else if (_a.Score < _b.Score)
		{
			return 1;
		}

		return 0;
	}

	function selectBestTarget( _entity, _targets, _maxRange, _considerLineOfFire, _visibleTileNeeded )
	{
		// Function is a generator.
		local bestTarget;
		local bestScore = -9000.0;
		local bestTargetInRange = false;
		local myTile = _entity.getTile();
		local currentDanger = 0.0;
		local potentialDanger = [];
		local time = this.Time.getExactTime();

		foreach( target in _targets )
		{
			if (target.Actor.isNull())
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local targetTile = target.Actor.getTile();
			local realDist = myTile.getDistanceTo(targetTile);

			if (realDist <= this.Const.AI.Behavior.RangedEngageMaxDangerDist && target.Actor.getMoraleState() != this.Const.MoraleState.Fleeing && !this.isRangedUnit(target.Actor) && !target.Actor.isNonCombatant() && target.Actor.getHitpoints() / target.Actor.getHitpointsMax() >= this.Const.AI.Behavior.RangedEngageMinDangerHitpointsPct && targetTile.getZoneOfControlCountOtherThan(target.Actor.getAlliedFactions()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
			{
				potentialDanger.push(target.Actor);
				local danger = this.getDangerFromActor(target.Actor, myTile, _entity);
				currentDanger = currentDanger + danger;
			}

			local alliesAdjacent = 0;
			local opponentsAdjacent = 0;
			local score = 0.0;
			score = this.queryTargetValue(_entity, target.Actor, null);

			if (_considerLineOfFire)
			{
				local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(myTile, targetTile, _entity.getFaction());

				foreach( tile in blockedTiles )
				{
					if (!tile.IsOccupiedByActor || tile.getEntity().isAlliedWith(_entity))
					{
						score = score * this.Const.AI.Behavior.AttackLineOfFireBlockedMult;
						break;
					}
				}
			}

			if (myTile.getDistanceTo(targetTile) > 2)
			{
				for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
				{
					if (!targetTile.hasNextTile(i))
					{
					}
					else
					{
						local tile = targetTile.getNextTile(i);

						if (tile.IsEmpty)
						{
						}
						else if (tile.IsOccupiedByActor)
						{
							if (tile.getEntity().isAlliedWith(_entity))
							{
								if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0)
								{
									score = score - 1.0 / 6.0 * 4.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult);
								}

								alliesAdjacent = ++alliesAdjacent;
							}
							else
							{
								score = score + 1.0 / 6.0 * this.queryTargetValue(_entity, tile.getEntity(), null) * this.Const.AI.Behavior.AttackRangedHitBystandersMult;
								opponentsAdjacent = ++opponentsAdjacent;
							}
						}
					}
				}
			}

			if (targetTile.getZoneOfControlCount(_entity.getFaction()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
			{
				score = score * (1.0 + (1.0 - this.Math.minf(1.0, this.queryActorTurnsNearTarget(target.Actor, myTile, _entity).Turns)) * this.Const.AI.Behavior.AttackDangerMult);
			}

			if (realDist <= _maxRange + this.Math.max(0, myTile.Level - targetTile.Level))
			{
				score = score * this.Const.AI.Behavior.RangedEngageAttackNotMoveMult;
			}

			if (realDist > _maxRange)
			{
				score = score * this.Math.maxf(0.5, 1.0 - (realDist - _maxRange) * this.Const.AI.Behavior.RangedEngageLessPerTileMult);
			}

			this.m.ValidTargets.push(target.Actor);

			if (score > bestScore && (this.getProperties().TargetPriorityHittingAlliesMult >= 1.0 || alliesAdjacent <= this.Const.AI.Behavior.AttackRangedMaxAlliesAdjacent))
			{
				bestTarget = target;
				bestScore = score;
				bestTargetInRange = realDist <= _maxRange + (_considerLineOfFire ? this.Math.max(0, _entity.getTile().Level - targetTile.Level) : 0) && (!_visibleTileNeeded || targetTile.IsVisibleForEntity);
			}
		}

		foreach( t in _targets )
		{
			if (bestTarget == null || t.Actor.getID() != bestTarget.Actor.getID())
			{
				this.m.ValidTargets.push(t.Actor);
			}
		}

		this.m.TargetInfo = {
			Target = bestTarget,
			TargetScore = bestScore,
			CurrentDanger = currentDanger,
			PotentialDanger = potentialDanger,
			IsTargetInRange = bestTargetInRange
		};
		return true;
	}

});

