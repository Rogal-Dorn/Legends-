this.ai_defend_knock_back <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.knock_back",
			"actives.repel",
			"actives.hook"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.KnockBack;
		this.m.Order = this.Const.AI.Behavior.Order.KnockBack;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.TargetTile = null;
		this.m.Skill = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];
		local time = this.Time.getExactTime();

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);
		local hasShieldBash = this.m.Skill.getID() == "actives.knock_back" && _entity.getSkills().hasSkill("perk.shield_bash");

		if (hasShieldBash)
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.KnockBackShieldBashMult;
		}

		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange());
		local bestScore = 0;
		local bestTarget;
		local idealEngageRange = this.getProperties().EngageRangeIdeal;
		local myTile = _entity.getTile();
		local skillCost = this.m.Skill.getActionPointCost();
		local zoc = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

		foreach( t in targets )
		{
			if (t.getCurrentProperties().IsImmuneToKnockBackAndGrab || t.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				continue;
			}

			local targetTile = t.getTile();
			local targetHasZOC = !t.getCurrentProperties().IsStunned && !t.isArmedWithRangedWeapon();

			if (!this.m.Skill.isUsableOn(targetTile))
			{
				continue;
			}

			local tile = this.m.Skill.findTileToKnockBackTo(myTile, targetTile);

			if (tile == null)
			{
				continue;
			}

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local isGoodReason = false;
			local isToImprovePosition = false;
			local score = 1.0;
			local alliesCurrently = 0;

			for( local i = 0; i != 6; i = ++i )
			{
				if (!targetTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = targetTile.getNextTile(i);

					if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - targetTile.Level) <= 1 && adjacentTile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing && !adjacentTile.getEntity().isAlliedWith(t))
					{
						alliesCurrently = ++alliesCurrently;
					}
				}
			}

			local alliesAtKnockTo = 0;

			for( local i = 0; i != 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = tile.getNextTile(i);

					if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - tile.Level) <= 1 && adjacentTile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing && !adjacentTile.getEntity().getCurrentProperties().IsStunned && !adjacentTile.getEntity().isAlliedWith(t) && adjacentTile.getEntity().getID() != _entity.getID())
					{
						alliesAtKnockTo = ++alliesAtKnockTo;
					}
				}
			}

			if (this.Math.max(0, this.Math.abs(tile.Level - targetTile.Level) - 1) * this.Const.Combat.FallingDamage + (hasShieldBash && t.getArmor(this.Const.BodyPart.Body) <= 50 ? 10 : 0) >= t.getHitpoints())
			{
				isGoodReason = true;
				score = score * (this.m.Skill.getHitchance(t) / 100.0 * this.Const.AI.Behavior.KnockBackKnockDownToKillMult);
			}
			else if (alliesCurrently != 0 && t.isArmedWithRangedWeapon())
			{
				continue;
			}
			else
			{
				score = score * (t.getHitpoints() / t.getHitpointsMax() * (this.m.Skill.getHitchance(t) / 100.0));

				if (t.getCurrentProperties().IsStunned)
				{
					score = score * this.Const.AI.Behavior.KnockBackStunnedTargetMult;
				}

				local opponentsCurrently = 0;

				for( local i = 0; i != 6; i = ++i )
				{
					if (!myTile.hasNextTile(i))
					{
					}
					else
					{
						local adjacentTile = myTile.getNextTile(i);

						if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - myTile.Level) <= 1 && adjacentTile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing && !adjacentTile.getEntity().getCurrentProperties().IsStunned && !adjacentTile.getEntity().isAlliedWith(_entity))
						{
							opponentsCurrently = ++opponentsCurrently;
						}
					}
				}

				local targetHasRiposte = t.getSkills().hasSkill("effects.riposte");
				local targetHasSpearwall = t.getSkills().hasSkill("effects.spearwall") && targetTile.getZoneOfControlCountOtherThan(t.getAlliedFactions()) == 0;

				if (alliesAtKnockTo > 0 && (alliesAtKnockTo > alliesCurrently + 1 || opponentsCurrently > 2 && alliesAtKnockTo > alliesCurrently || targetHasRiposte && alliesAtKnockTo >= 1 || targetHasSpearwall && alliesAtKnockTo >= 2 || t.getSkills().hasSkill("effects.shieldwall") && alliesAtKnockTo >= 2))
				{
					isGoodReason = true;
					score = score * this.Const.AI.Behavior.KnockBackIntoAlliesMult;
				}
				else if (this.isRangedUnit(t) && alliesCurrently == 0 && alliesAtKnockTo != 0)
				{
					isGoodReason = true;
					score = score * this.Const.AI.Behavior.KnockBackIntoAlliesMult;
				}

				if (targetHasRiposte || targetHasSpearwall)
				{
					score = score * this.Const.AI.Behavior.KnockBackToRemoveCounterSkillMult;
				}
			}

			local isKnockToTileLocked = tile.getZoneOfControlCountOtherThan(t.getAlliedFactions());

			if (!isGoodReason && targetTile.getZoneOfControlCountOtherThan(t.getAlliedFactions()) != 0)
			{
				local numSpearwalls = 0;

				for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
				{
					if (!targetTile.hasNextTile(i))
					{
					}
					else
					{
						local adjacent = targetTile.getNextTile(i);

						if (!adjacent.IsOccupiedByActor || this.Math.abs(adjacent.Level - targetTile.Level) > 1)
						{
						}
						else if (!adjacent.getEntity().isAlliedWith(t) && adjacent.getZoneOfControlCountOtherThan(adjacent.getEntity().getAlliedFactions()) <= 1 && adjacent.getEntity().getSkills().hasSkill("effects.spearwall"))
						{
							numSpearwalls = ++numSpearwalls;
						}
					}
				}

				if (numSpearwalls > 0)
				{
					isGoodReason = true;
					score = score * this.Math.pow(this.Const.AI.Behavior.KnockBackSpearwallMult, numSpearwalls);
				}
			}

			if (!isGoodReason && zoc == 1 && targetHasZOC && _entity.getActionPoints() - skillCost >= 2)
			{
				local targetValue = this.queryTargetValue(_entity, t, null);
				local opponents = this.getAgent().getKnownOpponents();
				local bestValue = 0.0;
				local navigator = this.Tactical.getNavigator();
				local settings = navigator.createSettings();
				settings.ActionPointCosts = _entity.getActionPointCosts();
				settings.FatigueCosts = _entity.getFatigueCosts();
				settings.FatigueCostFactor = 0.0;
				settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
				settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
				settings.AllowZoneOfControlPassing = false;
				settings.ZoneOfControlCost = 0;
				settings.AlliedFactions = _entity.getAlliedFactions();
				settings.Faction = _entity.getFaction();

				foreach( o in opponents )
				{
					if (o.Actor.isNull() || o.Actor.getID() == t.getID())
					{
						continue;
					}

					local opponentTile = o.Actor.getTile();
					local opponentZOCs = opponentTile.getZoneOfControlCountOtherThan(o.Actor.getAlliedFactions());

					if (opponentZOCs > 2)
					{
						continue;
					}

					if (opponentTile.getDistanceTo(myTile) <= idealEngageRange && this.Math.abs(opponentTile.Level - myTile.Level) <= 1)
					{
						continue;
					}

					local value = this.queryTargetValue(_entity, o.Actor, null);

					if (value > bestValue)
					{
						settings.TileToConsiderEmpty = t.getTile();

						if (navigator.findPath(_entity.getTile(), opponentTile, settings, 1))
						{
							local turnsRequired = navigator.getTurnsRequiredForPath(_entity, settings, _entity.getActionPoints() - skillCost, opponentTile, _entity.getFaction());

							if (isKnockToTileLocked && turnsRequired > 3.0 && opponentZOCs > 0 || turnsRequired > 1.0)
							{
								continue;
							}

							bestValue = value;
						}
					}
				}

				if (bestValue > targetValue * this.Const.AI.Behavior.KnockBackBetterTargetPct)
				{
					isGoodReason = true;
					score = score * this.Const.AI.Behavior.KnockBackEngageBetterTargetMult;
				}
			}

			if (!isGoodReason)
			{
				local isTargetInMeleeWithImportantAlly = false;
				local isTargetRemovableFromImportantAlly = true;
				local importantAlly;

				for( local i = 0; i != 6; i = ++i )
				{
					if (!targetTile.hasNextTile(i))
					{
					}
					else
					{
						local adjacentTile = targetTile.getNextTile(i);

						if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - targetTile.Level) <= 1)
						{
							local entity = adjacentTile.getEntity();

							if (entity.getID() != _entity.getID() && entity.isAlliedWith(_entity) && (entity.getCurrentProperties().TargetAttractionMult > 1.0 || this.isRangedUnit(entity)))
							{
								isTargetInMeleeWithImportantAlly = true;
								importantAlly = entity;
								break;
							}
						}
					}
				}

				for( local i = 0; i != 6; i = ++i )
				{
					if (!tile.hasNextTile(i))
					{
					}
					else
					{
						local adjacentTile = tile.getNextTile(i);

						if (adjacentTile.IsOccupiedByActor && this.Math.abs(adjacentTile.Level - tile.Level) <= 1)
						{
							local entity = adjacentTile.getEntity();

							if (entity.isAlliedWith(_entity) && entity.getCurrentProperties().TargetAttractionMult > 1.0)
							{
								isTargetRemovableFromImportantAlly = false;
								break;
							}
						}
					}
				}

				if (isTargetInMeleeWithImportantAlly && isTargetRemovableFromImportantAlly)
				{
					isGoodReason = true;
					score = score * this.Math.maxf(1.0, this.Const.AI.Behavior.KnockBackToProtectAllyMult * importantAlly.getCurrentProperties().TargetAttractionMult);

					if (isKnockToTileLocked)
					{
						score = score * this.Const.AI.Behavior.KnockBackProtectAllyLockedMult;
					}
				}
			}

			if (!isGoodReason && targets.len() > 1 && tile.Level - targetTile.Level <= -2)
			{
				if (!isKnockToTileLocked)
				{
					local navigator = this.Tactical.getNavigator();
					local settings = navigator.createSettings();
					settings.ActionPointCosts = t.getActionPointCosts();
					settings.FatigueCosts = t.getFatigueCosts();
					settings.FatigueCostFactor = 0.0;
					settings.ActionPointCostPerLevel = t.getLevelActionPointCost();
					settings.FatigueCostPerLevel = t.getLevelFatigueCost();
					settings.AllowZoneOfControlPassing = false;
					settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
					settings.AlliedFactions = t.getAlliedFactions();
					settings.Faction = t.getFaction();
					settings.TileToConsiderEmpty = t.getTile();

					if (navigator.findPath(tile, _entity.getTile(), settings, 1))
					{
						local turnsRequired = navigator.getTurnsRequiredForPath(t, settings, t.getActionPointsMax(), t.getTile(), t.getFaction());

						for( ; turnsRequired <= this.Const.AI.Behavior.KnockBackKnockDownMinTurnsToGetBack;  )
						{
						}
					}
				}

				score = score * this.Const.AI.Behavior.KnockBackKnockDownCliffMult;
				isGoodReason = true;
			}

			if (!isGoodReason && (isKnockToTileLocked || _entity.getActionPoints() >= skillCost + _entity.getActionPointCosts()[targetTile.Type] + (targetTile.Level - myTile.Level != 0 ? this.Const.Movement.LevelDifferenceActionPointCost : 0)))
			{
				score = score * this.Const.AI.Behavior.KnockBackForPositionMult;

				if (zoc == 1 && targetHasZOC && targetTile.Level > myTile.Level && tile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}

				if (!isGoodReason && zoc == 1 && targetHasZOC && !targetTile.IsBadTerrain && myTile.IsBadTerrain && targetTile.Level >= myTile.Level && tile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}

				if (!isGoodReason && zoc == 1 && targetHasZOC && !targetTile.IsBadTerrain && tile.IsBadTerrain && targetTile.Level >= myTile.Level && tile.Level <= targetTile.Level)
				{
					isGoodReason = true;
				}
			}

			if (!isGoodReason)
			{
				continue;
			}

			if (score > bestScore)
			{
				bestScore = score;
				bestTarget = t;
			}
		}

		if (bestTarget != null)
		{
			this.m.TargetTile = bestTarget.getTile();
			return this.Const.AI.Behavior.Score.KnockBack * bestScore * scoreMult;
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Knock Back!");
		}

		this.m.Skill.use(this.m.TargetTile);
		this.getAgent().getIntentions().IsKnockingBack = true;

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay();
			this.getAgent().declareAction();
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});

