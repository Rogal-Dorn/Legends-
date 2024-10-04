// Hailstone Perk - increase hailstone base da
this.perk_legend_mastery_hailstone <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_hailstone";
		this.m.Name = this.Const.Strings.PerkName.LegendMasteryHailstone;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMasteryHailstone;
		this.m.Icon = "ui/perks/mage_legend_magic_hailstone_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});