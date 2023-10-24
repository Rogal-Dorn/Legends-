this.super_nightmare_skill <- this.inherit("scripts/skills/actives/nightmare_skill", {
	m = {},
	function create()
	{
		this.nightmare_skill.create();
		this.m.ActionPointCost = 6;
	}

	function getDamage( _actor )
	{
		return this.nightmare_skill.getDamage(_actor) * 2.0;
	}

	function onDelayedEffect( _tag )
	{
		local target = _tag.TargetTile.getEntity();

		if (!target.checkMorale(0, -35, this.Const.MoraleCheckType.MentalAttack))
		{
			target.getSkills().add(this.new("scripts/skills/effects/horrified_effect"));

			if (!_tag.User.isHiddenToPlayer() && !target.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " is horrified");
			}
		}

		this.nightmare_skill.onDelayedEffect(_tag);
	}

});
