this.vazl_RSA_resilience <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.vazl_RSA_resilience";
		this.m.Name = "Rune Sigil: Resilience";
		this.m.Description = "Rune Sigil: Resilience";
		this.m.Icon = "ui/rune_sigils/vazl_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]Immune[/color] to stuns, knockbacks and grabs"
		});
		return ret;
	}


	function onUpdate (_properties)
	{
		_properties.IsImmuneToStun = true;
		_properties.IsImmuneToKnockBackAndGrab = true;
	}
});
