this.perk_legend_skillful_stacking <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_skillful_stacking";
		this.m.Name = this.Const.Strings.PerkName.LegendSkillfulStacking;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSkillfulStacking;
		this.m.Icon = "ui/perks/MaxStashT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Stash
		stashSize += 10; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Stash
		stashSize -= 10; 
	}
});
