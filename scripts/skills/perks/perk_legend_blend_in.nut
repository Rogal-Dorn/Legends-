this.perk_legend_blend_in <- this.inherit("scripts/skills/skill", {
	m = {},

	function create()
	{
		this.m.ID = "perk.legend_blend_in";
		this.m.Name = this.Const.Strings.PerkName.LegendBlendIn;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBlendIn;
		this.m.Icon = "ui/perks/blend_in_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local skill = this.new("scripts/skills/effects/legend_blend_in_effect");
		skill.m.MeekStacks = 1;
		this.getContainer().add(skill);
	}

	function onRemoved()
	{
		this.getContainer().removeByID("effects.legend_blend_in");
	}
  
});
