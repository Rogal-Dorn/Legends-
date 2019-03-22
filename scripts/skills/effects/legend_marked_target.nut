this.legend_marked_target <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_marked_target";
		this.m.Name = "Marked target";
		this.m.Description = "This character has been marked by a skilled opponent, ranged attacks are more likely to hit";
		this.m.Icon = "skills/coordinated_volleys_circle.png";
		this.m.IconMini = "mini_coordinated_volleys_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.RangedDefense -= 20;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
