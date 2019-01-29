this.nightmare_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.nightmare";
		this.m.Name = "Nightmare";
		this.m.Description = "";
		this.m.Icon = "skills/active_117.png";
		this.m.IconDisabled = "skills/active_117.png";
		this.m.Overlay = "active_117";
		this.m.SoundOnUse = [
			"sounds/enemies/alp_nightmare_01.wav",
			"sounds/enemies/alp_nightmare_02.wav",
			"sounds/enemies/alp_nightmare_03.wav",
			"sounds/enemies/alp_nightmare_04.wav",
			"sounds/enemies/alp_nightmare_05.wav",
			"sounds/enemies/alp_nightmare_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 8;
		this.m.MinRange = 1;
		this.m.MaxRange = 12;
		this.m.MaxLevelDifference = 4;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		local actor = this.getContainer().getActor();
		local opponents = actor.getAIAgent().getKnownOpponents();
		local nightmares = 0;

		foreach( o in opponents )
		{
			if (o.Actor.getSkills().hasSkill("effects.nightmare"))
			{
				nightmares = ++nightmares;
			}
		}

		if (opponents.len() > 1 && opponents.len() - nightmares <= 1)
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (_targetTile.getEntity().isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}

		local sleeping = _targetTile.getEntity().getSkills().getSkillByID("effects.sleeping");

		if (sleeping == null || sleeping.getTurnApplied() == this.Time.getRound())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local tag = {
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local _targetTile = _tag.TargetTile;
		local _user = _tag.User;
		local target = _targetTile.getEntity();
		target.checkMorale(-1, -25, this.Const.MoraleCheckType.MentalAttack);

		if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " enters a world of nightmares");
		}

		target.getSkills().removeByID("effects.sleeping");
		target.getSkills().add(this.new("scripts/skills/effects/nightmare_effect"));
		_user.addStacks(5);
	}

});
