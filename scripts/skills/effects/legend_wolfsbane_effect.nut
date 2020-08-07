this.legend_wolfsbane_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_wolfsbane";
		this.m.Name = "Wolfsbane Scent";
		this.m.Icon = "ui/perks/herbs_circle.png";
		this.m.IconMini = "status_effect_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "this character smells like wolfsbane and can not be transformed into a were creature";
	}
	



});

