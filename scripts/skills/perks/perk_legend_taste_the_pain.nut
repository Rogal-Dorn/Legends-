this.perk_legend_taste_the_pain <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_taste_the_pain";
		this.m.Name = this.Const.Strings.PerkName.LegendTasteThePain;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTasteThePain;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


});
