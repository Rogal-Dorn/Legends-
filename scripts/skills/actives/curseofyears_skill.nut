this.curseofyears_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0
	},
	function create()
	{
		this.m.ID = "actives.curseofyears";
		this.m.Name = "Curse of Years";
		this.m.Description = "The Wizard spits out an ancient curse, causing his enemies to age at an incredible rate - their hair turning white and skin shrivelling up. ";
		this.m.Icon = "skills/active_117.png";
		this.m.IconDisabled = "skills/active_117_sw.png";
		this.m.Overlay = "active_117";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/alp_nightmare_01.wav",
			"sounds/enemies/dlc2/alp_nightmare_02.wav",
			"sounds/enemies/dlc2/alp_nightmare_03.wav",
			"sounds/enemies/dlc2/alp_nightmare_04.wav",
			"sounds/enemies/dlc2/alp_nightmare_05.wav",
			"sounds/enemies/dlc2/alp_nightmare_06.wav"
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
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 6;
	}

	function getTooltip()
	{

		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The damage will etermine in the next turn ,has [color=" + this.Const.UI.Color.PositiveValue + "]17%[/color] suffers a Wound At the next phase has [color=" + this.Const.UI.Color.PositiveValue + "]33%[/color] and so on,to a maximun of [color=" + this.Const.UI.Color.PositiveValue + "]83%[/color] .No armour saves are allowed against Wounds caused by Curse of Years"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Before target Actvation,has [color=" + this.Const.UI.Color.DamageValue + "]30%[/color] chance break effect"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Skill has [color=" + this.Const.UI.Color.DamageValue + "]4[/color]  trun cooldwon"
			}
		];
		return ret;
	}

	function isUsable()
	{
		return this.m.Cooldown == 0 && this.skill.isUsable();

		local actor = this.getContainer().getActor();
		local opponents = actor.getAIAgent().getKnownOpponents();
		local curseofyears = 0;

		foreach( o in opponents )
		{
			if (o.Actor.getSkills().hasSkill("effects.curseofyears"))
			{
				curseofyears = ++curseofyears;
			}
		}

		if (opponents.len() > 1 && opponents.len() - curseofyears <= 1)
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
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local tag = {
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		this.m.Cooldown = this.Math.rand(4, 4);
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local _targetTile = _tag.TargetTile;
		local _user = _tag.User;
		local target = _targetTile.getEntity();

		if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " Deid over time");
		}

		target.getSkills().add(this.new("scripts/skills/effects/curseofyears_effect"));
		if ("addStacks" in _user)
		{
			_user.addStacks(5);
		}
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

});

