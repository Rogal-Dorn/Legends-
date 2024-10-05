::mods_hookExactClass("skills/perks/perk_mastery_throwing", function(o) {
	o.m.EligibleSkills <-
	[
		"actives.throw_axe",
		"actives.throw_balls",
		"actives.throw_javelin",
		"actives.throw_spear"
		"actives.legend_throw_knife",

	];

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		if (_skill.isRanged())
		{
			local d = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());
			foreach (skill in this.m.EligibleSkills)
			{
				if (_skill.getID() == skill)
				{
					if (d <= 2)
					{
						_properties.DamageTotalMult *= 1.3;
					}
					else if (d <= 3)
					{
						_properties.DamageTotalMult *= 1.2;
					}
					break;
				}
			}
		}
	}
});