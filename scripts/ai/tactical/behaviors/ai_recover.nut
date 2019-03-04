this.ai_recover <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.recover"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Recover;
		this.m.Order = this.Const.AI.Behavior.Order.Recover;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getFatigue() < _entity.getFatigueMax() / 2)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local inZonesOfControl = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

		if (inZonesOfControl != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local numAttacksLastTurn = _entity.getAttackedCount();

		if (numAttacksLastTurn > 1)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local scoreMult = _entity.getFatigue() / (_entity.getFatigueMax() * 1.0);
		return this.Const.AI.Behavior.Score.Recover * scoreMult;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Recover!");
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		return true;
	}

});

