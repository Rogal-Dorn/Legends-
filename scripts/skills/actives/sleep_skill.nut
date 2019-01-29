this.sleep_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsFake = false
	},
	function setFake( _f )
	{
		this.m.IsFake = _f;

		if (this.m.IsFake)
		{
			this.m.ActionPointCost = 6;
		}
		else
		{
			this.m.ActionPointCost = 6;
		}
	}

	function create()
	{
		this.m.ID = "actives.sleep";
		this.m.Name = "Sleep";
		this.m.Description = "";
		this.m.Icon = "skills/active_116.png";
		this.m.IconDisabled = "skills/active_116.png";
		this.m.Overlay = "active_116";
		this.m.SoundOnUse = [
			"sounds/enemies/alp_sleep_01.wav",
			"sounds/enemies/alp_sleep_02.wav",
			"sounds/enemies/alp_sleep_03.wav",
			"sounds/enemies/alp_sleep_04.wav",
			"sounds/enemies/alp_sleep_05.wav",
			"sounds/enemies/alp_sleep_06.wav",
			"sounds/enemies/alp_sleep_07.wav",
			"sounds/enemies/alp_sleep_08.wav",
			"sounds/enemies/alp_sleep_09.wav",
			"sounds/enemies/alp_sleep_10.wav",
			"sounds/enemies/alp_sleep_11.wav",
			"sounds/enemies/alp_sleep_12.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 600;
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
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 10;
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
		local asleep = 0;

		foreach( o in opponents )
		{
			if (o.Actor.getSkills().hasSkill("effects.sleep"))
			{
				asleep = ++asleep;
			}
		}

		if (opponents.len() > 2 && opponents.len() - asleep <= 1)
		{
			return false;
		}

		return true;
	}

	function isViableTarget( _user, _target )
	{
		if (_target.isAlliedWith(_user))
		{
			return false;
		}

		if (_target.getCurrentProperties().IsStunned)
		{
			return false;
		}

		if (_target.isNonCombatant())
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
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 600, this.onDelayedEffect.bindenv(this), tag);
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local targets = [];
		local stacks = 0;
		local _targetTile = _tag.TargetTile;
		local _user = _tag.User;

		if (_targetTile.IsOccupiedByActor)
		{
			local entity = _targetTile.getEntity();

			if (this.isViableTarget(_user, entity))
			{
				targets.push(entity);
			}
		}

		for( local i = 0; i < 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local adjacent = _targetTile.getNextTile(i);

				if (adjacent.IsOccupiedByActor)
				{
					local entity = adjacent.getEntity();

					if (this.isViableTarget(_user, entity))
					{
						targets.push(entity);
					}
				}
			}
		}

		local myTile = _user.getTile();

		foreach( target in targets )
		{
			local bonus = myTile.getDistanceTo(target.getTile()) == 1 ? -10 : 0;

			if (this.m.IsFake || target.checkMorale(0, -25 + bonus, this.Const.MoraleCheckType.MentalAttack))
			{
				if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists the urge to sleep thanks to his resolve");
				}

				continue;
			}

			stacks = ++stacks;
			target.getSkills().add(this.new("scripts/skills/effects/sleeping_effect"));

			if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " falls to sleep");
			}
		}

		_user.addStacks(stacks);
	}

});
