this.legend_coordinating_volleys <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_coordinating_volleys";
		this.m.Name = "Coordinating volleys";
		this.m.Description = "Fire on my mark! An inspirational leader is guiding this characters shots.";
		this.m.Icon = "skills/coordinated_volleys_circle.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.RangedSkill += 10;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
