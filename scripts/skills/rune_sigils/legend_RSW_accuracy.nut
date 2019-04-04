this.legend_RSW_accuracy <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_RSW_accuracy";
		this.m.Name = "Rune Sigil: Accuracy";
		this.m.Description = "Rune Sigil: Accuracy";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function onUpdate (_properties)
	{
		_properties.MeleeSkillMult *= 1.08 + (this.m.Item.RuneMultiplier / 100.0);
		_properties.RangedSkillMult *= 1.08 + (this.m.Item.RuneMultiplier / 100.0);
	}
});
