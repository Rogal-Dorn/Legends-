this.perk_legend_master_anger <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_master_anger";
		this.m.Name = this.Const.Strings.PerkName.LegendMasterAnger;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMasterAnger;
		this.m.Icon = "ui/perks/master_anger.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


});
