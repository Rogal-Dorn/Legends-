this.ai_attack_knock_out <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.knock_out",
			"actives.strike_down",
			"actives.disarm"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.KnockOut;
		this.m.Order = this.Const.AI.Behavior.Order.KnockOut;
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
		local myTile = _entity.getTile();
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange() + (this.m.Skill.isRanged() ? myTile.Level : 0), this.m.Skill.getMaxLevelDifference());

		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local bestTarget = this.getBestTarget(_entity, this.m.Skill, targets);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTarget.Target.getTile();
		score = score * bestTarget.Score;
		return this.Const.AI.Behavior.Score.KnockOut * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Knock Out against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
		}

		return true;
	}

	function getBestTarget( _entity, _skill, _targets )
	{
		local attackSkill = _entity.getSkills().getAttackOfOpportunity();
		local apRequiredForAttack = attackSkill != null ? attackSkill.getActionPointCost() : 4;
		local canAttackNext = this.m.Skill.getActionPointCost() + apRequiredForAttack <= _entity.getActionPointsMax();
		local bestTarget;
		local bestScore = 0.0;
		local isDisarm = _skill.getID() == "actives.disarm";

		foreach( target in _targets )
		{
			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				for( ; target.getFatigue() >= target.getFatigueMax() - 5;  )
				{
				}

				if (isDisarm && (target.getCurrentProperties().IsImmuneToDisarm || !target.getCurrentProperties().IsAbleToUseWeaponSkills || target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null))
				{
					continue;
				}
				else if (!isDisarm && (target.getCurrentProperties().IsStunned || target.getCurrentProperties().IsImmuneToStun))
				{
					continue;
				}

				if (!canAttackNext && target.getCurrentProperties().TargetAttractionMult <= 1.0 && target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions()) <= 1)
				{
					continue;
				}

				local expectedDamage = attackSkill.getExpectedDamage(target);

				for( ; target.getHitpoints() <= expectedDamage.HitpointDamage + expectedDamage.DirectDamage;  )
				{
				}

				local score = target.getHitpoints() / target.getHitpointsMax();
				score = score * (_skill.getHitchance(target) * 0.01);
				score = score * target.getCurrentProperties().TargetAttractionMult;

				if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					score = score * this.Const.AI.Behavior.KnockoutFleeingMult;
				}

				if (target.isTurnDone() && target.getSkills().hasSkill("effects.adrenaline"))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded) && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE())
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}
		}

		return {
			Target = bestTarget,
			Score = bestScore
		};
	}

});

