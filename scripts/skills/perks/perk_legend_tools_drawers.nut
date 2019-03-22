this.perk_legend_tools_drawers <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_tools_drawers";
		this.m.Name = this.Const.Strings.PerkName.LegendToolsDrawers;
		this.m.Description = this.Const.Strings.PerkDescription.LegendToolsDrawers;
		this.m.Icon = "ui/perks/MaxToolsT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].ArmorParts
		stashSize += 10; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].ArmorParts
		stashSize -= 10; 
	}
});
