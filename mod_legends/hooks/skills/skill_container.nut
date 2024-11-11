::mods_hookNewObject("skills/skill_container", function ( o )
{
	o.removeByID = function( _skillID )
	{
		if (!this.m.IsUpdating)
		{
			this.m.IsUpdating = true;
			local isRemoved = false;

			foreach( i, skill in this.m.Skills )
			{
				if (skill.getID() == _skillID && !skill.isGarbage())
				{
					skill.onRemoved();
					skill.setContainer(null);
					this.m.Skills.remove(i);
					// this.logDebug("Skill [" + skill.getName() + "] removed from [" + this.m.Actor.getName() + "].");
					isRemoved = true;
					break;
				}
			}

			this.m.IsUpdating = false;

			if (isRemoved)
			{
				this.update();
			}
		}
		else
		{
			foreach( i, skill in this.m.Skills )
			{
				if (skill.getID() == _skillID)
				{
					skill.removeSelf();
					break;
				}
			}
		}
	}

	o.collectGarbage = function( _performUpdate = true )
	{
		if (this.m.IsUpdating)
		{
			return;
		}

		if (this.m.Skills.len() == 0 && this.m.SkillsToAdd.len() == 0)
		{
			return;
		}

		this.m.IsUpdating = true;
		local garbage = [];

		foreach( i, skill in this.m.Skills )
		{
			if (skill.isGarbage())
			{
				garbage.push(i);
			}
		}

		_performUpdate = _performUpdate && (garbage.len() != 0 || this.m.SkillsToAdd.len() != 0);
		garbage.reverse();

		foreach( i in garbage )
		{
			this.m.Skills[i].onRemoved();
			this.m.Skills[i].setContainer(null);
			// this.logDebug("Skill [" + this.m.Skills[i].getName() + "] removed from [" + this.m.Actor.getName() + "].");
			this.m.Skills.remove(i);
		}

		garbage.clear();

		if (this.m.SkillsToAdd.len() != 0)
		{
			foreach( skill in this.m.SkillsToAdd )
			{
				this.m.Skills.push(skill);
				skill.onAdded();
				skill.m.IsNew = false;
			}

			this.m.SkillsToAdd.clear();
			this.m.Skills.sort(this.compareSkillsByOrder);
		}

		this.m.IsUpdating = false;

		if (_performUpdate)
		{
			this.update();
		}
	}

	o.MovementCompleted <- function( _tile )
	{
		if (!this.m.Actor.isAlive())
		{
			return;
		}

		foreach( skill in this.m.Skills )
		{
			skill.onMovementCompleted(_tile);
		}
	}

	o.buildPropertiesForUse = function( _caller, _targetEntity )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onAnySkillUsed(_caller, _targetEntity, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}

	o.buildPropertiesForDefense = function( _attacker, _skill )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onBeingAttacked(_attacker, _skill, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}

	o.buildPropertiesForBeingHit = function( _attacker, _skill, _hitInfo )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onBeforeDamageReceived(_attacker, _skill, _hitInfo, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}
});
