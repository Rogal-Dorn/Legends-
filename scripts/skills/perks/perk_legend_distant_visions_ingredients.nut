this.perk_legend_distant_visions_ingredients <- this.inherit("scripts/skills/skill", {
	m = {
		Amount = 10
	},
	function create()
	{
		this.m.ID = "perk.legend_distant_visions_ingredients";
		this.m.Name = this.Const.Strings.PerkName.LegendDistantVisionsIngredients;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDistantVisionsIngredients;
		this.m.Icon = "ui/perks/MaxMedsT2.png"; //todo: icon
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Amount;
	}

});
