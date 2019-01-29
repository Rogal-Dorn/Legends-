this.ai_switch_position <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		Target = null,
		IsSpent = false
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.SwitchPosition;
		this.m.Order = this.Const.AI.Behavior.Order.SwitchPosition;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (this.m.IsSpent)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getHitpointsPct() < 1.0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.isKindOf(_entity, "alp_illusion"))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getTile().IsVisibleForPlayer)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local closest = 9000;
		local targets = this.getAgent().getKnownOpponents();

		foreach( t in targets )
		{
			local d = t.Actor.getTile().getDistanceTo(myTile);

			if (d < closest)
			{
				closest = d;
			}
		}

		if (closest >= 8)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local allies = this.getAgent().getKnownAllies();
		local potentialTargets = [];

		foreach( ally in allies )
		{
			local allyTile = ally.getTile();

			if (!allyTile.IsVisibleForPlayer && this.isKindOf(ally, "alp_illusion"))
			{
				local enemyTooClose = false;

				foreach( t in targets )
				{
					local d = t.Actor.getTile().getDistanceTo(allyTile);

					if (d < closest)
					{
						enemyTooClose = true;
						break;
					}
				}

				if (enemyTooClose)
				{
					continue;
				}

				potentialTargets.push(ally);
			}
		}

		if (potentialTargets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Target = potentialTargets[this.Math.rand(0, potentialTargets.len() - 1)];
		return this.Const.AI.Behavior.Score.SwitchPosition * scoreMult;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Switching Position");
		}

		this.Tactical.getNavigator().switchEntities(_entity, this.m.Target, null, null, 1000.0);
		this.m.Target.getSprite("head").setBrush(_entity.getSprite("head").getBrush().Name);
		this.m.Target.getSprite("blur_1_head").setBrush(_entity.getSprite("blur_1_head").getBrush().Name);
		this.m.Target.getSprite("blur_2_head").setBrush(_entity.getSprite("blur_2_head").getBrush().Name);
		this.m.Target.getSprite("blur_3_head").setBrush(_entity.getSprite("blur_3_head").getBrush().Name);
		this.m.Target.setStacks(_entity.getStacks());
		this.m.Target.setMoraleState(_entity.getMoraleState());
		this.m.Target.setDirty(true);
		this.m.Target = null;
		this.m.IsSpent = true;
		return true;
	}

	function onTurnStarted()
	{
		this.m.IsSpent = false;
	}

});
