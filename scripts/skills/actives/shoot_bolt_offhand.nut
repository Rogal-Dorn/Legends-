this.shoot_bolt_offhand <- this.inherit("scripts/skills/actives/shoot_bolt", {
	m = {},
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			this.factoringOffhandBonuses(_properties);
			this.shoot_bolt.onAnySkillUsed(_skill, _targetEntity, _properties);
		}
	}

});

