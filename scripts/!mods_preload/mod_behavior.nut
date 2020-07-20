::mods_hookBaseClass("scripts/ai/tactical/behavior", function(o) {
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

});