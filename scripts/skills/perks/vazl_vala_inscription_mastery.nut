this.vazl_vala_inscription_mastery <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.vazl_vala_inscription_mastery";
		this.m.Name = this.Const.Strings.PerkName.vazl_ValaInscriptionMastery;
		this.m.Description = this.Const.Strings.PerkDescription.vazl_ValaInscriptionMastery;
		this.m.Icon = "ui/perks/vazl_vala_inscription_mastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});
