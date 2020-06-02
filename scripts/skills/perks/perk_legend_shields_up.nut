this.perk_legend_shields_up <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_shields_up";
		this.m.Name = this.Const.Strings.PerkName.LegendShieldsUp;
		this.m.Description = this.Const.Strings.PerkDescription.LegendShieldsUp;
		this.m.Icon = "ui/perks/holdtheline_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}



});
