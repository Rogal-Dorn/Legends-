this.ai_hook <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.hook"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Hook;
		this.m.Order = this.Const.AI.Behavior.Order.Hook;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
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
		local targets = this.queryTargetsInMeleeRange();

		if (targets.len() >= this.Const.AI.Behavior.KnockBackMinOpponentsInMelee)
		{
			local bestScore = 0;
			local bestTarget;
			local ourTile = _entity.getTile();
			local skillCost = this.m.Skill.getActionPointCost();

			foreach( t in targets )
			{
				if (t.getCurrentProperties().IsImmuneToKnockBackAndGrab)
				{
					continue;
				}

				local targetTile = t.getTile();
				local tile = this.m.Skill.findTileToKnockBackTo(ourTile, targetTile);

				if (tile == null)
				{
					continue;
				}

				local isGoodReason = false;
				local isToImprovePosition = false;
				local score = 1.0;

				if (this.Math.max(0, this.Math.abs(tile.Level - targetTile.Level) - 1) * this.Const.Combat.FallingDamage >= t.getHitpoints())
				{
					isGoodReason = true;
					score = score * (this.m.Skill.getHitchance(t) / 100.0 * this.Const.AI.Behavior.KnockBackKnockDownToKillMult);
				}
				else if (t.isArmedWithRangedWeapon())
				{
					continue;
				}
				else
				{
					score = score * (t.getHitpoints() / t.getHitpointsMax() * (this.m.Skill.getHitchance(t) / 100.0));
				}

				local isKnockToTileLocked = tile.getZoneOfControlCountOtherThan(t.getAlliedFactions());

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

				if (!isGoodReason && (isKnockToTileLocked || _entity.getActionPoints() >= skillCost + _entity.getActionPointCosts()[targetTile.Type] + (targetTile.Level - ourTile.Level != 0 ? this.Const.Movement.LevelDifferenceActionPointCost : 0)))
				{
					score = score * this.Const.AI.Behavior.KnockBackForPositionMult;

					if (targets.len() == 1 && targetTile.Level > ourTile.Level && tile.Level <= targetTile.Level)
					{
						isGoodReason = true;
					}

					if (!isGoodReason && targets.len() == 1 && !targetTile.IsBadTerrain && ourTile.IsBadTerrain && targetTile.Level >= ourTile.Level && tile.Level <= targetTile.Level)
					{
						isGoodReason = true;
					}

					if (!isGoodReason && targets.len() == 1 && !targetTile.IsBadTerrain && tile.IsBadTerrain && targetTile.Level >= ourTile.Level && tile.Level <= targetTile.Level)
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
