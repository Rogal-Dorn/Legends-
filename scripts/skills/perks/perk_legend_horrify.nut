this.perk_legend_horrify <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horrify";
		this.m.Name = this.Const.Strings.PerkName.LegendHorrify;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorrify;
		this.m.Icon = "skills/active_101.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_horrify"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_horrify"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_horrify");
	}

});
