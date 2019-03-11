this.perk_legend_barter_convincing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_barter_convincing";
		this.m.Name = this.Const.Strings.PerkName.LegendBarterConvincing;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBarterConvincing;
		this.m.Icon = "ui/perks/BarterT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local BarterMod = this.Const.LegendMod.getBarterModifier;
		BarterMod += 0.05; 

	}
		function onRemoved()
	{
		local BarterMod = this.Const.LegendMod.getBarterModifier;
		BarterMod -= 0.05; 
	}
});
