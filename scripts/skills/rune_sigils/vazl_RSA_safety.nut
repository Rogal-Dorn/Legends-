this.vazl_RSA_safety <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.vazl_RSA_safety";
		this.m.Name = "Rune Sigil: Safety";
		this.m.Description = "Rune Sigil: Safety";
		this.m.Icon = "ui/rune_sigils/vazl_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function onUpdate (_properties)
	{
		_properties.HitpointsMult *= 1.05;
		_properties.DamageReceivedTotalMult *= 0.95;
	}
});
