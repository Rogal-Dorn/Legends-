::mods_hookExactClass("skills/actives/fling_back_skill", function(o)
{
	local onPerformAttack = o.onPerformAttack;
	o.onPerformAttack = function ( _tag )
	{
		local _targetTile = _tag.TargetTile;
		local target = _targetTile.getEntity();
		if (target == null)
		{
			return false;
		}

		return onPerformAttack( _tag );
	}
});
