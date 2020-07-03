this.legend_perk_scroll_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.perk_scroll";
		this.m.Name = "Perk Scroll Effect";
		this.m.Description = "Perk Scroll Effect";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png"; //don't actually need an icon for this
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}
});
