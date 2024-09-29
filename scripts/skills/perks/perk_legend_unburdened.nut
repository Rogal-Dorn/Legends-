this.perk_legend_unburdened <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_unburdened";
		this.m.Name = this.Const.Strings.PerkName.LegendUnburdened;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUnburdened;
		this.m.Description = "";
		this.m.Icon = "ui/perks/meek.png";
		this.m.IconMini = "mini_meek";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk | this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.unburdened_footwork"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/unburdened_footwork"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.unburdened_footwork");
	}
  
});
