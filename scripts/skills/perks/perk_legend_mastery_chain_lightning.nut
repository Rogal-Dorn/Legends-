// Chain Lightning Perk - increase range and hit chance
// TODO strings.nut
this.perk_legend_mastery_chain_lightning <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_chain_lightning";
		this.m.Name = this.Const.Strings.PerkName.LegendMasteryChainLightning;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMasteryChainLightning;
		this.m.Icon = "ui/perks/lightning_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});