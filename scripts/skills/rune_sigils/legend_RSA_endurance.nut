this.legend_RSA_endurance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_RSA_endurance";
		this.m.Name = "Rune Sigil: Endurance";
		this.m.Description = "Rune Sigil: Endurance";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function onUpdate (_properties)
	{
		_properties.FatigueRecoveryRate += 1;
		_properties.FatigueEffectMult *= 0.9;
	}
});
