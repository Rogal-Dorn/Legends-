::mods_hookExactClass("skills/actives/prong_skill", function(o)
{
	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		local tooltip = getTooltip();
		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpearThrust)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] damage due to thrust specialisation"
			});
		}

		return tooltip;
	}

	local onAnySkillUsed = o.onAnySkillUsed;
	o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
	{
		onAnySkillUsed( _skill, _targetEntity, _properties );
		if (_skill == this)
		{
			if (_properties.IsSpecializedInSpearThrust)
			{
				_properties.DamageTotalMult *= 1.15;
			}
		}
	}
});
