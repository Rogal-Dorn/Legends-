this.ai_defend_rotation <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.rotation"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Rotation;
		this.m.Order = this.Const.AI.Behavior.Order.Rotation;
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

		if (this.getAgent().getIntentions().IsChangingWeapons && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 2)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);
		local allies = this.queryAlliesInMeleeRange();

		if (allies.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local zoc = _entity.getTile().getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
		local hitpointRatio = (_entity.getHitpoints() + _entity.getArmor(this.Const.BodyPart.Body) + _entity.getArmor(this.Const.BodyPart.Head)) / (_entity.getHitpointsMax() + _entity.getArmorMax(this.Const.BodyPart.Body) + _entity.getArmorMax(this.Const.BodyPart.Head));
		local isEntityWounded = false;

		if (hitpointRatio <= 0.5)
		{
			isEntityWounded = true;
		}

		local isEntityArmedWithShield = _entity.isArmedWithShield();
		local isEntityRangedUnit = this.isRangedUnit(_entity);
		local isEntityArmedWithMeleeWeapon = true;

		if (isEntityRangedUnit)
		{
			isEntityArmedWithMeleeWeapon = false;
		}
		else if (_entity.isArmedWithMeleeWeapon() && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 1)
		{
			isEntityArmedWithMeleeWeapon = false;
		}

		local isEntityAtIdealWeaponRange = true;

		if (zoc != 0 && !isEntityArmedWithMeleeWeapon)
		{
			isEntityAtIdealWeaponRange = false;
		}

		local bestTile;
		local bestScore = 1.0;

		foreach( ally in allies )
		{
			if (!this.m.Skill.onVerifyTarget(myTile, ally.getTile()))
			{
				continue;
			}

			local score = 1.0;
			local reverseScore = 1.0;
			local allyZOC = ally.getTile().getZoneOfControlCountOtherThan(ally.getAlliedFactions());
			local isAllyExpendable = ally.getCurrentProperties().TargetAttractionMult <= 0.25;
			local isAllyValuable = ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult;
			local isAllyArmedWithMeleeWeapon = true;

			if (this.isRangedUnit(ally))
			{
				isAllyArmedWithMeleeWeapon = false;
			}
			else if (ally.isArmedWithMeleeWeapon() && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 1)
			{
				isAllyArmedWithMeleeWeapon = false;
			}

			local isAllyAtIdealWeaponRange = true;

			if (allyZOC != 0 && !isAllyArmedWithMeleeWeapon)
			{
				isAllyAtIdealWeaponRange = false;
			}

			local isAllyFleeeing = ally.getMoraleState() == this.Const.MoraleState.Fleeing;
			local isAllyArmedWithShield = ally.isArmedWithShield();
			local allyHitpointRatio = (ally.getHitpoints() + ally.getArmor(this.Const.BodyPart.Body) + ally.getArmor(this.Const.BodyPart.Head)) / (ally.getHitpointsMax() + ally.getArmorMax(this.Const.BodyPart.Body) + ally.getArmorMax(this.Const.BodyPart.Head));

			if (!isAllyExpendable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
			{
				score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;
			}
			else if (!isAllyValuable && !isAllyFleeeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
			{
				score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;

				if (isEntityRangedUnit)
				{
					score = score * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
				}
			}

			if (!isAllyExpendable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && allyZOC > zoc + 2)
			{
				score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}
			else if (!isAllyValuable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && zoc > allyZOC + 2)
			{
				score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}

			if (!isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio && allyZOC > zoc + 1 && zoc != 0)
			{
				score = score * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
			}
			else if (!isAllyValuable && !isAllyFleeeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio && zoc > allyZOC + 1 && allyZOC != 0)
			{
				score = score * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (allyHitpointRatio - hitpointRatio)));
			}

			if (!isAllyExpendable && ally.getMoraleState() == this.Const.MoraleState.Fleeing && allyZOC > 0 && zoc == 0 && isEntityArmedWithMeleeWeapon)
			{
				score = score * this.Const.AI.Behavior.RotationSaveFleeingAlly;
			}

			if (ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc < allyZOC)
			{
				score = score * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}
			else if (_entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc > allyZOC)
			{
				score = score * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}

			if (!isAllyExpendable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;
			}
			else if (!isAllyValuable && !isAllyFleeeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;

				if (isEntityRangedUnit)
				{
					reverseScore = reverseScore * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
				}
			}

			if (!isAllyExpendable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && zoc > allyZOC + 2)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}
			else if (!isAllyValuable && !isAllyFleeeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && allyZOC > zoc + 2)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}

			if (!isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio && zoc > allyZOC + 1 && allyZOC != 0)
			{
				reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
			}
			else if (!isAllyValuable && !isAllyFleeeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio && allyZOC > zoc + 1 && allyZOC == 0)
			{
				reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (allyHitpointRatio - hitpointRatio)));
			}

			if (ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc > allyZOC)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}
			else if (_entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc < allyZOC)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}

			if (score > reverseScore && score > bestScore)
			{
				bestTile = ally.getTile();
				bestScore = score;
			}
		}

		if (bestTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTile;
		scoreMult = scoreMult * bestScore;
		return this.Const.AI.Behavior.Score.Rotation * scoreMult;
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
			this.logInfo("* " + _entity.getName() + ": Using Rotation!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay(1000);
			this.getAgent().declareAction();
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});
