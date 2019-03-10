this.perk_legend_efficient_packing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_efficient_packing";
		this.m.Name = this.Const.Strings.PerkName.LegendEfficientPacking;
		this.m.Description = this.Const.Strings.PerkDescription.LegendEfficientPacking;
		this.m.Icon = "ui/perks/MaxStashT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Stash
		stashSize += 5; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Stash
		stashSize -= 5; 
	}
});
