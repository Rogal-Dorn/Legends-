this.perk_legend_unarmed_training <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_unarmed_training";
		this.m.Name = this.Const.Strings.PerkName.LegendUnarmedTraining;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUnarmedTraining;
		this.m.Icon = "ui/perks/perk_10.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


});

