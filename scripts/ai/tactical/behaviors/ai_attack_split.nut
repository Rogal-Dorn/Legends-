this.ai_attack_split <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.split",
			"actives.tail_slam_split",
			"actives.uproot",
			"actives.ghost_split"
		],
		Skill = null,
		MinTargets = 2,
		Length = 2
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Split;
		this.m.Order = this.Const.AI.Behavior.Order.Split;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.Skill = null;
		local score = this.getProperties().BehaviorMult[this.m.ID];

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

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local bestTarget = this.getBestTarget(_entity, this.m.Skill);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTarget.Target;
		return this.Const.AI.Behavior.Score.Split * bestTarget.Score * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Split!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive())
			{
				this.getAgent().declareAction();
				this.getAgent().declareEvaluationDelay(1000);
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill )
	{
		local myTile = _entity.getTile();
		local bestTarget;
		local bestScore = this.m.MinTargets;
		local bestCombinedValue = 0;

		for( local i = 0; i < 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local targetTile = myTile.getNextTile(i);

				if (!_skill.onVerifyTarget(myTile, targetTile))
				{
				}
				else
				{
					local score = 0;
					local combinedValue = 0.0;

					if (targetTile.IsOccupiedByActor && this.Math.abs(targetTile.Level - myTile.Level) <= this.m.Skill.getMaxLevelDifference())
					{
						if (targetTile.getEntity().isAlliedWith(_entity))
						{
							combinedValue = combinedValue - 3.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult);
						}
						else
						{
							combinedValue = combinedValue + this.queryTargetValue(_entity, targetTile.getEntity(), _skill);
							score = score + 1;
						}
					}

					local nextTile = targetTile;

					for( local j = 0; j < this.m.Length - 1; j = ++j )
					{
						if (!nextTile.hasNextTile(i))
						{
						}
						else
						{
							local tile = targetTile.getNextTile(i);

							if (this.Math.abs(tile.Level - myTile.Level) <= this.m.Skill.getMaxLevelDifference() && tile.IsOccupiedByActor)
							{
								if (tile.getEntity().isAlliedWith(_entity))
								{
									combinedValue = combinedValue - 3.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult);
								}
								else
								{
									combinedValue = combinedValue + this.queryTargetValue(_entity, tile.getEntity(), _skill);
									score = score + 1;
								}
							}

							nextTile = tile;
						}
					}

					if (score > bestScore || score == bestScore && combinedValue > bestCombinedValue)
					{
						bestTarget = targetTile;
						bestCombinedValue = combinedValue;
						bestScore = score;
					}
				}
			}
		}

		local score = this.Math.maxf(0.0, bestCombinedValue / 2.0);
		return {
			Target = bestTarget,
			Score = score
		};
	}

});

