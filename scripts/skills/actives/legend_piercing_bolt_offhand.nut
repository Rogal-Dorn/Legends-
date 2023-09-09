this.legend_piercing_bolt_offhand <- this.inherit("scripts/skills/actives/legend_piercing_bolt", {
	m = {},
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			this.factoringOffhandBonuses(_properties);
			this.legend_piercing_bolt.onAnySkillUsed(_skill, _targetEntity, _properties);
		}
	}
});
