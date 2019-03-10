this.perk_legend_med_ingredients <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_med_ingredients";
		this.m.Name = this.Const.Strings.PerkName.LegendMedIngredients;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMedIngredients;
		this.m.Icon = "ui/perks/MaxMedsT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Medicine
		stashSize += 20; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Medicine
		stashSize -= 20; 
	}
});
