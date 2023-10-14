this.super_sleep_skill <- this.inherit("scripts/skills/actives/sleep_skill", {
	m = {},
	function create()
	{
		this.sleep_skill.create();
		this.m.ActionPointCost = 6;
	}

	function onDelayedEffect( _tag )
	{
		local targets = [];
		local _targetTile = _tag.TargetTile;
		local _user = _tag.User;

		if (_targetTile.IsOccupiedByActor)
		{
			local entity = _targetTile.getEntity();
			targets.push(entity);
		}

		local myTile = _user.getTile();

		foreach( target in targets )
		{
			local bonus = this.m.MaxRange + 1 - myTile.getDistanceTo(target.getTile());

			if (target.checkMorale(0, -75 * bonus, this.Const.MoraleCheckType.MentalAttack))
			{
				if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists the urge to sleep thanks to his resolve");
				}

				continue;
			}

			target.getSkills().add(this.new("scripts/skills/effects/sleeping_effect"));

			if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " falls to sleep");
			}
		}
	}

});

