this.legend_holding_the_line <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_holding_the_line";
		this.m.Name = "Holding the line";
		this.m.Description = "You can hold! An inspirational leader has encouraged this character to defend.";
		this.m.Icon = "skills/holdtheline_square.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.MeleeDefence += 10;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
