this.perk_legend_unburdened <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_unburdened";
		this.m.Name = this.Const.Strings.PerkName.LegendUnburdened;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUnburdened;
		this.m.Icon = "ui/perks/meek.png";
		this.m.IconMini = "mini_meek";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk | this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}  
});
