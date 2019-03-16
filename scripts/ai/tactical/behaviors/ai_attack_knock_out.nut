this.ai_attack_knock_out <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.knock_out",
			"actives.strike_down",
			"actives.legend_staff_knock_out"
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
		local targets = this.queryTargetsInMeleeRange();

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
		local bestTarget;
		local bestScore = 0.0;

		foreach( target in _targets )
		{
			if (_skill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				for( ; target.getFatigue() >= target.getFatigueMax() - 5;  )
				{
				}

				if (target.getCurrentProperties().IsStunned || target.getCurrentProperties().IsImmuneToStun)
				{
					continue;
				}

				local p = _entity.getCurrentProperties();
				local armor = target.getArmor(this.Const.BodyPart.Body) * (p.HitChance[this.Const.BodyPart.Body] / 100.0) + target.getArmor(this.Const.BodyPart.Head) * (p.HitChance[this.Const.BodyPart.Head] / 100.0);
				local hitpoints = target.getHitpoints();
				local armorDamage = this.Math.min(armor, p.getArmorDamageAverage());
				local hitpointDamage = this.Math.max(0, p.getRegularDamageAverage() - armorDamage);

				for( ; hitpoints <= hitpointDamage;  )
				{
				}

				local score = target.getHitpoints() / target.getHitpointsMax();
				score = score * (_skill.getHitchance(target) * 0.01);

				if (target.getSkills().hasSkill("actives.rally_the_troops"))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getSkills().hasSkill("perk.berserk"))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getSkills().hasSkill("effects.killing_frenzy"))
				{
					score = score * this.Const.AI.Behavior.KnockoutPriorityMult;
				}

				if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE() && target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions()) >= 3)
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
