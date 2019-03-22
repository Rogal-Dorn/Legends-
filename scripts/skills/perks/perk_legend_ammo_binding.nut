this.perk_legend_ammo_binding <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_ammo_binding";
		this.m.Name = this.Const.Strings.PerkName.LegendAmmoBinding;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAmmoBinding;
		this.m.Icon = "ui/perks/MaxAmmoT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Ammo
		stashSize += 10; 

	}
		function onRemoved()
	{
		local stashSize = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Ammo
		stashSize -= 10; 
	}
});
