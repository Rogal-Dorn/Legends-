::mods_hookBaseClass("ai/tactical/behavior", function(o) {
    while(!("IsShieldwallAvailable" in o.m)) o = o[o.SuperName]; // find the base class

    o.isRangedUnit = function( _entity)
	{
        if (_entity == null)
        {
            return false
        }

        if (!("hasRangedWeapon" in _entity))
        {
            return false
        }
		local hasRangedWeapon = _entity.hasRangedWeapon();
		if (hasRangedWeapon && _entity.getCurrentProperties().getVision() > 4 && (_entity.isPlayerControlled() && _entity.getCurrentProperties().RangedSkill >= 45 || !_entity.isPlayerControlled() && _entity.getAIAgent().getProperties().IsRangedUnit))
		{
			return true;
		}

		return false;
	}


	o.queryBestMeleeTarget = function( _entity, _skill, _targets )
	{
		local bestTarget;
		local hasPriority = false;
		local bestScore = -9000;
		local ret = {
			Score = 0.0,
			Target = null
		};

		if (this.getAgent().getForcedOpponent() != null)
		{
			foreach (target in _targets)
			{
				if (this.getAgent().getForcedOpponent().getID() == target.getID())
				{
					hasPriority = true;
				}
			}
		}

		foreach( target in _targets )
		{
			if (_skill != null && !_skill.isUsableOn(target.getTile()))
			{
				continue;
			}

			local score = this.queryTargetValue(_entity, target, _skill);

			if (!hasPriority)
			{
				score = score * 1000;
			}

			if (score > bestScore)
			{
				bestTarget = target;
				bestScore = score;
			}
		}

		if (bestTarget != null)
		{
			ret.Score = bestScore;
			ret.Target = bestTarget;
		}

		return ret;
	}

});
