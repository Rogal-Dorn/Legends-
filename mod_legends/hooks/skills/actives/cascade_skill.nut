::mods_hookExactClass("skills/actives/cascade_skill", function(o)
{
	o.getTooltip = function ()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will make three separate strikes for half of the weapon\'s damage each"
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignores the bonus to Melee Defense granted by shields"
			}
		]);
		return ret;
	}

	local onUse = o.onUse;
	o.onUse = function ( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectChop);
		local target = _targetTile.getEntity();
		local ret = this.attackEntity(_user, target);

		if (!target.isAlive() || target.isDying()) //very rarely something will die to a cascade due to an AOO this should fix it
		{
			return ret;
		}
		onUse( _user, _targetTile );
	}
});
