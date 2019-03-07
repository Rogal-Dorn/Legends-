this.vazl_vala_spiritual_bond <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.vazl_vala_spiritual_bond";
		this.m.Name = this.Const.Strings.PerkName.vazl_ValaSpiritualBond;
		this.m.Description = this.Const.Strings.PerkDescription.vazl_ValaSpiritualBond;
		this.m.Icon = "ui/perks/vazl_vala_spiritual_bond.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});
