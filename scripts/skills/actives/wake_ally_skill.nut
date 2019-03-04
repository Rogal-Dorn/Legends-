this.wake_ally_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.wake_ally";
		this.m.Name = "Wake Ally";
		this.m.Description = "Forcibly wake a nearby ally from unnatural sleep.";
		this.m.Icon = "skills/active_118.png";
		this.m.IconDisabled = "skills/active_118_sw.png";
		this.m.Overlay = "active_118";
		this.m.SoundOnUse = [
			"sounds/combat/first_aid_01.wav",
			"sounds/combat/first_aid_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.IsHidden = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Removes the Sleeping and Nightmares status effects"
			}
		];
		return ret;
	}

	function isHidden()
	{
		local actor = this.getContainer().getActor();

		if (this.Tactical.isActive() && actor.isPlacedOnMap())
		{
			local hasTarget = false;
			local myTile = actor.getTile();

			for( local i = 0; i < 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = myTile.getNextTile(i);

					if (this.Math.abs(tile.Level - myTile.Level) <= 1 && tile.IsOccupiedByActor && (tile.getEntity().getSkills().hasSkill("effects.sleeping") || tile.getEntity().getSkills().hasSkill("effects.nightmare")))
					{
						hasTarget = true;
						break;
					}
				}
			}

			if (hasTarget)
			{
				return false;
			}
		}

		return this.skill.isHidden();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getSkills().hasSkill("effects.sleeping") || target.getSkills().hasSkill("effects.nightmare"))
		{
			return true;
		}

		return false;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		this.spawnIcon("status_effect_83", _targetTile);
		target.getSkills().removeByID("effects.sleeping");
		target.getSkills().removeByID("effects.nightmare");
		target.setDirty(true);
		return true;
	}

});

