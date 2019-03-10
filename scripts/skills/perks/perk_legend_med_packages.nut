this.perk_legend_med_packages <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_med_packages";
		this.m.Name = this.Const.Strings.PerkName.LegendMedPackages;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMedPackages;
		this.m.Icon = "ui/perks/MaxMedsT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Medicine
		stashSize += 10; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Medicine
		stashSize -= 10; 
	}
});
