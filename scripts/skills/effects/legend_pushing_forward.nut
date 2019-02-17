this.legend_pushing_forward <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_pushing_forward";
		this.m.Name = "Pushing Forward";
		this.m.Description = "Into the Breach! An inspirational leader is guiding this character/'s attacks.";
		this.m.Icon = "skills/spears_circle.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.MeleeSkill += 10;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
