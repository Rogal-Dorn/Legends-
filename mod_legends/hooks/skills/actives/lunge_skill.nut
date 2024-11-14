::mods_hookExactClass("skills/actives/lunge_skill", function(o)
{
	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		local tooltip = getTooltip();
		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSwords)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] chance to hit due to sword specialisation"
			});
		}

		return tooltip;
	}

	local onAnySkillUsed = o.onAnySkillUsed;
	o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
	{
		onAnySkillUsed(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSwords)
			{
				_properties.MeleeSkill += 5;
			}
		}
	}
});
