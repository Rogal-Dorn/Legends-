this.perk_legend_assured_conquest <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_assured_conquest";
		this.m.Name = this.Const.Strings.PerkName.LegendAssuredConquest;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAssuredConquest;
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Steady)
		{
		_properties.MeleeSkill *= 1.1;
		_properties.MeleeDefense *= 1.1;
		_properties.RangedDefense *= 1.1;
		}
	}

});
