this.legend_small_pack_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_small_pack";
		this.m.Name = "Carrying Small Pack";
		this.m.Description = "This character is providing 3 extra stash spaces";
		this.m.Icon = "skills/status_effect_56.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
	}

});
