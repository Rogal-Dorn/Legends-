this.perk_legend_clarity<- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_clarity";
		this.m.Name = this.Const.Strings.PerkName.LegendClarity;
		this.m.Description = this.Const.Strings.PerkDescription.LegendClarity;
		this.m.Icon = "ui/perks/clarity_circle.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.getContainer().getActor().getBaseProperties().ActionPoints += 1;
	}

	function onRemoved()
	{
		this.getContainer().getActor().getBaseProperties().ActionPoints -= 1;
	}

});

