this.perk_legend_perk_scroll_ingredients <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_perk_scroll_ingredients";
		this.m.Name = this.Const.Strings.PerkName.LegendPerkScrollIngredients;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPerkScrollIngredients;
		this.m.Icon = "ui/perks/scroll_circle.png"; //todo iconn
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});
