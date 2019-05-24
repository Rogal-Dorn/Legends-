this.ai_disengage <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		Target = null,
		PossibleSkills = [
			"actives.footwork"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Disengage;
		this.m.Order = this.Const.AI.Behavior.Order.Disengage;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.Target = null;
		this.m.Skill = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local inZonesOfControl = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

		if (inZonesOfControl == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local rangedUnit = this.isRangedUnit(_entity);

		if (rangedUnit && this.getAgent().getIntentions().IsChangingWeapons && _entity.isArmedWithMeleeWeapon())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);
		local isGoodReason = false;
		local currentBestTargetScore = 0.0;
		local inMeleeWithRanged = false;
		local hasShieldWall = _entity.getSkills().hasSkill("effects.shieldwall");

		if (!rangedUnit)
		{
			local targets = this.queryTargetsInMeleeRange(1, _entity.getIdealRange(), 1);
			currentBestTargetScore = this.queryBestMeleeTarget(_entity, null, targets).Score;

			foreach( t in targets )
			{
				if (this.isRangedUnit(t))
				{
					inMeleeWithRanged = true;
					break;
				}
			}
		}

		local enemiesLocked = true;
		local targetsInMelee = this.queryTargetsInMeleeRange();

		foreach( t in targetsInMelee )
		{
			if (!t.getCurrentProperties().IsRooted && t.getTile().getZoneOfControlCountOtherThan(t.getAlliedFactions()) <= 1)
			{
				enemiesLocked = false;
				break;
			}
		}

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
		local opponents = this.getAgent().getKnownOpponents();
		local bestTile;
		local bestScore = -9000.0;
		local bestTarget;

		for( local i = 0; i < 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);
				local goodReason = false;
				local score = 1.0;

				if (!nextTile.IsEmpty)
				{
				}
				else if (!this.m.Skill.isUsableOn(nextTile))
				{
				}
				else
				{
					local numNewZOC = nextTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

					if (numNewZOC > inZonesOfControl)
					{
					}
					else
					{
						local potentialTarget;

						if (rangedUnit)
						{
							if (numNewZOC == 0 && enemiesLocked)
							{
								score = score * this.Const.AI.Behavior.DisengageWithRangedWeaponMult;
								goodReason = true;
							}
						}
						else
						{
							local targets = this.queryTargetsInMeleeRange(1, _entity.getIdealRange(), 1, nextTile);
							local target = this.queryBestMeleeTarget(_entity, null, targets);
							local bestTargetScore = target.Score;

							if (_entity.getIdealRange() > 1 && numNewZOC < inZonesOfControl && (inZonesOfControl > 1 || !inMeleeWithRanged))
							{
								score = score * (this.Const.AI.Behavior.DisengageWrongRangeMult * (inZonesOfControl - numNewZOC));
								goodReason = true;
							}

							if (_entity.getCurrentProperties().getMeleeDefense() <= 75 && numNewZOC < inZonesOfControl - 1 && numNewZOC != 0 && currentBestTargetScore >= bestTargetScore)
							{
								score = score * (this.Math.pow(this.Const.AI.Behavior.DisengageLessOpponentsMult, inZonesOfControl - numNewZOC) + bestTargetScore * this.Const.AI.Behavior.DisengageTargetMult);
								goodReason = true;
							}

							if (!hasShieldWall && bestTargetScore >= currentBestTargetScore * this.Const.AI.Behavior.DisengageMinBetterTargetPct && numNewZOC <= inZonesOfControl)
							{
								score = score * (1.0 + bestTargetScore * this.Const.AI.Behavior.DisengageBetterTargetMult);
								goodReason = true;
								potentialTarget = target.Target;
							}

							if (!hasShieldWall && numNewZOC == 0 && _entity.getActionPoints() >= this.m.Skill.getActionPointCost() + 2)
							{
								foreach( o in opponents )
								{
									local opponentTile = o.Actor.getTile();
									local d = opponentTile.getDistanceTo(nextTile);

									if (d <= _entity.getIdealRange() || d >= 4)
									{
										continue;
									}

									local opponentZOCs = opponentTile.getZoneOfControlCountOtherThan(o.Actor.getAlliedFactions());

									if (opponentZOCs > 2)
									{
										continue;
									}

									local value = this.queryTargetValue(_entity, o.Actor, null);

									if (!(value >= currentBestTargetScore * this.Const.AI.Behavior.DisengageMinBetterTargetPct))
									{
										continue;
									}

									if (navigator.findPath(nextTile, opponentTile, settings, 1))
									{
										local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints() - this.m.Skill.getActionPointCost(), _entity.getFatigueMax() - _entity.getFatigue() - this.m.Skill.getFatigueCost());

										if (!movementCosts.IsComplete)
										{
											continue;
										}

										local hypotheticalNewZOC = movementCosts.End.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

										for( ; hypotheticalNewZOC > inZonesOfControl;  )
										{
										}

										score = score * (this.Const.AI.Behavior.DisengageBetterTargetMult - movementCosts.Tiles * 0.1 + value * this.Const.AI.Behavior.DisengageTargetMult);
										potentialTarget = o.Actor;
										goodReason = true;
										break;
									}
								}
							}

							if ((nextTile.Level > myTile.Level || myTile.IsBadTerrain && !nextTile.IsBadTerrain) && numNewZOC <= inZonesOfControl && numNewZOC != 0 && currentBestTargetScore >= bestTargetScore)
							{
								score = score * (this.Const.AI.Behavior.DisengageBetterTileMult + bestTargetScore * this.Const.AI.Behavior.DisengageTargetMult);
								goodReason = true;
							}
						}

						if (goodReason && score > bestScore)
						{
							bestTile = nextTile;
							bestScore = score;
							bestTarget = potentialTarget;
						}
					}
				}
			}
		}

		if (bestTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTile;
		this.m.Target = bestTarget;
		scoreMult = scoreMult * bestScore;
		return this.Const.AI.Behavior.Score.Disengage * scoreMult;
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
			this.logInfo("* " + _entity.getName() + ": Disengaging!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay(1000);
			this.getAgent().declareAction();
		}

		if (this.m.Target != null && this.getAgent().getForcedOpponent() == null)
		{
			this.getAgent().setForcedOpponent(this.m.Target);
		}

		this.m.Target = null;
		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});

