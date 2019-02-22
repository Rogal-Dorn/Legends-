this.legend_nightvision <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_nightvision";
		this.m.Name = "Night Vision";
		this.m.Description = "Use your superior vision to pick out enemies in the dark";
		this.m.Icon = "skills/nightvision_square.png";
		this.m.IconDisabled = "skills/nightvision_square_bw.png";
		this.m.Overlay = "nightvision_square";
		this.m.SoundOnUse = [
			"sounds/enemies/shaman_skill_nightvision_01.wav",
			"sounds/enemies/shaman_skill_nightvision_02.wav",
			"sounds/enemies/shaman_skill_nightvision_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
		this.m.MaxLevelDifference = 8;
	}

	function isViableTarget( _user, _target )
	{
		if (!_target.isAlliedWith(_user))
		{
			return false;
		}

		if (!_target.getCurrentProperties().IsAffectedByNight || !_target.getSkills().hasSkill("special.night"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targets = [];

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

		foreach( target in targets )
		{
			this.spawnIcon("status_effect_98", target.getTile());
			target.getSkills().removeByID("special.night");
		}

		if (!_user.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " casts Grant Night Vision");
		}

		return true;
	}

});
