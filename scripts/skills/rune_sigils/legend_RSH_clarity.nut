this.legend_RSH_clarity <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_RSH_clarity";
		this.m.Name = "Rune Sigil: Clarity";
		this.m.Description = "Rune Sigil: Clarity";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function onUpdate (_properties)
	{
		_properties.Vision += this.Math.round(1.0 + (this.m.Item.RuneMultiplier / 10.0));
		_properties.XPGainMult *= 1.08 + (this.m.Item.RuneMultiplier / 100.0);
	}
});
