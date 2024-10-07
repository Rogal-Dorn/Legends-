::mods_hookExactClass("skills/actives/fling_back_skill", function(o)
{
	local onPerformAttack = o.onPerformAttack;
	function onPerformAttack( _tag )
	{
		local _targetTile = _tag.TargetTile;
		local target = _targetTile.getEntity();
		if (target == null)
		{
			return false;
		}

		onPerformAttack( _tag ); 
	}
});
