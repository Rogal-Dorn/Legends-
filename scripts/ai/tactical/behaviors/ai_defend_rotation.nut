this.ai_defend_rotation <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		PossibleSkills = [
			"actives.rotation",
			"actives.barbarian_fury"
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
		local isOffensive = this.m.Skill.getID() == "actives.barbarian_fury";
		local hitpointRatio = (_entity.getHitpoints() + _entity.getArmor(this.Const.BodyPart.Body) + _entity.getArmor(this.Const.BodyPart.Head)) / (_entity.getHitpointsMax() + _entity.getArmorMax(this.Const.BodyPart.Body) + _entity.getArmorMax(this.Const.BodyPart.Head));
		local isEntityWounded = false;

		if (hitpointRatio <= 0.5)
		{
			isEntityWounded = true;
		}

		local isEntityArmedWithShield = _entity.isArmedWithShield();
		local isEntityExpendable = _entity.getCurrentProperties().TargetAttractionMult <= 0.25;
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

		local isEntityAOE = isEntityArmedWithMeleeWeapon && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE();
		local isEntityTwoHanded = isEntityArmedWithMeleeWeapon && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded);
		local currentPotentialTargets = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), 1, myTile);
		local currentBestTarget = this.queryBestMeleeTarget(_entity, null, currentPotentialTargets);
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
			local isEntityValuable = _entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult;
			local isAllyArmedWithMeleeWeapon = true;
			local isAllyRangedUnit = this.isRangedUnit(ally);

			if (isAllyRangedUnit)
			{
				isAllyArmedWithMeleeWeapon = false;
			}
			else if (ally.isArmedWithMeleeWeapon() && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 1)
			{
				isAllyArmedWithMeleeWeapon = false;
			}

			local isAllyAOE = isAllyArmedWithMeleeWeapon && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE();
			local isAllyAtIdealWeaponRange = true;

			if (allyZOC != 0 && !isAllyArmedWithMeleeWeapon)
			{
				isAllyAtIdealWeaponRange = false;
			}

			local isAllyFleeing = ally.getMoraleState() == this.Const.MoraleState.Fleeing;
			local isAllyDone = isAllyFleeing || ally.isTurnDone() || ally.getFatiguePct() >= 0.8 && _entity.getFatiguePct() <= 0.5 || ally.getCurrentProperties().IsStunned || !ally.getCurrentProperties().IsAbleToUseWeaponSkills;
			local isAllyTurnDone = isAllyFleeing || ally.isTurnDone() || ally.getCurrentProperties().IsStunned || !ally.getCurrentProperties().IsAbleToUseWeaponSkills;
			local isAllyArmedWithShield = ally.isArmedWithShield();
			local allyHitpointRatio = (ally.getHitpoints() + ally.getArmor(this.Const.BodyPart.Body) + ally.getArmor(this.Const.BodyPart.Head)) / (ally.getHitpointsMax() + ally.getArmorMax(this.Const.BodyPart.Body) + ally.getArmorMax(this.Const.BodyPart.Head));

			if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
			{
				score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;
			}
			else if (!isAllyValuable && !isAllyFleeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
			{
				score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;

				if (isEntityRangedUnit)
				{
					score = score * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
				}
			}

			if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && !isAllyAOE && allyZOC > zoc + 2)
			{
				score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}
			else if (!isAllyValuable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && !isEntityAOE && zoc > allyZOC + 2)
			{
				score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}

			if (!isOffensive && !isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio - 0.2 && allyZOC > zoc + 1)
			{
				score = score * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
			}
			else if (!isOffensive && !isAllyValuable && !isAllyFleeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio + 0.2 && zoc > allyZOC + 1)
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

			if (zoc == 0 && allyZOC >= 3 && isEntityAOE && !isAllyAOE && _entity.getActionPoints() >= 9 && isAllyTurnDone)
			{
				score = score * this.Const.AI.Behavior.RotationAOEMult;
			}
			else if (zoc >= 3 && allyZOC == 0 && !isEntityAOE && isAllyAOE && !isAllyTurnDone)
			{
				score = score * this.Const.AI.Behavior.RotationAOEMult;
			}

			if (isOffensive && _entity.getActionPoints() >= 9)
			{
				local potentialTargets = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), 1, ally.getTile());
				local bestTarget = this.queryBestMeleeTarget(_entity, null, potentialTargets);

				if (!(zoc == 0 && bestTarget.Target != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).m.TargetActor != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).m.TargetActor.getID() == bestTarget.Target.getID()))
				{
					if (isAllyDone && !isEntityTwoHanded && bestTarget.Score > currentBestTarget.Score * 2.0 || isAllyDone && isEntityTwoHanded && bestTarget.Score > currentBestTarget.Score * 1.5 || bestTarget.Score > currentBestTarget.Score * 3.0)
					{
						score = score * (this.Const.AI.Behavior.RotationOffensiveMult + bestTarget.Score);
					}
				}
			}
			else if (isOffensive && _entity.getActionPoints() <= 3 && ally.getActionPoints() >= 9 && !ally.getCurrentProperties().IsStunned && ally.getCurrentProperties().IsAbleToUseWeaponSkills)
			{
				local potentialTargets = this.queryTargetsInMeleeRange(ally.getAIAgent().getProperties().EngageRangeMin, this.Math.max(ally.getIdealRange(), ally.getAIAgent().getProperties().EngageRangeMax), 1, myTile);
				local bestTarget = this.queryBestMeleeTarget(ally, null, potentialTargets);
				local allyPotentialTargets = this.queryTargetsInMeleeRange(ally.getAIAgent().getProperties().EngageRangeMin, this.Math.max(ally.getIdealRange(), ally.getAIAgent().getProperties().EngageRangeMax), 1, ally.getTile());
				local allyBestTarget = this.queryBestMeleeTarget(ally, null, allyPotentialTargets);

				if (bestTarget.Score > allyBestTarget.Score * 2.0)
				{
					score = score * (this.Const.AI.Behavior.RotationOffensiveMult + bestTarget.Score);
				}
			}

			if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;
			}
			else if (!isAllyValuable && !isAllyFleeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;

				if (isEntityRangedUnit)
				{
					reverseScore = reverseScore * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
				}
			}

			if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && !isAllyAOE && allyZOC <= zoc + 2)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}
			else if (!isAllyValuable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && !isEntityAOE && zoc <= allyZOC + 2)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
			}

			if (!isOffensive && !isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio - 0.2 && allyZOC <= zoc + 1)
			{
				reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
			}
			else if (!isOffensive && !isAllyValuable && !isAllyFleeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio + 0.2 && zoc <= allyZOC + 1)
			{
				reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (allyHitpointRatio - hitpointRatio)));
			}

			if (ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc >= allyZOC)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}
			else if (_entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc <= allyZOC)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
			}

			if (allyZOC == 0 && zoc >= 3 && isEntityAOE && !isAllyAOE && !isAllyFleeing && _entity.getActionPoints() >= 9)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationAOEMult;
			}
			else if (allyZOC >= 3 && zoc == 0 && !isEntityAOE && isAllyAOE && !isAllyFleeing)
			{
				reverseScore = reverseScore * this.Const.AI.Behavior.RotationAOEMult;
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

		if (this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).getScore() * 2.0 >= this.Const.AI.Behavior.Score.Rotation * scoreMult)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

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
			this.getAgent().declareEvaluationDelay(2000);
			this.getAgent().declareAction();
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});

